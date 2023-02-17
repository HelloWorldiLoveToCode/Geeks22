using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Geeks22WebApi.Models
{
    public class Class1
    {
        public int MyProperty1 { get; set; }
        public string MyProperty2 { get; set; }
        public bool MyProperty3 { get; set; }
    }

    public class BookViewModel
    {
        public int Id { get; set; }

        public int GenreId { get; set; }

        public string GenreName { get; set; }

        public string Title { get; set; }

        public int AuthorId { get; set; }

        public string AuthorFirstName { get; set; }
        public string AuthorLastName { get; set; }

        public decimal Price { get; set; }

        public string ISBN { get; set; }

        public string Description { get; set; }

        public int Year { get; set; }

        public int CopiesSold { get; set; }
    }
}