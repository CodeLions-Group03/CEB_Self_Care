using CEB.Classes;
using System;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using System.Web.UI;

namespace CEB
{
    public partial class Dashboard : Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected int n;
        protected List<Account> accounts;

        protected void Page_Load(object sender, EventArgs e)
        {
            ((Site)Master).LinkDashboard.Attributes["class"] = "has-sub active";
            ((Site)Master).LinkUsage.Attributes["class"] = "has-sub";
            ((Site)Master).LinkBill.Attributes["class"] = "has-sub";
            ((Site)Master).LinkSettings.Attributes["class"] = "has-sub";
            ((Site)Master).LinkContacts.Attributes["class"] = "has-sub";
            ((Site)Master).LinkAbout.Attributes["class"] = "has-sub";

            JavaScriptSerializer serializerObj = new JavaScriptSerializer();
            string controller = "DashboardValue";

            // get number of accounts
            string method = "GetNumberOfAccounts?userId=" + Convert.ToString(Session["userId"]);
            n = serializerObj.Deserialize<int>(new Request().GetResponse(controller, method));

            // get meter details
            method = "GetMeterDetails?userId=" + Convert.ToString(Session["userId"]) + "&n=" + n;
            accounts = new List<Account>(serializerObj.Deserialize<List<Account>>(new Request().GetResponse(controller, method)));
        }
    }
}