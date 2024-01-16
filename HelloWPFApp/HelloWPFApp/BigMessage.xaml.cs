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

namespace HelloWPFApp
{
    /// <summary>
    /// Logique d'interaction pour BigMessage.xaml
    /// </summary>
    public partial class BigMessage : Window
    {
        public BigMessage()
        {
            InitializeComponent();
        }


        public void SetContent(string content)
        {
            ContentTextBlock.Text = content;
        }

        private void OkButton_Click(object sender, RoutedEventArgs e)
        {
            // Close the window or handle the OK button click action
            Close();

        }
    }
}
