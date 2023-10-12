using Assignment_1.GUI;
using System.Runtime.CompilerServices;

namespace Assignment_1
{
    internal static class Program
    {
        /// <summary>
        ///  The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.SetHighDpiMode(HighDpiMode.SystemAware);
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            LoginGUI loginForm = new LoginGUI();
            CarGUI carGUI = new CarGUI();
            Application.Run(carGUI);
            if (loginForm.UserSuccessfullyAuthenticated)
            {
                if (loginForm.isAdmin == true)
                {                    
                    Application.Run(new CarGUIAdmin());
                    carGUI.Close();
                }
                else
                {
                    MessageBox.Show("Wrong account", "sucess");
                }
            }
        }
      }
    }
