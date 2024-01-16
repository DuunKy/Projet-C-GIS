using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Net.Http;
using System.Text.Json;

namespace HelloWPFApp
{
    /// <summary>
    /// Logique d'interaction pour SecondWindow.xaml
    /// </summary>
    public partial class SecondWindow : Window
    {
        public SecondWindow()
        {
            InitializeComponent();
        }

        // Storing the original db keys of user table
        public class User
        {
            public string User_FirstName { get; set; }
            public string User_LastName { get; set; }
            public string User_Email { get; set; }
            public string User_Password { get; set; }
            public string User_Phone { get; set; }
        }


        private void POST_users_Button_Click(object sender, RoutedEventArgs e)
        {
            
            string url = "http://localhost:8080/api/users";

            // x.Text corresponds to the value entered in the window's x textbox ( ex : FirstName textbox = FirstName.Text )

            User new_user = new User()
            {
                User_FirstName = FirstName.Text,
                User_LastName = LastName.Text,
                User_Email = Email.Text,
                User_Password = Password.Text,
                User_Phone = Phone.Text
            };

            // Create a string with the JSON data
            string jsonContentresponse = JsonSerializer.Serialize<User>(new_user);

            POST_func(url, jsonContentresponse);

        }

        private async void POST_func(string url, string jsonContentresponse)
        {
            try
            {
                using (HttpClient httpClient = new HttpClient())
                {
                    StringContent content = new StringContent(jsonContentresponse, Encoding.UTF8, "application/json");

                    // Making the POST request
                    HttpResponseMessage response = await httpClient.PostAsync(url, content);

                    MessageBox.Show(response.StatusCode.ToString());

                    // Checking POST request success
                    if (response.IsSuccessStatusCode)
                    {
                        // Content of response is converted to string
                        string Contentresponse = await response.Content.ReadAsStringAsync();
                        MessageBox.Show(Contentresponse);
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
