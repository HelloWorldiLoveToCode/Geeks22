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

namespace Geeks22WebApi.Controllers
{
    public class HomeController : Controller
    {
        public HomeController()
        {

        }


        [HttpGet]
        public async Task<string> Index()
        {
            var db = new MyDbContext();

            var books = await db.Set<Book>()
                            .Include(a => a.Author)
                            .Include(g => g.Genre)
                            .ToListAsync();

            var myStringBuilder = new StringBuilder();

            foreach(var book in books)
            {
                myStringBuilder.Append(book.Title);
                myStringBuilder.Append(book.CopiesSold);
                myStringBuilder.Append(book.Author.FirstName);
                myStringBuilder.Append(book.Author.LastName);
                myStringBuilder.Append(book.Year);
            }

            return myStringBuilder.ToString();
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
