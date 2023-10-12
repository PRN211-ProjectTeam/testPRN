using Assignment_1.DAL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Assignment_1.GUI
{
    public partial class CarGUIAdmin : Form
    {

        public CarGUIAdmin()
        {
            InitializeComponent();

        }

        private void Logout_Click(object sender, EventArgs e)
        {
            CarGUI car = new CarGUI();
            car.ShowDialog();
            Close();
        }

        private void AddEdit_Click(object sender, EventArgs e)
        {
            CarAddEditGUI carAddEdit = new CarAddEditGUI();
            carAddEdit.ShowDialog();
        }

        private void Refesh_button_Click(object sender, EventArgs e)
        {
            LoadCarList();
            int totalCars = CarDAO.Instance.GetCarList.Count;
            num_car.Text = totalCars.ToString();
        }
    }
}
