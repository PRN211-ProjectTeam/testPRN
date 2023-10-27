using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace PetShop_Project_SWP391.Models
{
    public partial class PictureProduct1
    {
        public PictureProduct1()
        {
            Products = new HashSet<Product>();
        }

        public int PictureId { get; set; }
        public string? Picture { get; set; }
        [JsonIgnore]
        public virtual ICollection<Product> Products { get; set; }
    }
}
