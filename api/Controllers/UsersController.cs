
using Microsoft.VisualBasic;
using Models;
using MySqlConnector;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.Json;

namespace Controllers
{
    public class UsersController
    {
        private string connectionString = "Server=localhost;User ID=root;Password=azerty;Database=newschema";
        // mes identifiants pour me connect a mon mysql workbench
        private List<Users> users;


        public string ProcessRequest(HttpListenerRequest request)
        {
            string responseString = "";

            // TODO: 
            // CRUD
            // PUT - DELETE
            // UPDATE - DELETE


            // 

            if (request.HttpMethod == "GET" && request.Url.PathAndQuery == "/api/users")
            {
                var options = new JsonSerializerOptions { WriteIndented = true }; //cette ligne rend le json html jolie
                responseString = JsonSerializer.Serialize(HttpGetAllUsers(), options);
            }
            else if (request.HttpMethod == "GET" && request.Url.PathAndQuery.StartsWith("/api/users/"))
            {
                string[] strings = request.Url.PathAndQuery.Split('/');
                string[] parts = strings; // separe notre url sur les "/"
                if (parts.Length == 4 && int.TryParse(parts[3], out int id))
                {
                    var options = new JsonSerializerOptions { WriteIndented = true }; //cette ligne rend le json html jolie
                    responseString = JsonSerializer.Serialize(HttpGetUserById(id), options);
                    if (responseString == "null")
                    {
                    responseString = "Invalid id, Error =  " + (int)HttpStatusCode.BadRequest;
                    }

                }
                else if (parts.Length > 4)
                {
                    responseString = "bad endpoint, Error =  " + (int)HttpStatusCode.BadRequest;
                }
                else if (request.Url.PathAndQuery == "/api/users/")
                {
                    responseString = "enter a id please, bad endpoint, Error =  " + (int)HttpStatusCode.BadRequest;
                }
                else
                {
                    responseString = "not a Id, Error =  " + (int)HttpStatusCode.BadRequest;
                }
            }

            // POST


            else if (request.HttpMethod == "POST" && request.Url.PathAndQuery == "/api/users")
            {
                using (var reader = new StreamReader(request.InputStream, request.ContentEncoding))
                {
                    string requestBody = reader.ReadToEnd(); // permet de lire le body de la requete postman json
                    var data = JsonSerializer.Deserialize<Users>(requestBody); //ici data accede au body

                    string firstName = data.User_FirstName;
                    string lastName = data.User_LastName;
                    string email = data.User_Email;
                    string password = data.User_Password;
                    string phone = data.User_Phone;

                    responseString = HttpPostNewUser(firstName, lastName, email, password, phone);
                }
            }


            //PUT

            else if (request.HttpMethod == "PUT" && request.Url.PathAndQuery.StartsWith("/api/users/"))
            {
                string[] strings = request.Url.PathAndQuery.Split('/');
                string[] parts = strings; // separe notre url sur les "/"
                if (parts.Length == 4 && int.TryParse(parts[3], out int id))
                {
                    using (var reader = new StreamReader(request.InputStream, request.ContentEncoding))
                    {
                        string requestBody = reader.ReadToEnd(); // permet de lire le body de la requete postman json
                        var data = JsonSerializer.Deserialize<Users>(requestBody); //ici data accede au body

                        string firstName = data.User_FirstName;
                        string lastName = data.User_LastName;
                        string email = data.User_Email;
                        string password = data.User_Password;
                        string phone = data.User_Phone;

                        
                        var options = new JsonSerializerOptions { WriteIndented = true }; //cette ligne rend le json html jolie
                        responseString = JsonSerializer.Serialize(HttpPutUserById(id, firstName, lastName, email, password, phone), options);
                    }
                    
                }
                else if (parts.Length > 4)
                {
                    responseString = "bad endpoint, Error =  " + (int)HttpStatusCode.BadRequest;
                }
                else if (request.Url.PathAndQuery == "/api/users/")
                {
                    responseString = "enter a id please, bad endpoint, Error =  " + (int)HttpStatusCode.BadRequest;
                }
                else
                {
                    responseString = "not a Id, Error =  " + (int)HttpStatusCode.BadRequest;
                }
            }

            //DELETE

            else if (request.HttpMethod == "DELETE" && request.Url.PathAndQuery.StartsWith("/api/users/"))
            {
                string[] strings = request.Url.PathAndQuery.Split('/');
                string[] parts = strings; // separe notre url sur les "/"
                if (parts.Length == 4 && int.TryParse(parts[3], out int id))
                {
                    var options = new JsonSerializerOptions { WriteIndented = true }; //cette ligne rend le json html jolie
                    responseString = JsonSerializer.Serialize(HttpDelUserById(id), options);

                }
                else if (parts.Length > 4)
                {
                    responseString = "bad endpoint, Error =  " + (int)HttpStatusCode.BadRequest;
                }
                else if (request.Url.PathAndQuery == "/api/users/")
                {
                    responseString = "enter a id please, bad endpoint, Error =  " + (int)HttpStatusCode.BadRequest;
                }
                else
                {
                    responseString = "not a Id, Error =  " + (int)HttpStatusCode.BadRequest;
                }
            }

            // HTTP PATCH?

           


            return responseString;
        }






        private string HttpPostNewUser(string firstName, string lastName, string email, string password, string phone)
        {
            // sur postman, faire la requete avec un body contenant les infos ci dessus
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();

                    string SqlRequest = "INSERT INTO users (User_FirstName, User_LastName, User_Email, User_Password, User_Phone) VALUES (@FirstName, @LastName, @Email, @Password, @Phone)";

                    using (MySqlCommand command = new MySqlCommand(SqlRequest, connection))
                    { // lie les @ a une string
                        command.Parameters.AddWithValue("@FirstName", firstName);
                        command.Parameters.AddWithValue("@LastName", lastName);
                        command.Parameters.AddWithValue("@Email", email);
                        command.Parameters.AddWithValue("@Password", password);
                        command.Parameters.AddWithValue("@Phone", phone);

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            return "Its work! Post effectué! ";
                        }
                        else
                        {
                            return "Post failled, no row creat";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // gestion de l'erreur
                return $"Error during post: {ex.Message}";
            }
        }


        // HttpPostNewUserWithId si on veux cree sur un Id specifique


        private IEnumerable<Users> HttpGetAllUsers()
        {

        List<Users> users = new List<Users>(); //cree une liste vide

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                string SqlRequest = "SELECT * FROM users"; // recupère tt les users

                using (MySqlCommand command = new MySqlCommand(SqlRequest, connection))
                {
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Users user = new Users // retourne en object les données de ma base SQL
                            {
                                User_Id = Convert.ToInt32(reader["User_Id"]),
                                User_FirstName = reader["User_FirstName"].ToString(),
                                User_LastName = reader["User_LastName"].ToString(),
                                User_Email = reader["User_Email"].ToString(),
                                User_Password = reader["User_Password"].ToString(),
                                User_Phone = reader["User_Phone"].ToString(),
                            };
                            users.Add(user);
                        }
                    }
                }
            }
            return users;
        }


        private string HttpPutUserById(int id, string firstName, string lastName, string email, string password, string phone)
        {
            //Put = Update, ou crée si existe pas

            try
            {

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                string SqlRequest = "UPDATE users SET User_FirstName = @FirstName, User_LastName = @LastName, User_Email = @Email, User_Password = @Password, User_Phone = @Phone WHERE User_Id = @UserId"; // ma query SQL

                using (MySqlCommand command = new MySqlCommand(SqlRequest, connection))
                {
                    command.Parameters.AddWithValue("@UserId", id);
                    command.Parameters.AddWithValue("@FirstName", firstName);
                    command.Parameters.AddWithValue("@LastName", lastName);
                    command.Parameters.AddWithValue("@Email", email); 
                    command.Parameters.AddWithValue("@Password", password);
                    command.Parameters.AddWithValue("@Phone", phone);

                    // permet d'envoyé des données dans la query par un @ en C#

                   int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            return "Its work! Post mis a jour! ";
                        }
                        else
                        {
                            HttpPostNewUser(firstName, lastName, email, password, phone);
                            return "This Id is empty, New User created";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // gestion de l'erreur
                return $"Error during post: {ex.Message}";
            }
        }


        private Users HttpGetUserById(int id)
        {
            
        Users user = null;

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                string SqlRequest = "SELECT * FROM users WHERE User_Id = @UserId"; // ma query SQL

                using (MySqlCommand command = new MySqlCommand(SqlRequest, connection))
                {
                    command.Parameters.AddWithValue("@UserId", id); 
                    // permet d'envoyé des données dans la query par un @ en C#

                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            user = new Users
                            {
                                User_Id = Convert.ToInt32(reader["User_Id"]),
                                User_FirstName = reader["User_FirstName"].ToString(),
                                User_LastName = reader["User_LastName"].ToString(),
                                User_Email = reader["User_Email"].ToString(),
                                User_Password = reader["User_Password"].ToString(),
                                User_Phone = reader["User_Phone"].ToString(),
                            };
                        }
                    }
                }
            }

            return user;
        }



        private string HttpDelUserById(int id)
        {

            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();

                    string SqlRequest = "DELETE FROM users WHERE User_Id = @UserId"; // ma query SQL

                    using (MySqlCommand command = new MySqlCommand(SqlRequest, connection))
                    {
                        command.Parameters.AddWithValue("@UserId", id); 
                        // permet d'envoyé des données dans la query par un @ en C#

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            return "Its work! User supprimer! ";
                        }
                        else
                        {
                            return "Invalid id, Error =  " + (int)HttpStatusCode.BadRequest;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // gestion de l'erreur
                return $"Error during post: {ex.Message}";
            }
        }

    }

}
