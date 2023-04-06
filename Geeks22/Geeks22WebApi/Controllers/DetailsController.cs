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

        // Creates new book from book object
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

        // Returns a book after providing its ISBN
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

        // Creates new author from author object
        [HttpPost]
        public async Task<ActionResult> createAuthor(AuthorViewModel a)
        {
            var user = await DbContext.Set<User>().FirstOrDefaultAsync(u => u.Id == a.UserId);

            if (user.IsAdmin)
            {

                var author = new Author
                {
                    FirstName = a.FirstName,
                    LastName = a.LastName,
                    Biography = a.Biography,
                    Publisher = a.Publisher
                };

                DbContext.Authors.Add(author);
                await DbContext.SaveChangesAsync();
            }

            return Json(null, JsonRequestBehavior.AllowGet);
        }


        // Returns a list of books from author given authorId
        [HttpGet]
        public async Task<ActionResult> RetrieveBooksByAuthor(int id)
        {
            var authorId = id;
            var books = await DbContext.Set<Book>().Where(b => b.AuthorId.Equals(authorId)).ToListAsync();
            var matchingList = new List<BookViewModel>();

            if (books == null)
                return null;

            foreach (var book in books)
            {
                matchingList.Add( new BookViewModel
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
                    Rating = book.Rating,

                });
            }


            return Json(matchingList, JsonRequestBehavior.AllowGet);
        }
    }

}
