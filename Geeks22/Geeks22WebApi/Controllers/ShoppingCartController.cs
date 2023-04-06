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
    public class ShoppingCartController : Controller
    {
        public MyDbContext DbContext { get; set; }
        public ShoppingCartController() => DbContext = new MyDbContext();

        [HttpGet]
        public async Task<ActionResult> RetrieveUserSubtotal(int id)
        {
            decimal subtotal = 0;

            var shoppingCartItems = await DbContext.Set<ShoppingCart>().AsNoTracking().Include(b => b.Book).Where(s => s.UserId == id).ToListAsync();

            foreach (var shoppingCartItem in shoppingCartItems) subtotal += shoppingCartItem.Book.Price;
            
            return Json(subtotal, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public async Task<ActionResult>AddBook(int id, int id2)
        {
            var bookId = id;
            var userId = id2;

            var cartItem = new ShoppingCart
            {
                BookId    = bookId,
                UserId    = userId,
                CreatedOn = DateTime.Now
            };

            DbContext.ShoppingCarts.Add(cartItem);

            await DbContext.SaveChangesAsync();

            return Json(null, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public async Task<ActionResult> RetrieveUserBookList(int id)
        {
            var shoppingCartItems = await DbContext.Set<ShoppingCart>()
                .AsNoTracking()
                .Include(b => b.Book)
                .Include(b => b.Book.Author)
                .Include(b => b.Book.Genre)
                .Where(s => s.UserId == id)
                .ToListAsync();

            var bookList = shoppingCartItems.Select(b => new BookViewModel
            {
                AuthorFirstName = b.Book.Author.FirstName,
                AuthorLastName = b.Book.Author.LastName,
                AuthorId = b.Book.AuthorId,
                CopiesSold = b.Book.CopiesSold,
                Description = b.Book.Description,
                GenreId = b.Book.GenreId,
                GenreName = b.Book.Genre.Name,
                Id = b.Id,
                ISBN = b.Book.ISBN,
                Price = b.Book.Price,
                Rating = b.Book.Rating,
                Title = b.Book.Title,
                UserId = id,
                Year = b.Book.Year
            }).ToList();

            return Json(bookList, JsonRequestBehavior.AllowGet);
        }

        [HttpDelete]
        public async Task<ActionResult> DeleteBook(int id, int id2)
        {
            var bookId = id;
            var userId = id2;

            var cartItem = await DbContext.Set<ShoppingCart>()
                                .FirstOrDefaultAsync(s => s.UserId == userId && 
                                                          s.BookId == bookId);

            if (cartItem != null)
            {
                DbContext.ShoppingCarts.Remove(cartItem);
                await DbContext.SaveChangesAsync();
            }

            return Json(null, JsonRequestBehavior.AllowGet);
        }
    }
}