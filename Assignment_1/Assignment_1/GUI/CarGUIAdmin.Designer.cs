using Assignment_1.DAL;
using Assignment_1.DTL;
using Assignment_1.Respsitory;
using Assignment_1.GUI;
using System.Diagnostics;


namespace Assignment_1.GUI
{
    partial class CarGUIAdmin : Form
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
        private void InitializeComponent()
        {
            buttonLogin = new Button();
            dgvCarList = new DataGridView();
            number_car = new Label();
            num_car = new Label();
            AddEdit = new Button();
            ((System.ComponentModel.ISupportInitialize)dgvCarList).BeginInit();
            SuspendLayout();
            // 
            // buttonLogin
            // 
            buttonLogin.Location = new Point(-1, 2);
            buttonLogin.Name = "buttonLogin";
            buttonLogin.Size = new Size(129, 29);
            buttonLogin.TabIndex = 0;
            buttonLogin.Text = "Logout(admin)";
            buttonLogin.UseVisualStyleBackColor = true;
            buttonLogin.Click += Logout_Click;
            // 
            // dgvCarList
            // 
            dgvCarList.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dgvCarList.Location = new Point(-1, 167);
            dgvCarList.Name = "dgvCarList";
            dgvCarList.RowHeadersWidth = 51;
            dgvCarList.RowTemplate.Height = 29;
            dgvCarList.Size = new Size(805, 271);
            dgvCarList.TabIndex = 1;
            // 
            // number_car
            // 
            number_car.AutoSize = true;
            number_car.Location = new Point(-1, 128);
            number_car.Name = "number_car";
            number_car.Size = new Size(143, 20);
            number_car.TabIndex = 2;
            number_car.Text = "The number of cars: ";

            // 
            // num_car
            // 
            num_car.AutoSize = true;
            num_car.Location = new Point(172, 128);
            num_car.Name = "num_car";
            num_car.Size = new Size(0, 20);
            num_car.TabIndex = 3;
            num_car.Text = totalCars2.ToString();
            // 
            // AddEdit
            // 
            AddEdit.Location = new Point(-1, 54);
            AddEdit.Name = "AddEdit";
            AddEdit.Size = new Size(169, 29);
            AddEdit.TabIndex = 4;
            AddEdit.Text = "Add new...";
            AddEdit.UseVisualStyleBackColor = true;
            AddEdit.Click += AddEdit_Click;
            // 
            // CarGUIAdmin
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(AddEdit);
            Controls.Add(num_car);
            Controls.Add(number_car);
            Controls.Add(dgvCarList);
            Controls.Add(buttonLogin);
            Name = "CarGUIAdmin";
            Text = "CarGUI";
            Load += CarGUI_Load;
            ((System.ComponentModel.ISupportInitialize)dgvCarList).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        int totalCars2 = CarDAO.Instance.GetCarList.Count;
        private void CarGUI_Load(object sender, EventArgs e)
        {
            var carList = CarDAO.Instance.GetCarList;

            dgvCarList.DataSource = carList;
            dgvCarList.Columns["CarID"].Visible = false;
            dgvCarList.Columns["username"].Visible = false;
            dgvCarList.Columns["password"].Visible = false;

            //Detail
            DataGridViewButtonColumn DetailButtonColumn = new DataGridViewButtonColumn();
            DetailButtonColumn.Name = "DetailButtonColumn";
            DetailButtonColumn.HeaderText = "Detail";
            DetailButtonColumn.Text = "Detail";
            DetailButtonColumn.UseColumnTextForButtonValue = true;
            dgvCarList.Columns.Add(DetailButtonColumn);

            //Edit
            DataGridViewButtonColumn editButtonColumn = new DataGridViewButtonColumn();
            editButtonColumn.Name = "EditButtonColumn";
            editButtonColumn.HeaderText = "Edit";
            editButtonColumn.Text = "Edit";
            editButtonColumn.UseColumnTextForButtonValue = true;
            dgvCarList.Columns.Add(editButtonColumn);

            //Delete
            DataGridViewButtonColumn deleteButtonColumn = new DataGridViewButtonColumn();
            deleteButtonColumn.Name = "DeleteButtonColumn";
            deleteButtonColumn.HeaderText = "Delete";
            deleteButtonColumn.Text = "Delete";
            deleteButtonColumn.UseColumnTextForButtonValue = true;
            dgvCarList.Columns.Add(deleteButtonColumn);

            // truyền dữ liệu vào dgv 
            dgvCarList.CellContentClick += DgvCars_CellContentClick;

        }
        private void DgvCars_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {

                int carId = (int)dgvCarList.Rows[e.RowIndex].Cells["CarID"].Value;

                if (e.ColumnIndex == dgvCarList.Columns["DetailButtonColumn"].Index)
                {
                    Car car = CarDAO.Instance.GetCarByID(carId);
                    CarDetailGUI detailForm = new CarDetailGUI();
                    detailForm.ShowCarDetails(car);
                    detailForm.ShowDialog();
                }

                else if (e.ColumnIndex == dgvCarList.Columns["EditButtonColumn"].Index)
                {
                    CarAddEditGUI car = new CarAddEditGUI
                    {
                        AddOrEdit = true,
                        res = CarRespository
                    };
                    if (car.ShowDialog() == DialogResult.OK)
                    {
                        LoadCarList();
                        source.Position = source.Count;
                        Close();
                    }
                }
                else if (e.ColumnIndex == dgvCarList.Columns["DeleteButtonColumn"].Index)
                {
                    
                    DataGridViewRow selectedRow = dgvCarList.Rows[e.RowIndex];
                    int carID = (int)selectedRow.Cells["CarID"].Value;
                    Car car = CarDAO.Instance.GetCarByID(carID);
                    
                    DialogResult result = MessageBox.Show("Do you want to delete?", "Confirm", MessageBoxButtons.YesNo,MessageBoxIcon.Question);
                    if (result == DialogResult.Yes)
                    {
                        //LoadCarList();
                        CarDAO.Instance.DeleteCar(carID);                                            
                    }

                    LoadCarList();

                    DialogResult OK = MessageBox.Show("This car is deleted!","",MessageBoxButtons.OK);                               
                    if(OK == DialogResult.OK)
                    {
                        this.Close();
                        ///LoadCarList();
                        //return;
                    }
                }
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
        private Label num_car;
        private Button AddEdit;
    }

}