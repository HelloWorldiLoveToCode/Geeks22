namespace Geeks22WebApi
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ShoppingCart")]
    public partial class ShoppingCart
    {
        public int Id { get; set; }

        public int UserId { get; set; }

        public int BookId { get; set; }

        public virtual Book Book { get; set; }

        public virtual User User { get; set; }
    }
}
