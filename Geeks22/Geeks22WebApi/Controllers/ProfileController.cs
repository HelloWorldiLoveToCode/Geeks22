using Geeks22WebApi.Models;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Geeks22WebApi.Controllers
{
    public class ProfileController : Controller
    {
        public MyDbContext DbContext { get; set; }
        public ProfileController() => DbContext = new MyDbContext();

     
        [HttpGet]
        public async Task<ActionResult> RetrieveUser(string id)
        {
            var userData = await DbContext.Set<User>().Include(c => c.CreditCard).FirstOrDefaultAsync(u => u.Username.Equals(id));

            var userViewModel = new UserViewModel
            {
                Id = userData.Id,
                Username = userData.Username,
                Password = userData.Password,
                FirstName = userData.FirstName,
                LastName = userData.LastName,
                Email = userData.Email,
                StreetAddress = userData.StreetAddress,
                City = userData.City,
                State = userData.State,
                Zipcode = userData.Zipcode,
                CreditCardId = userData.CreditCardId,
                CreditCardName = userData.CreditCard.Name,
                CreditCardNumber = userData.CreditCard.Number,
                CreditCardExpiration = userData.CreditCard.Expiration,
                CreditCardCVV = userData.CreditCard.CVV,
                IsAdmin = userData.IsAdmin,

            };

            return Json(userViewModel ,JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public async Task<ActionResult> CreateUser(User id)
        {
            var userModel = id;
            //check to see if the username already exists
            if (DbContext.Users.Any(u => u.Username == userModel.Username)) 
            {
                Response.StatusCode = 400;
                Response.Write("Username already exists");
                return null;
            }

            //create a new user with the parameter data
            var newUser = new User
            {
                Username = userModel.Username,
                Password = userModel.Password,
                FirstName = userModel.FirstName,
                LastName = userModel.LastName,
                Email = userModel.Email,
                StreetAddress = userModel.StreetAddress,
                City = userModel.City,
                State = userModel.State,
                Zipcode = userModel.Zipcode,
                IsAdmin = userModel.IsAdmin,
            };

            DbContext.Users.Add(newUser);

            await DbContext.SaveChangesAsync();

            return Json(null, JsonRequestBehavior.AllowGet);
        }

        [HttpPut]
        public async Task<ActionResult> UpdateUser(User id)
        {
            var user = id;

            //mak sure the input is valid
            if (user == null || string.IsNullOrEmpty(user.Username))
            {
                Response.StatusCode = 400;
                Response.Write("Invalid user data.");
                return null;
            }

            //Grab the user profile from the db
            var userToUpdate = await DbContext.Users.FirstOrDefaultAsync(u => u.Username == user.Username);

            //Make sure the user exists in the db
            if(userToUpdate == null)
            {
                Response.StatusCode = 400;
                Response.Write("User does not exist");
                return null;
            }

            //Update the values as long as they are not coming in null
            userToUpdate.Password = user.Password != null ? user.Password : userToUpdate.Password;
            userToUpdate.FirstName = user.FirstName != null ? user.FirstName : userToUpdate.FirstName;
            userToUpdate.LastName = user.LastName != null ? user.LastName : userToUpdate.LastName;
            userToUpdate.Email = user.Email != null ? user.Email : userToUpdate.Email;
            userToUpdate.StreetAddress = user.StreetAddress != null ? user.StreetAddress : userToUpdate.StreetAddress;
            userToUpdate.City = user.City != null ? user.City : userToUpdate.City;
            userToUpdate.State = user.State != null ? user.State : userToUpdate.State;
            userToUpdate.Zipcode = user.Zipcode != null ? user.Zipcode : userToUpdate.Zipcode;
            userToUpdate.IsAdmin = user.IsAdmin;

            //Update the db
            await DbContext.SaveChangesAsync();

            return Json(null, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public async Task<ActionResult> CreateCreditCardForUser(string id, CreditCard id2)
        {
            var username = id;
            var creditCard = id2;

            //Attach to the proper user in the db
            var user = await DbContext.Users.FirstOrDefaultAsync(u => u.Username == username);

            //Make sure it's a valid user
            if (user == null)
            {
                Response.StatusCode = 400;
                Response.Write("User does not exist");
                return null;
            }

            //Create the new credit card object
            var newCreditCard = new CreditCard
            {
                Name = creditCard.Name,
                Number = creditCard.Number,
                Expiration = creditCard.Expiration,
                CVV = creditCard.CVV,
            };

            //Add the Credit card to the db
            DbContext.CreditCards.Add(newCreditCard);

            await DbContext.SaveChangesAsync();

            //Add the credit card to the user
            user.CreditCardId = newCreditCard.Id;

            await DbContext.SaveChangesAsync();

            return Json(null, JsonRequestBehavior.AllowGet);
        }
        
    }
}
