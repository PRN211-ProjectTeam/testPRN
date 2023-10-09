using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Project_PRN211_V2.Models
{
    public partial class Movie
    {
        public Movie()
        {
            Rates = new HashSet<Rate>();
        }

        public int MovieId { get; set; }
		[Required(AllowEmptyStrings = false, ErrorMessage = "Please enter the Title")]
		[StringLength(maximumLength: 30, MinimumLength = 5, ErrorMessage = "Length Title must be between 5 to 10")]
		public string Title { get; set; }
		
		[Required(AllowEmptyStrings = false, ErrorMessage = "Please enter the Year")]
		public int? Year { get; set; }
		[Required(AllowEmptyStrings = false, ErrorMessage = "Please enter the Image")]
		public string Image { get; set; }
		[Required(AllowEmptyStrings = false, ErrorMessage = "Please enter the Description")]
		public string Description { get; set; }
		[Required(AllowEmptyStrings = false, ErrorMessage = "Please enter the GenreId")]
		public int? GenreId { get; set; }

        public virtual Genre? Genre { get; set; }
        public virtual ICollection<Rate> Rates { get; set; }
    }
}
