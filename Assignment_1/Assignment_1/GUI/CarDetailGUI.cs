﻿using System;
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
    public partial class CarDetailGUI : Form
    {
        public CarDetailGUI()
        {
            InitializeComponent();
        }

        private void button_Back_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}