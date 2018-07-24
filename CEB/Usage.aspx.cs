using System;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using System.Web.UI;
using CEB.Classes;

namespace CEB
{
    public partial class Usage : Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (base.Session["userId"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected int n;
        protected List<Account> accounts; protected List<List<History>> usages;
        protected int[] month = new int[10]; protected double[] value = new double[10];

        protected void Page_Load(object sender, EventArgs e)
        {
            ((Site)Master).LinkDashboard.Attributes["class"] = "has-sub";
            ((Site)Master).LinkUsage.Attributes["class"] = "has-sub active";
            ((Site)Master).LinkBill.Attributes["class"] = "has-sub";
            ((Site)Master).LinkSettings.Attributes["class"] = "has-sub";
            ((Site)Master).LinkContacts.Attributes["class"] = "has-sub";
            ((Site)Master).LinkAbout.Attributes["class"] = "has-sub";

            JavaScriptSerializer serializerObj = new JavaScriptSerializer(); // create serializer object
            string controller = "DashboardValue";

            // get number of accounts
            string method = "GetNumberOfAccounts?userId=" + Convert.ToString(Session["userId"]);
            n = serializerObj.Deserialize<int>(new Request().GetResponse(controller, method));

            // get meter details
            method = "GetMeterDetails?userId=" + Convert.ToString(Session["userId"]) + "&n=" + n;
            accounts = new List<Account>(serializerObj.Deserialize<List<Account>>(new Request().GetResponse(controller, method)));

            // get usage history
            usages = new List<List<History>>();
            for (int i = 0; i < n; i++)
            {
                method = "GetUsageHistory?userId=" + Convert.ToString(Session["userId"]) + "&acc=" + accounts[i].AccountNo;
                usages.Insert(i, serializerObj.Deserialize<List<History>>(new Request().GetResponse(controller, method)));
            }
        }
    }
}
