using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Geeks22WebApi.Models
{

    public class AuthorViewModel
    {

        public int UserId { get; set; }

        public int Id { get; set; }

        public string FirstName { get; set; }
        public string LastName { get; set; }

        public string Biography { get; set; }

        public string Publisher { get; set; }


    }

}