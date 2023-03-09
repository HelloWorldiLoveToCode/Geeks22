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
    public class BrowsingController : Controller
    {

        public MyDbContext DbContext { get; set; }
        public BrowsingController() => DbContext = new MyDbContext();


        [HttpGet]
        public async Task<ActionResult> RetrieveBooksByGenre(string id)
        {
            var books = await DbContext.Set<Book>().Include(g => g.Genre).Include(a => a.Author).Where(b => b.Genre.Name.Equals(id)).ToListAsync();
            if (!books.Any()) return Json("-1", JsonRequestBehavior.AllowGet);

            var myList = new List<BookViewModel>();
            

            foreach (var book in books)
            {
                    myList.Add(new BookViewModel

                    {
                        Title = book.Title,
                        ISBN = book.ISBN,
                        Price = book.Price,
                        Year = book.Year,
                        CopiesSold = book.CopiesSold,
                        Description = book.Description,
                        GenreName = book.Genre.Name,
                        AuthorFirstName = book.Author.FirstName,
                        AuthorLastName = book.Author.LastName,
                        Id = book.Id,
                        GenreId = book.Genre.Id,
                        AuthorId = book.Author.Id,

                    });
                
            }
           
            return Json(myList, JsonRequestBehavior.AllowGet);
        }
    }
}
