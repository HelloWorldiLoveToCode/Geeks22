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
        public string Index()

        {
            var strMessage = new StringBuilder();
            strMessage.Append("////////////////////////////////////////////////////////");
            strMessage.Append("<br/>");
            strMessage.Append("///// Geeks 22 Web API - FIU 2023 /////");
            strMessage.Append("<br/>");
            strMessage.Append("////////////////////////////////////////////////////////");
            strMessage.Append("<br/>");
            strMessage.Append("Created By:");
            strMessage.Append("<br/>");
            strMessage.Append("Anthony Lleo");
            strMessage.Append("<br/>");
            strMessage.Append("Brian Leach");
            strMessage.Append("<br/>");
            strMessage.Append("Alex Lejarraga Morales");
            strMessage.Append("<br/>");
            strMessage.Append("Chris Lavoro");
            strMessage.Append("<br/>");
            strMessage.Append("////////////////////////////////////////////////////////");
            strMessage.Append("<br/>");
            strMessage.Append("////////////////////////////////////////////////////////");
            strMessage.Append("<br/>");
            strMessage.Append("////////////////////////////////////////////////////////");
            strMessage.Append("<br/>");
            strMessage.Append("<br/>");
            strMessage.Append("<a href='Home/HealthCheck'>Run Health Check</a>");

            return strMessage.ToString();
        }

        [HttpGet]
        public async Task<string> HealthCheck()
        {
            var books = new List<Book>();
            var hasException = false;

            try {books = await DbContext.Set<Book>().AsNoTracking().ToListAsync();} 
            catch {hasException = true;}

            var strMessage = new StringBuilder();

            if (books is null || hasException) strMessage.Append("Not ");

            strMessage.Append("Healthy!");
            strMessage.Append("<br/>");
            strMessage.Append("<br/>");
            strMessage.Append("<a href='/'>Return</a>");

            return strMessage.ToString();   
        }  
    }
}
