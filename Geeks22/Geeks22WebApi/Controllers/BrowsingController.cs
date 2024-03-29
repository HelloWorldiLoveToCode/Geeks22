﻿using Geeks22WebApi.Models;
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
using System.Web.Http;

namespace Geeks22WebApi.Controllers
{
    public class BrowsingController : Controller
    {

        public MyDbContext DbContext { get; set; }
        public BrowsingController() => DbContext = new MyDbContext();


        [System.Web.Http.HttpGet]
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
                        Rating = book.Rating,

                    });
                
            }
           
            return Json(myList, JsonRequestBehavior.AllowGet);
        }
        [System.Web.Http.HttpGet]
        public async Task<ActionResult> RetrieveTopSellers()
        {
            var topSellers = (await DbContext.Set<Book>().Include(g => g.Genre).Include(a => a.Author).ToListAsync()).OrderByDescending(b => b.CopiesSold).Take(10).ToList();

            var myList = new List<BookViewModel>();

            foreach (var topSeller in topSellers)
            {
                myList.Add(new BookViewModel

                {
                    Title = topSeller.Title,
                    ISBN = topSeller.ISBN,
                    Price = topSeller.Price,
                    Year = topSeller.Year,
                    CopiesSold = topSeller.CopiesSold,
                    Description = topSeller.Description,
                    GenreName = topSeller.Genre.Name,
                    AuthorFirstName = topSeller.Author.FirstName,
                    AuthorLastName = topSeller.Author.LastName,
                    Id = topSeller.Id,
                    GenreId = topSeller.Genre.Id,
                    AuthorId = topSeller.Author.Id,
                    Rating = topSeller.Rating,

                });

            }

            return Json(myList, JsonRequestBehavior.AllowGet);
        }

        [System.Web.Http.HttpGet]
        public async Task<ActionResult> RetrieveBooksByRating(int id)
        {
            var books = await DbContext.Set<Book>().Include(g => g.Genre).Include(a => a.Author).Where(b => b.Rating >= id).ToListAsync();
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
                    Rating = book.Rating,

                });

            }

            return Json(myList, JsonRequestBehavior.AllowGet);
        }


        [System.Web.Http.HttpPut]
        public async Task DiscountBooksByPublisher(int id, string id2)
        {

            var books = await DbContext.Set<Book>().Include(g => g.Genre).Include(a => a.Author).Where(b => b.Author.Publisher.ToLower().Equals(id2.ToLower())).ToListAsync();
   
            foreach (var book in books)
            {
                book.Price -= (book.Price * id / 100);
            }

            await DbContext.SaveChangesAsync();
            
            
        }
    }
}
