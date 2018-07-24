using System;
using System.Web.UI;

namespace CEB
{
    public partial class FAQ : Page
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
        }
    }
}