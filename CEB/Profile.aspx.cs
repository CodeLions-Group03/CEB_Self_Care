using System;
using System.Collections.Generic;
using System.Web.UI;
using CEB.Models;
using CEB.Classes;
using System.Web.Script.Serialization;

namespace CEB
{
    public partial class Profile : Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected CebSelfCare model;
        protected List<DashboardUser> profile;

        protected void Page_Load(object sender, EventArgs e)
        {
            model = new CebSelfCare(Convert.ToInt32(Session["userId"]));

            ((Site)Master).LinkDashboard.Attributes["class"] = "has-sub";
            ((Site)Master).LinkUsage.Attributes["class"] = "has-sub";
            ((Site)Master).LinkBill.Attributes["class"] = "has-sub";
            ((Site)Master).LinkSettings.Attributes["class"] = "has-sub";
            ((Site)Master).LinkContacts.Attributes["class"] = "has-sub";
            ((Site)Master).LinkAbout.Attributes["class"] = "has-sub";

            JavaScriptSerializer serializerObj = new JavaScriptSerializer(); // create serializer object
            string controller = "DashboardValue";

            // get user profile details
            string method = "GetUserDetail?userId=" + Convert.ToString(Session["userId"]);
            profile = new List<DashboardUser>(serializerObj.Deserialize<List<DashboardUser>>(new Request().GetResponse(controller, method)));

            //set profile picture
            string strBase64 = model.GetProPic();
            if (strBase64 != "noPic")
            {
                profilePicture.ImageUrl = "data:Image/png;base64," + strBase64;
            }
            else
            {
                profilePicture.ImageUrl = "~/res/images/pro_pics/default.png";
            }
        }
    }
}