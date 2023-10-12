using Assignment_1.DTL;

namespace Assignment_1.GUI
{
    partial class CarDetailGUI : Form
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

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
        public void ShowCarDetails(Car car)
        {
            lblCarID.Text = "CarID: ";
            txtCarID.Text = car.CarID.ToString();

            lblMake.Text = "Make: ";
            txtMake.Text = car.Make;

            lblColor.Text = "Color: ";
            txtColor.Text = car.Color;
            PanelColor.BackColor = Color.FromName(car.Color);    

            lblPetname.Text = "Petname: ";
            txtPetname.Text = car.Petname;

        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            button_Back = new Button();
            lblPetname = new Label();
            lblColor = new Label();
            lblCarID = new Label();
            lblMake = new Label();
            txtCarID = new TextBox();
            txtColor = new TextBox();
            txtMake = new TextBox();
            txtPetname = new TextBox();
            PanelColor = new Panel();
            SuspendLayout();
            // 
            // button_Back
            // 
            button_Back.Location = new Point(314, 292);
            button_Back.Name = "button_Back";
            button_Back.Size = new Size(94, 29);
            button_Back.TabIndex = 4;
            button_Back.Text = "Back";
            button_Back.UseVisualStyleBackColor = true;
            button_Back.Click += button_Back_Click;
            // 
            // lblPetname
            // 
            lblPetname.AutoSize = true;
            lblPetname.Location = new Point(441, 207);
            lblPetname.Name = "lblPetname";
            lblPetname.Size = new Size(69, 20);
            lblPetname.TabIndex = 3;
            lblPetname.Text = "Petname:";
            // 
            // lblColor
            // 
            lblColor.AutoSize = true;
            lblColor.Location = new Point(462, 137);
            lblColor.Name = "lblColor";
            lblColor.Size = new Size(48, 20);
            lblColor.TabIndex = 2;
            lblColor.Text = "Color:";
            // 
            // lblCarID
            // 
            lblCarID.AutoSize = true;
            lblCarID.Location = new Point(153, 133);
            lblCarID.Name = "lblCarID";
            lblCarID.Size = new Size(53, 20);
            lblCarID.TabIndex = 0;
            lblCarID.Text = "CarID: ";
            // 
            // lblMake
            // 
            lblMake.AutoSize = true;
            lblMake.Location = new Point(158, 207);
            lblMake.Name = "lblMake";
            lblMake.Size = new Size(48, 20);
            lblMake.TabIndex = 1;
            lblMake.Text = "Make:";
            // 
            // txtCarID
            // 
            txtCarID.Location = new Point(212, 130);
            txtCarID.Name = "txtCarID";
            txtCarID.Size = new Size(125, 27);
            txtCarID.TabIndex = 5;
            // 
            // txtColor
            // 
            txtColor.Location = new Point(526, 130);
            txtColor.Name = "txtColor";
            txtColor.Size = new Size(125, 27);
            txtColor.TabIndex = 6;
            // 
            // txtMake
            // 
            txtMake.Location = new Point(212, 200);
            txtMake.Name = "txtMake";
            txtMake.Size = new Size(125, 27);
            txtMake.TabIndex = 7;
            // 
            // txtPetname
            // 
            txtPetname.Location = new Point(526, 204);
            txtPetname.Name = "txtPetname";
            txtPetname.Size = new Size(125, 27);
            txtPetname.TabIndex = 8;
            // 
            // PanelColor
            // 
            PanelColor.Location = new Point(696, 116);
            PanelColor.Name = "PanelColor";
            PanelColor.Size = new Size(42, 41);
            PanelColor.TabIndex = 9;
            // 
            // CarDetailGUI
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(PanelColor);
            Controls.Add(txtPetname);
            Controls.Add(txtMake);
            Controls.Add(txtColor);
            Controls.Add(txtCarID);
            Controls.Add(button_Back);
            Controls.Add(lblPetname);
            Controls.Add(lblColor);
            Controls.Add(lblMake);
            Controls.Add(lblCarID);
            Name = "CarDetailGUI";
            Text = "CarDetailGUI";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion
        private Button button_Back;
        private Label lblPetname;
        private Label lblColor;
        private Label lblCarID;
        private Label lblMake;
        private TextBox txtCarID;
        private TextBox txtColor;
        private TextBox txtMake;
        private TextBox txtPetname;
        private Panel PanelColor;
    }
}