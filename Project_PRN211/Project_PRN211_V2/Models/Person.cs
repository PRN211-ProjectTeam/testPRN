using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Project_PRN211_V2.Models
{
    public partial class Person
    {
        public Person()
        {
            Rates = new HashSet<Rate>();
        }

        public int PersonId { get; set; }

		[Required(AllowEmptyStrings = false, ErrorMessage = "Please enter the Fullname")]
		public string Fullname { get; set; }

		[Required(AllowEmptyStrings = false, ErrorMessage = "Please enter the Gender")]
		public string Gender { get; set; }

		[Required(AllowEmptyStrings = false, ErrorMessage = "Please enter the Email")]
		public string Email { get; set; }

		[Required(AllowEmptyStrings = false, ErrorMessage = "Please enter the Password")]
		public string Password { get; set; }
        public int? Type { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<Rate> Rates { get; set; }
    }
}
