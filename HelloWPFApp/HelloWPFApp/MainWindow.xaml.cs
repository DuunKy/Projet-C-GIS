using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Net.Http;

namespace HelloWPFApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        public MainWindow()
        {
            InitializeComponent();
        }

        private void POST_window_Button_Click(object sender, RoutedEventArgs e)
        {
            SecondWindow postWin = new SecondWindow();
            postWin.Owner = this;
            postWin.Show();
        }

        private void API_status_Button_Click(object sender, RoutedEventArgs e)
        {
            string url = "http://localhost:8080/api/status";

            GET_func(url);

        }

        private void GET_users_Button_Click(object sender, RoutedEventArgs e)
        {
            string url = "http://localhost:8080/api/users";

            GET_func(url);

        }

        private void GET_shoplists_Button_Click(object sender, RoutedEventArgs e)
        {
            string url = "http://localhost:8080/api/shoplists";

            GET_func(url);

        }

        private void GET_products_Button_Click(object sender, RoutedEventArgs e)
        {
            string url = "http://localhost:8080/api/products";

            GET_func(url);

        }

        private void GET_invoices_Button_Click(object sender, RoutedEventArgs e)
        {
            string url = "http://localhost:8080/api/invoices";

            GET_func(url);

        }

        private void GET_commands_Button_Click(object sender, RoutedEventArgs e)
        {
            string url = "http://localhost:8080/api/commands";

            GET_func(url);

        }

        private void GET_carts_Button_Click(object sender, RoutedEventArgs e)
        {
            string url = "http://localhost:8080/api/carts";

            GET_func(url);

        }

        private async void GET_func(string url)
        {
            try
            {
                using (HttpClient httpClient = new HttpClient())
                {
                    // Creating the GET request
                    HttpResponseMessage response = await httpClient.GetAsync(url);

                    // Checking GET request success
                    if (response.IsSuccessStatusCode)
                    {
                        // Content of response is converted to string
                        string content = await response.Content.ReadAsStringAsync();

                        BigMessage newWindow = new BigMessage();
                        newWindow.Owner = this;
                        newWindow.SetContent(content);
                        newWindow.ShowDialog();

                    }
                    else
                    {
                        Console.WriteLine($"Error: {response.StatusCode} - {response.ReasonPhrase}");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception: {ex.Message}");
            }
        
            
        }

    }
}
