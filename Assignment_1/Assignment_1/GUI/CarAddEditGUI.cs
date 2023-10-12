
using Assignment_1.DTL;
using Assignment_1.Respsitory;
using System.Diagnostics.Metrics;
using System.Reflection;

namespace Assignment_1.GUI
{
    public partial class CarAddEditGUI : Form
    {
        public IRespository res { get; set; }
        public bool AddOrEdit { get; set; }
        public Car carinfo { get; set; }
        public CarAddEditGUI()
        {
            InitializeComponent();
            res = new Respository();
        }
        public void FillFormWithCarData(Car car)
        {
            txtCarID.Enabled = !AddOrEdit;
            if (AddOrEdit == true)
            {
                txtCarID.Text = carinfo.CarID.ToString();
                txtMake.Text = carinfo.Make;
                txtColor.Text = carinfo.Color;
                txtPetname.Text = carinfo.Petname;
            }
        }
        private void button_Save_Click(object sender, EventArgs e)
        {
            try
            {
                var car = CarFactory.CreateCar(
                    int.Parse(txtCarID.Text),
                    txtMake.Text,
                    txtColor.Text,
                    txtPetname.Text
                );

                if (AddOrEdit == false)
                {
                    res.AddCar(car);
                }
                else
                {
                    res.EditCar(car);
                }

                MessageBox.Show(AddOrEdit == false ? "A New Car is added" : "This Car is updated!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error");
            }
        }
        public class CarFactory
        {
            public static Car CreateCar(int carID, string make, string color, string petname)
            {
                return new Car
                {
                    CarID = carID,
                    Make = make,
                    Color = color,
                    Petname = petname
                };
            }
        }

        private void button_Cancel_Click(object sender, EventArgs e)
        {
            Close();
        }


    }
}
