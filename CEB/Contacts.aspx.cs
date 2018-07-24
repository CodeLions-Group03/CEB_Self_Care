using System;
using System.Web.UI;
using System.Web.Script.Serialization;
using CEB.Classes;

namespace CEB
{
    public partial class Contacts : Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected JavaScriptSerializer serializerObj = new JavaScriptSerializer(); // create serializer object
        protected readonly string controller = "DashboardValue"; // controller string

        protected void Page_Load(object sender, EventArgs e)
        {
            ((Site)Master).LinkDashboard.Attributes["class"] = "has-sub";
            ((Site)Master).LinkUsage.Attributes["class"] = "has-sub";
            ((Site)Master).LinkBill.Attributes["class"] = "has-sub";
            ((Site)Master).LinkSettings.Attributes["class"] = "has-sub";
            ((Site)Master).LinkContacts.Attributes["class"] = "has-sub active";
            ((Site)Master).LinkAbout.Attributes["class"] = "has-sub";

            string method = "GetNumberOfAccounts?userId=" + Convert.ToString(Session["userId"]); // method string
            int n = serializerObj.Deserialize<int>(new Request().GetResponse(controller, method)); // deserialize the json string
            if (n == 0)
            {
                p1.Visible = true;
            }
            else
            {
                p2.Visible = true;
            }
        }
    }
}