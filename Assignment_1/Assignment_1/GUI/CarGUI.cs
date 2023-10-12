


namespace Assignment_1.GUI
{
    public partial class CarGUI : Form
    {
        public bool UserSuccessfullyAuthenticated { get; private set; }
       
        public CarGUI()
        {
            InitializeComponent();
            LoadCarList();
        }

        private void buttonLogin_Click(object sender, EventArgs e)
        {        
            LoginGUI login = new LoginGUI();
            login.ShowDialog();
            if (login.DialogResult == DialogResult.OK)
            {
                dgvCarList.DataSource = null;
                this.Hide();
                CarGUIAdmin frm = new CarGUIAdmin();
                frm.ShowDialog();
                this.Show();
                LoadCarList();
            }
        }      
    }
}
