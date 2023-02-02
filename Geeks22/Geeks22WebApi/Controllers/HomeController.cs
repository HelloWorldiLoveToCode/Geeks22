using Geeks22WebApi.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Geeks22WebApi.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";

            return View();
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
