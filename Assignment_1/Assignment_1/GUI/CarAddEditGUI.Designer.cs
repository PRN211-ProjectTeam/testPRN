namespace Assignment_1.GUI
{
    partial class CarAddEditGUI
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            lblMake = new Label();
            lblCarID = new Label();
            lblColor = new Label();
            lblPetname = new Label();
            txtCarID = new TextBox();
            txtMake = new TextBox();
            txtColor = new TextBox();
            txtPetname = new TextBox();
            button_Save = new Button();
            button_Cancel = new Button();
            panel1 = new Panel();
            panel2_Color = new Panel();
            SuspendLayout();
            // 
            // lblMake
            // 
            lblMake.AutoSize = true;
            lblMake.Location = new Point(126, 215);
            lblMake.Name = "lblMake";
            lblMake.Size = new Size(48, 20);
            lblMake.TabIndex = 1;
            lblMake.Text = "Make:";
            // 
            // lblCarID
            // 
            lblCarID.AutoSize = true;
            lblCarID.Location = new Point(126, 134);
            lblCarID.Name = "lblCarID";
            lblCarID.Size = new Size(50, 20);
            lblCarID.TabIndex = 0;
            lblCarID.Text = "Car ID";
            // 
            // lblColor
            // 
            lblColor.AutoSize = true;
            lblColor.Location = new Point(465, 134);
            lblColor.Name = "lblColor";
            lblColor.Size = new Size(48, 20);
            lblColor.TabIndex = 2;
            lblColor.Text = "Color:";
            // 
            // lblPetname
            // 
            lblPetname.AutoSize = true;
            lblPetname.Location = new Point(444, 215);
            lblPetname.Name = "lblPetname";
            lblPetname.Size = new Size(69, 20);
            lblPetname.TabIndex = 3;
            lblPetname.Text = "Petname:";
            // 
            // txtCarID
            // 
            txtCarID.Location = new Point(214, 127);
            txtCarID.Name = "txtCarID";
            txtCarID.Size = new Size(125, 27);
            txtCarID.TabIndex = 0;
            // 
            // txtMake
            // 
            txtMake.Location = new Point(214, 208);
            txtMake.Name = "txtMake";
            txtMake.Size = new Size(125, 27);
            txtMake.TabIndex = 4;
            // 
            // txtColor
            // 
            txtColor.Location = new Point(544, 127);
            txtColor.Name = "txtColor";
            txtColor.Size = new Size(125, 27);
            txtColor.TabIndex = 5;
            // 
            // txtPetname
            // 
            txtPetname.Location = new Point(544, 212);
            txtPetname.Name = "txtPetname";
            txtPetname.Size = new Size(125, 27);
            txtPetname.TabIndex = 6;
            // 
            // button_Save
            // 
            button_Save.Location = new Point(245, 313);
            button_Save.Name = "button_Save";
            button_Save.Size = new Size(94, 29);
            button_Save.TabIndex = 7;
            button_Save.Text = "Save";
            button_Save.UseVisualStyleBackColor = true;
            button_Save.Click += button_Save_Click;
            // 
            // button_Cancel
            // 
            button_Cancel.Location = new Point(444, 313);
            button_Cancel.Name = "button_Cancel";
            button_Cancel.Size = new Size(94, 29);
            button_Cancel.TabIndex = 8;
            button_Cancel.Text = "Cancel";
            button_Cancel.UseVisualStyleBackColor = true;
            button_Cancel.Click += button_Cancel_Click;
            // 
            // panel1
            // 
            panel1.Location = new Point(0, 0);
            panel1.Name = "panel1";
            panel1.Size = new Size(200, 100);
            panel1.TabIndex = 0;
            // 
            // panel2_Color
            // 
            panel2_Color.Location = new Point(705, 111);
            panel2_Color.Name = "panel2_Color";
            panel2_Color.Size = new Size(54, 43);
            panel2_Color.TabIndex = 9;
            panel2_Color.BackColor = Color.White;
            // 
            // CarAddEditGUI
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(panel2_Color);
            Controls.Add(button_Cancel);
            Controls.Add(button_Save);
            Controls.Add(txtPetname);
            Controls.Add(txtColor);
            Controls.Add(txtMake);
            Controls.Add(txtCarID);
            Controls.Add(lblPetname);
            Controls.Add(lblColor);
            Controls.Add(lblMake);
            Controls.Add(lblCarID);
            Name = "CarAddEditGUI";
            Text = "CarAddEditGUI";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label lblMake;
        private Label lblCarID;
        private Label lblColor;
        private Label lblPetname;
        private TextBox txtCarID;
        private TextBox txtMake;
        private TextBox txtColor;
        private TextBox txtPetname;
        private Button button_Save;
        private Button button_Cancel;
        private Panel panel1;
        private Panel panel2_Color;
    }
}