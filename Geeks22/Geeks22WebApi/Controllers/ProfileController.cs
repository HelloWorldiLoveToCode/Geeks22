using Geeks22WebApi.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Geeks22WebApi.Models;
using System.Collections;
using System.Text;
using System.Net.Http;
using System.Net;
using System.Security.Principal;
using System.Web.UI.WebControls;
using System.Web.Http.Results;

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
        
    }
}
