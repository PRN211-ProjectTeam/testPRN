using System;
using System.Collections.Generic;
using System.Windows.Forms;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Assignment_1.GUI;
namespace Assignment_1.DTL
{
    public partial class Car
    {
        public int CarID { get; set; }
        public string Make { get; set; }
        public string Color { get; set; }
        public string Petname { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }

        public Car() { }

        public Car(int carID, string make, string color, string petname)
        {
            CarID = carID;
            Make = make;
            Color = color;
            Petname = petname;           
        }

        public Car(string make, string color, string petname)
        {         
            Make = make;
            Color = color;
            Petname = petname;
        }

        public Car(string username, string password)
        {
            Username = username;
            Password = password;
        }
        }
   
}
