namespace Geeks22WebApi
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Book")]
    public partial class Book
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Book()
        {
            ShoppingCarts = new HashSet<ShoppingCart>();
        }

        public int Id { get; set; }

        public int GenreId { get; set; }

        [Required]
        [StringLength(50)]
        public string Title { get; set; }

        public int AuthorId { get; set; }

        public decimal Price { get; set; }

        [Required]
        [StringLength(48)]
        public string ISBN { get; set; }

        [Required]
        public string Description { get; set; }

        public int Year { get; set; }

        public int CopiesSold { get; set; }

        public virtual Author Author { get; set; }

        public virtual Genre Genre { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ShoppingCart> ShoppingCarts { get; set; }
    }
}
