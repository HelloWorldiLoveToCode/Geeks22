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
    public class DetailsController : Controller
    {

        public MyDbContext DbContext { get; set; }
        public DetailsController() => DbContext = new MyDbContext();

        [HttpPost]
        public async Task<ActionResult> createBook(BookViewModel vm)
        {
            var user = await DbContext.Set<User>().FirstOrDefaultAsync(u => u.Id == vm.UserId);

            if (user.IsAdmin)
            {

                var book = new Book
                {
                    AuthorId = vm.AuthorId,
                    GenreId = vm.GenreId,
                    Title = vm.Title,
                    Price = vm.Price,
                    ISBN = vm.ISBN,
                    Description = vm.Description,
                    Year = vm.Year,
                    CopiesSold = vm.CopiesSold

                };

                DbContext.Books.Add(book);
                await DbContext.SaveChangesAsync();
            }


            return Json(null, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public async Task<ActionResult> RetrieveBookByISBN(string id)
        {
            var isbn = id;
            var book = await DbContext.Set<Book>().FirstOrDefaultAsync(b => b.ISBN.Equals(isbn));

            if (book == null)
                return null;

            var bvm = new BookViewModel
            {
                Id = book.Id,
                GenreId = book.GenreId,
                Title = book.Title,
                AuthorId = book.AuthorId,
                Price = book.Price,
                ISBN = book.ISBN,
                Description = book.Description,
                Year = book.Year,
                CopiesSold = book.CopiesSold

            };

            return Json(bvm, JsonRequestBehavior.AllowGet);
        }


    }

}
