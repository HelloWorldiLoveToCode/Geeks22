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
    public class HomeController : Controller
    {

        public MyDbContext DbContext { get; set; }
        public HomeController() => DbContext = new MyDbContext();

        [HttpGet]
        public async Task<ActionResult> Index()
        {
            var books = await DbContext.Set<Book>().Include(g => g.Genre).Include(a => a.Author).ToListAsync();

            var myList = new List<BookViewModel>();

            foreach (var book in books)
            {
                myList.Add(new BookViewModel
                {
                    AuthorFirstName = book.Author.FirstName,
                    AuthorLastName = book.Author.LastName,
                    AuthorId = book.AuthorId,
                    CopiesSold = book.CopiesSold,
                    Description = book.Description,
                    GenreName = book.Genre.Name,
                    Id = book.Id,
                    ISBN = book.ISBN,
                    Price = book.Price,
                    Title = book.Title,
                    GenreId = book.GenreId,
                    Year = book.Year
                });
            }

            return Json(myList, JsonRequestBehavior.AllowGet);
        }
        
        [HttpGet]
        public int Test(int id = 0)
        {
            return id;
        }


        [HttpGet]
        public JsonResult MyCollection()
        {
            var myList = new List<string>();
            myList.Add("Hello");
            myList.Add("Hello2");
            myList.Add("Hello3");
            myList.Add("Hello4");
            myList.Add("Hello5");

            var myResult = JsonConvert.SerializeObject(myList);

            return Json(myResult, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public int TestPost(Class1 obj)
        {
            var MyProperty1 = obj.MyProperty1;
            var MyProperty2 = obj.MyProperty2;
            var MyProperty3 = obj.MyProperty3;

            return MyProperty1 + 1;
        }


        [HttpPut]
        public int TestPut(int id, string id2)
        {
            var myObj = new Class1 {MyProperty1 = id, MyProperty2 = id2};

            return myObj.MyProperty1 + 1;
        }
    }
}
