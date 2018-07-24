using System;
using System.Web.UI;
using CEB.Classes;
using System.Web.Script.Serialization;

namespace CEB
{
    public partial class Inbox : Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ((Site)Master).LinkDashboard.Attributes["class"] = "has-sub";
            ((Site)Master).LinkUsage.Attributes["class"] = "has-sub";
            ((Site)Master).LinkBill.Attributes["class"] = "has-sub";
            ((Site)Master).LinkSettings.Attributes["class"] = "has-sub";
            ((Site)Master).LinkContacts.Attributes["class"] = "has-sub";
            ((Site)Master).LinkAbout.Attributes["class"] = "has-sub";

            JavaScriptSerializer serializerObj = new JavaScriptSerializer();
            string controller = "DashboardValue";

            // update last visited time
            string method = "UpdateLastVisitedTime?userId=" + Session["userId"] + "&str=LastVisitedMessages";
            new Request().GetResponse(controller, method);
        }
    }
}