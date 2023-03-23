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
    }
}