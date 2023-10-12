using Assignment_1.Respsitory;
using Nancy.Json;
using Assignment_1.GUI;
using Assignment_1.DTL;
namespace Assignment_1
{
    partial class LoginGUI
    {

        private System.ComponentModel.IContainer components = null;
        public bool UserSuccessfullyAuthenticated { get; private set; }
        public bool isAdmin { get; set; }
        // Declare form controls here
        private Label label1;
        private Label label2;
        private TextBox txtUser;
        private TextBox txtPassword;
        private Button btnLogin;
        private Button btnCancel;
        private DataGridView dgvCarList;
        private TextBox textBox1;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
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
            label1 = new Label();
            label2 = new Label();
            txtUser = new TextBox();
            txtPassword = new TextBox();
            dgvCarList = new DataGridView();
            btnLogin = new Button();
            textBox1 = new TextBox();
            btnCancel = new Button();

            ((System.ComponentModel.ISupportInitialize)dgvCarList).BeginInit();
            SuspendLayout();
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(216, 144);
            label1.Name = "label1";
            label1.Size = new Size(45, 20);
            label1.TabIndex = 0;
            label1.Text = "User: ";
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(184, 199);
            label2.Name = "label2";
            label2.Size = new Size(77, 20);
            label2.TabIndex = 1;
            label2.Text = "Password: ";
            // 
            // txtUser
            // 
            txtUser.Location = new Point(319, 137);
            txtUser.Name = "txtUser";
            txtUser.Size = new Size(186, 27);
            txtUser.TabIndex = 2;
            // 
            // txtPassword
            // 
            txtPassword.Location = new Point(319, 196);
            txtPassword.Name = "txtPassword";
            txtPassword.Size = new Size(186, 27);
            txtPassword.TabIndex = 3;
            txtPassword.PasswordChar = '*';
            // 
            // dgvCarList
            // 
            dgvCarList.ColumnHeadersHeight = 29;
            dgvCarList.Location = new Point(0, 0);
            dgvCarList.Name = "dgvCarList";
            dgvCarList.RowHeadersWidth = 51;
            dgvCarList.Size = new Size(240, 150);
            dgvCarList.TabIndex = 0;
            // 
            // btnLogin
            // 
            btnLogin.Location = new Point(216, 285);
            btnLogin.Name = "btnLogin";
            btnLogin.Size = new Size(100, 30);
            btnLogin.TabIndex = 4;
            btnLogin.Text = "Login";
            btnLogin.Click += btnLogin_Click;
            // 
            // textBox1
            // 
            textBox1.Location = new Point(319, 196);
            textBox1.Name = "textBox1";
            textBox1.Size = new Size(186, 27);
            textBox1.TabIndex = 4;
            // 
            // btnCancel
            // 
            btnCancel.Location = new Point(432, 285);
            btnCancel.Name = "btnCancel";
            btnCancel.Size = new Size(100, 30);
            btnCancel.TabIndex = 5;
            btnCancel.Text = "Cancel";
            btnCancel.Click += btnCancel_Click;
            // 
            // LoginGUI
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(839, 497);
            Controls.Add(btnLogin);
            Controls.Add(btnCancel);
            Controls.Add(textBox1);
            Controls.Add(label1);
            Controls.Add(label2);
            Controls.Add(txtUser);
            Controls.Add(txtPassword);
            Name = "LoginGUI";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "LoginGUI";

            ((System.ComponentModel.ISupportInitialize)dgvCarList).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string json = File.ReadAllText("settings.json");

                // read json string from file
                using (StreamReader reader = new StreamReader("settings.json"))
                {
                    json = reader.ReadToEnd();
                }

                JavaScriptSerializer jss = new JavaScriptSerializer();
                // convert json string to dynamic type
                var obj = jss.Deserialize<dynamic>(json);

                var admin = new Car
                {
                    Username = obj["AdminAccount"]["username"],
                    Password = obj["AdminAccount"]["password"]
                };

                Respository res = new Respository();
                var Car = res.GetCars();
                bool loggedIn = false;

                foreach (var item in Car)
                {
                    item.Username = admin.Username;
                    item.Password = admin.Password;
                }
                foreach (var i in Car)
                {
                    if (i.Username != null && i.Username.Equals(txtUser.Text) && i.Password != null && i.Password.Equals(textBox1.Text))
                    {
                        this.DialogResult = DialogResult.OK;
                    
                        Close();
                        loggedIn = true;
                        return;
                    }


                }
                this.DialogResult = DialogResult.OK;
                MessageBox.Show("Wrong account", "Error");
                loggedIn &= false;
                Close();
                return;

            }


            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Error");
            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.Cancel;
            Close();
        }
    }


    #endregion
}

