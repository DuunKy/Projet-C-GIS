
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
    public class ProductsController
    {
        private string connectionString = "Server=localhost;User ID=root;Password=azerty;Database=newschema";
        // mes identifiants pour me connect a mon mysql workbench
        private List<Users> products;

// TODO: 
// gener mieux la connection sql = 1 connection


        public string ProcessRequest(HttpListenerRequest request)
        {
            string responseString = "";

            //GET

            if (request.HttpMethod == "GET" && request.Url.PathAndQuery == "/api/products")
            {
                var options = new JsonSerializerOptions { WriteIndented = true }; //cette ligne rend le json html jolie
                responseString = JsonSerializer.Serialize(HttpGetAllProducts(), options);
            }
            else if (request.HttpMethod == "GET" && request.Url.PathAndQuery.StartsWith("/api/products/"))
            {
                string[] strings = request.Url.PathAndQuery.Split('/');
                string[] parts = strings; // separe notre url sur les "/"
                if (parts.Length == 4 && int.TryParse(parts[3], out int id))
                {
                    var options = new JsonSerializerOptions { WriteIndented = true }; //cette ligne rend le json html jolie
                    responseString = JsonSerializer.Serialize(HttpGetProductById(id), options);
                    if (responseString == "null")
                    {
                    responseString = "Invalid id, Error =  " + (int)HttpStatusCode.BadRequest;
                    }

                }
                else if (parts.Length > 4)
                {
                    responseString = "bad endpoint, Error =  " + (int)HttpStatusCode.BadRequest;
                }
                else if (request.Url.PathAndQuery == "/api/products/")
                {
                    responseString = "enter a id please, bad endpoint, Error =  " + (int)HttpStatusCode.BadRequest;
                }
                else
                {
                    string myEndPointString = parts[3];

                        var options = new JsonSerializerOptions { WriteIndented = true }; //cette ligne rend le json html jolie

                        responseString = JsonSerializer.Serialize(HttpGetProductByName(myEndPointString), options);


                        if (responseString == "null")
                        {
                            responseString = JsonSerializer.Serialize(HttpGetAllProductByType(myEndPointString), options);    
                        }
                        
                        
                        if (responseString == "null")
                        {
                        responseString = "Invalid Name or Type of products, Error =  " + (int)HttpStatusCode.BadRequest;
                        } 
                    
                }
            }

            // POST


            else if (request.HttpMethod == "POST" && request.Url.PathAndQuery == "/api/products")
            {
                using (var reader = new StreamReader(request.InputStream, request.ContentEncoding))
                {
                    string requestBody = reader.ReadToEnd(); // permet de lire le body de la requete postman json
                    var data = JsonSerializer.Deserialize<Products>(requestBody); //ici data accede au body

                    string name = data.Product_Name;
                    string description = data.Product_Description;
                    string type = data.Product_Type;
                    int numberLeft = data.Product_NumberLeft;
                    int price = data.Product_Price;

                    responseString = HttpPostNewProduct(name, description, type, numberLeft, price);
                }
            }


            //PUT

            else if (request.HttpMethod == "PUT" && request.Url.PathAndQuery.StartsWith("/api/users/"))
            {
                string[] strings = request.Url.PathAndQuery.Split('/');
                string[] parts = strings; // separe notre url sur les "/"
                if (parts.Length == 4 && int.TryParse(parts[3], out int id))
                {
                    try
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
                    catch (Exception ex)
                    {
                        // Gérer l'erreur
                        return $"no or bad body send: {ex.Message}";
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

            // HTTP PATCH


            else if (request.HttpMethod == "PATCH" && request.Url.PathAndQuery.StartsWith("/api/users/"))
            {
                string[] strings = request.Url.PathAndQuery.Split('/');
                string[] parts = strings; // sépare notre URL sur les "/"
                if (parts.Length == 4 && int.TryParse(parts[3], out int id))
                {

                    try
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

                        if (firstName == null && lastName == null && email == null && password == null && phone == null)
                        {
                            responseString = "bad body";
                        }
                        else
                        {
                            var options = new JsonSerializerOptions { WriteIndented = true };
                            responseString = JsonSerializer.Serialize(HttpPatchUserById(id, firstName, lastName, email, password, phone), options);
                        }
                    }
                    }
                    catch (Exception ex)
                    {
                        // Gérer l'erreur
                        return $"no or bad body send: {ex.Message}";
                    }
                }
                else if (parts.Length > 4)
                {
                    responseString = "bad endpoint, Error =  " + (int)HttpStatusCode.BadRequest;
                }
                else if (request.Url.PathAndQuery == "/api/users/")
                {
                    responseString = "enter an id please, bad endpoint, Error =  " + (int)HttpStatusCode.BadRequest;
                }
                else
                {
                    responseString = "not an Id, Error =  " + (int)HttpStatusCode.BadRequest;
                }
            }

            //final return
            return responseString;
        }



        private string HttpPatchUserById(int id, string firstName, string lastName, string email, string password, string phone)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();

                    // cette requete permet de mettre a jour seulement les champs non vide
                    string SqlRequest = "UPDATE users SET ";

                    List<string> updates = new List<string>();

                    if (!string.IsNullOrEmpty(firstName))
                    {
                        updates.Add("User_FirstName = @FirstName");
                    }
                    if (!string.IsNullOrEmpty(lastName))
                    {
                        updates.Add("User_LastName = @LastName");
                    }
                    if (!string.IsNullOrEmpty(email))
                    {
                        updates.Add("User_Email = @Email");
                    }
                    if (!string.IsNullOrEmpty(password))
                    {
                        updates.Add("User_Password = @Password");
                    }
                    if (!string.IsNullOrEmpty(phone))
                    {
                        updates.Add("User_Phone = @Phone");
                    }

                    SqlRequest += string.Join(", ", updates);
                    SqlRequest += " WHERE User_Id = @UserId";

                    //ici on fait des collages pour avoir notre requete sql

                    Console.WriteLine(SqlRequest);

                    using (MySqlCommand command = new MySqlCommand(SqlRequest, connection))
                    {
                        command.Parameters.AddWithValue("@UserId", id);
                        command.Parameters.AddWithValue("@FirstName", firstName);
                        command.Parameters.AddWithValue("@LastName", lastName);
                        command.Parameters.AddWithValue("@Email", email);
                        command.Parameters.AddWithValue("@Password", password);
                        command.Parameters.AddWithValue("@Phone", phone);

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            return "Patch success! User updated!";
                        }
                        else
                        {
                            return "Invalid id or no rows affected.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Gérer l'erreur
                return $"Error during PATCH: {ex.Message}";
            }
        }


        private string HttpPostNewProduct(string name, string description, string type, int numberLeft , int price)
        {
            // sur postman, faire la requete avec un body contenant les infos ci dessus
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();

                    string SqlRequest = "INSERT INTO products (Product_Name, Product_Description, Product_Type, Product_NumberLeft, Product_Price) VALUES (@Name, @Description, @Type, @NumberLeft, @Price)";

                    using (MySqlCommand command = new MySqlCommand(SqlRequest, connection))
                    { // lie les @ a une string
                        command.Parameters.AddWithValue("@Name", name);
                        command.Parameters.AddWithValue("@Description", description);
                        command.Parameters.AddWithValue("@Type", type);
                        command.Parameters.AddWithValue("@NumberLeft", numberLeft);
                        command.Parameters.AddWithValue("@Price", price);

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


        private IEnumerable<Products> HttpGetAllProducts()
        {

        List<Products> products = new List<Products>(); //cree une liste vide

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                string SqlRequest = "SELECT * FROM products"; // recupère tt les products

                using (MySqlCommand command = new MySqlCommand(SqlRequest, connection))
                {
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Products product = new Products // retourne en object les données de ma base SQL
                            {
                                Product_Id = Convert.ToInt32(reader["Product_Id"]),
                                Product_Name = reader["Product_Name"].ToString(),
                                Product_Description = reader["Product_Description"].ToString(),
                                Product_Type = reader["Product_Type"].ToString(),
                                Product_NumberLeft = Convert.ToInt32(reader["Product_NumberLeft"]),
                                Product_Price = Convert.ToInt32(reader["Product_Price"]),
                            };
                            products.Add(product);
                        }
                    }
                }
            }
            return products;
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
                            //cree un user sur le haut de la liste si aucun id atribué
                           //FIXME: // HttpPostNewProduct(firstName, lastName, email, password, phone);
                            return "This Id is empty, New User created";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // gestion de l'erreur
                return $"Error during PUT: {ex.Message}";
            }
        }


        private Products HttpGetProductById(int id)
        {
            
        Products product = null;

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                string SqlRequest = "SELECT * FROM products WHERE Product_Id = @ProductId"; // ma query SQL

                using (MySqlCommand command = new MySqlCommand(SqlRequest, connection))
                {
                    command.Parameters.AddWithValue("@ProductId", id); 
                    // permet d'envoyé des données dans la query par un @ en C#

                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            product = new Products
                            {
                                Product_Id = Convert.ToInt32(reader["Product_Id"]),
                                Product_Name = reader["Product_Name"].ToString(),
                                Product_Description = reader["Product_Description"].ToString(),
                                Product_Type = reader["Product_Type"].ToString(),
                                Product_NumberLeft = Convert.ToInt32(reader["Product_NumberLeft"]),
                                Product_Price = Convert.ToInt32(reader["Product_Price"]),
                            };
                        }
                    }
                }
            }

            return product;
        }

        private Products HttpGetProductByName(string name)
        {
            
        Products product = null;

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                string SqlRequest = "SELECT * FROM products WHERE Product_Name = @ProductName"; // ma query SQL

                using (MySqlCommand command = new MySqlCommand(SqlRequest, connection))
                {
                    command.Parameters.AddWithValue("@ProductName", name); 
                    // permet d'envoyé des données dans la query par un @ en C#

                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            product = new Products
                            {
                                Product_Id = Convert.ToInt32(reader["Product_Id"]),
                                Product_Name = reader["Product_Name"].ToString(),
                                Product_Description = reader["Product_Description"].ToString(),
                                Product_Type = reader["Product_Type"].ToString(),
                                Product_NumberLeft = Convert.ToInt32(reader["Product_NumberLeft"]),
                                Product_Price = Convert.ToInt32(reader["Product_Price"]),
                            };
                        }
                    }
                }
            }

            return product;
        }

        private IEnumerable<Products> HttpGetAllProductByType(string type)
        {
            
        List<Products> products = new List<Products>();

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                string SqlRequest = "SELECT * FROM products WHERE Product_Type = @ProductType"; // ma query SQL

                using (MySqlCommand command = new MySqlCommand(SqlRequest, connection))
                {
                    command.Parameters.AddWithValue("@ProductType", type); 
                    // permet d'envoyé des données dans la query par un @ en C#

                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                             Products product = new Products
                            {
                                Product_Id = Convert.ToInt32(reader["Product_Id"]),
                                Product_Name = reader["Product_Name"].ToString(),
                                Product_Description = reader["Product_Description"].ToString(),
                                Product_Type = reader["Product_Type"].ToString(),
                                Product_NumberLeft = Convert.ToInt32(reader["Product_NumberLeft"]),
                                Product_Price = Convert.ToInt32(reader["Product_Price"]),
                            };
                            products.Add(product);
                        }
                    }
                }
            }

            return products;
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
                return $"Error during DEL: {ex.Message}";
            }
        }

    }

}
