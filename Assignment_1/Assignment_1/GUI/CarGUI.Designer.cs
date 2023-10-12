using System;
using System.Diagnostics.Metrics;
using Assignment_1;
using Assignment_1.Respsitory;
using Assignment_1.DTL;
using Assignment_1.DAL;
using System.Collections.Generic;

namespace Assignment_1.GUI
{
    partial class CarGUI : Form
    {
        private System.ComponentModel.IContainer components = null;
        IRespository CarRespository = new Respository();
        BindingSource source;

        public void LoadCarList()
        {
            var carList = CarDAO.Instance.GetCarList;
            try
            {
                dgvCarList.DataSource = carList;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Load car list");
            }
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }
        

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            buttonLogin = new Button();
            dgvCarList = new DataGridView();
            number_car = new Label();
            total_Car = new Label();
            ((System.ComponentModel.ISupportInitialize)dgvCarList).BeginInit();
            SuspendLayout();
            // 
            // buttonLogin
            // 
            buttonLogin.Location = new Point(-1, 2);
            buttonLogin.Name = "buttonLogin";
            buttonLogin.Size = new Size(94, 29);
            buttonLogin.TabIndex = 0;
            buttonLogin.Text = "Login";
            buttonLogin.UseVisualStyleBackColor = true;
            buttonLogin.Click += buttonLogin_Click;
            // 
            // dgvCarList
            // 
            dgvCarList.ColumnHeadersHeight = 29;
            dgvCarList.Location = new Point(-1, 175);
            dgvCarList.Name = "dgvCarList";
            dgvCarList.RowHeadersWidth = 51;
            dgvCarList.Size = new Size(803, 274);
            dgvCarList.TabIndex = 0;
            // 
            // number_car
            // 
            number_car.AutoSize = true;
            number_car.Location = new Point(12, 143);
            number_car.Name = "number_car";
            number_car.Size = new Size(143, 20);
            number_car.TabIndex = 1;
            number_car.Text = "The number of cars: ";
            // 
            // total_Car
            // 
            total_Car.AutoSize = true;
            total_Car.Location = new Point(171, 143);
            total_Car.Name = "total_Car";
            total_Car.Size = new Size(0, 20);
            total_Car.TabIndex = 2;
            total_Car.Text = totalCars1.ToString();

            // 
            // CarGUI
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(total_Car);
            Controls.Add(number_car);
            Controls.Add(dgvCarList);
            Controls.Add(buttonLogin);
            Name = "CarGUI";
            Text = "CarGUI";
            Load += CarGUI_Load;
            ((System.ComponentModel.ISupportInitialize)dgvCarList).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        int totalCars1 = CarDAO.Instance.GetCarList.Count;
        private void CarGUI_Load(object sender, EventArgs e)
        {

            var carList = CarDAO.Instance.GetCarList;

            dgvCarList.DataSource = carList;

            dgvCarList.Columns["CarID"].Visible = false;
            dgvCarList.Columns["username"].Visible = false;
            dgvCarList.Columns["password"].Visible = false;

            DataGridViewButtonColumn editButtonColumn = new DataGridViewButtonColumn();
            editButtonColumn.Name = "EditButtonColumn";
            editButtonColumn.HeaderText = "Detail";
            editButtonColumn.Text = "Detail";
            editButtonColumn.UseColumnTextForButtonValue = true;
            dgvCarList.Columns.Add(editButtonColumn);

            dgvCarList.CellContentClick += DgvCars_CellContentClick;
        }
        private void DgvCars_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == dgvCarList.Columns["EditButtonColumn"].Index && e.RowIndex >= 0)
            {
                DataGridViewRow selectedRow = dgvCarList.Rows[e.RowIndex];
                int carID = (int)selectedRow.Cells["CarID"].Value;
                Car car = CarDAO.Instance.GetCarByID(carID);
                CarDetailGUI detailForm = new CarDetailGUI();
                detailForm.ShowCarDetails(car);
                detailForm.ShowDialog();
            }
        }

        #endregion

        private Button buttonLogin;
        private DataGridView dgvCarList;
        private TextBox txtCarID;
        private TextBox txtMake;
        private TextBox txtColor;
        private TextBox txtPetname;
        private TextBox txtDetail;
        private Label number_car;
        private Label total_Car;
    }
}