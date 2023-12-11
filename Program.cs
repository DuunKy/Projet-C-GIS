using System;
using System.Net;
using System.Text;
using System.Threading;

class SimpleHttpServer
{
    static void Main()
    {
        HttpListener listener = new HttpListener();
        listener.Prefixes.Add("http://localhost:8080/");
        listener.Start();

        Console.WriteLine("Server listening on http://localhost:8080/");

        while (true)
        {
            HttpListenerContext context = listener.GetContext();
            ThreadPool.QueueUserWorkItem(HandleRequest, context);
        }
    }

    static void HandleRequest(object state)
    {
        HttpListenerContext context = (HttpListenerContext)state;
        HttpListenerRequest request = context.Request;
        HttpListenerResponse response = context.Response;

        string responseString = "";

        // Simple routing based on the request URL
        if (request.Url.AbsolutePath == "/")
        {
            responseString = "<html><body>Hello, World! (Root)</body></html>";
        }
        else if (request.Url.AbsolutePath == "/route1")
        {
            responseString = "<html><body>Hello, World! (Route 1)</body></html>";
        }
        else if (request.Url.AbsolutePath == "/route2")
        {
            responseString = "<html><body>Hello, World! (Route 2)</body></html>";
        }
        else
        {
            responseString = "<html><body>404 Not Found</body></html>";
            response.StatusCode = (int)HttpStatusCode.NotFound;
        }

        byte[] buffer = Encoding.UTF8.GetBytes(responseString);
        response.ContentLength64 = buffer.Length;
        response.OutputStream.Write(buffer, 0, buffer.Length);
        response.Close();
    }
}
