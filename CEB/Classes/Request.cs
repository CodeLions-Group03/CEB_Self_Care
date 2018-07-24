using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;

namespace CEB.Classes
{
    public class Request
    {
        public string GetResponse(string controller, string method)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://cebwebapi.azurewebsites.net/api/" + controller + "/" + method); // create request object

            request.Method = WebRequestMethods.Http.Get; // set request method
            request.Accept = "application/json"; // set response data type

            HttpWebResponse response = (HttpWebResponse)request.GetResponse(); // create response object

            StreamReader streamReader = new StreamReader(response.GetResponseStream()); // create stream reader object
            string outputJson = streamReader.ReadToEnd(); // read response data
            streamReader.Close(); // close stream reader

            response.Close(); // close response

            return outputJson;
        }
    }
}