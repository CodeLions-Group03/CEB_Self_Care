using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.Script.Serialization;
using CEB.Classes;

namespace CEB
{
    public partial class Bill : Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected JavaScriptSerializer serializerObj = new JavaScriptSerializer(); // create serializer object
        protected readonly string controller = "DashboardValue";
        protected int n;
        protected List<Account> accounts;
        protected List<List<History>> bills; protected List<List<History>> payments; protected List<DashboardUser> profile;
        protected int[] month = new int[10]; protected double[] value = new double[10];

        protected void Page_Load(object sender, EventArgs e)
        {
            ((Site)Master).LinkDashboard.Attributes["class"] = "has-sub";
            ((Site)Master).LinkUsage.Attributes["class"] = "has-sub";
            ((Site)Master).LinkBill.Attributes["class"] = "has-sub active";
            ((Site)Master).LinkSettings.Attributes["class"] = "has-sub";
            ((Site)Master).LinkContacts.Attributes["class"] = "has-sub";
            ((Site)Master).LinkAbout.Attributes["class"] = "has-sub";

            // get number of accounts
            string method = "GetNumberOfAccounts?userId=" + Convert.ToString(Session["userId"]);
            n = serializerObj.Deserialize<int>(new Request().GetResponse(controller, method));

            // get meter details
            method = "GetMeterDetails?userId=" + Convert.ToString(Session["userId"]) + "&n=" + n;
            accounts = new List<Account>(serializerObj.Deserialize<List<Account>>(new Request().GetResponse(controller, method)));

            // get  bill & payment histories
            bills = new List<List<History>>(); payments = new List<List<History>>();
            for (int i = 0; i < n; i++)
            {
                method = "GetBillHistory?userId=" + Convert.ToString(Session["userId"]) + "&acc=" + accounts[i].AccountNo;
                bills.Insert(i, serializerObj.Deserialize<List<History>>(new Request().GetResponse(controller, method)));
                method = "GetPaymentHistory?userId=" + Convert.ToString(Session["userId"]) + "&acc=" + accounts[i].AccountNo;
                payments.Insert(i, serializerObj.Deserialize<List<History>>(new Request().GetResponse(controller, method)));
            }

            // get user profile details
            method = "GetUserDetail?userId=" + Convert.ToString(Session["userId"]);
            profile = new List<DashboardUser>(serializerObj.Deserialize<List<DashboardUser>>(new Request().GetResponse(controller, method)));
        }
    }
}