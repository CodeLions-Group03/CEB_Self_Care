using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using CEB.Classes;
using CEB.Models;
using System.Web.Script.Serialization;

namespace CEB
{
    public partial class Site : MasterPage
    {
        protected CebSelfCare model;
        protected List<DashboardUser> profile;
        protected List<MetalBox> metalBoxes;
        protected JavaScriptSerializer serializerObj = new JavaScriptSerializer();
        string controller = "DashboardValue";

        protected void Page_Load(object sender, EventArgs e)
        {
            model = new CebSelfCare(Convert.ToInt32(Session["userId"]));

            string method = "GetUserDetail?userId=" + Convert.ToString(Session["userId"]);
            profile = new List<DashboardUser>(serializerObj.Deserialize<List<DashboardUser>>(new Request().GetResponse(controller, method)));

            //set user name
            LabelUsername.Text = profile[0].FirstName + " " + profile[0].LastName;

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

        public HtmlGenericControl LinkDashboard
        {
            get { return this.dashboard; }
        }
        public HtmlGenericControl LinkUsage
        {
            get { return this.usage; }
        }
        public HtmlGenericControl LinkBill
        {
            get { return this.bill; }
        }
        public HtmlGenericControl LinkSettings
        {
            get { return this.settings; }
        }
        public HtmlGenericControl LinkContacts
        {
            get { return this.contacts; }
        }
        public HtmlGenericControl LinkAbout
        {
            get { return this.about; }
        }

        protected void InboxUpdate(object sender, EventArgs e)
        {
            string method = "UpdateMetalBoxes?userId=" + Convert.ToString(Session["userId"]);
            metalBoxes = new List<MetalBox>(serializerObj.Deserialize<List<MetalBox>>(new Request().GetResponse(controller, method)));

            string str = metalBoxes[0].Inbox;
            if (str != "null")
            {
                LabelInbox.Text = str + " New Message(s)";
            }
        }

        protected void NoticeUpdate(object sender, EventArgs e)
        {
            string method = "UpdateMetalBoxes?userId=" + Convert.ToString(Session["userId"]);
            metalBoxes = new List<MetalBox>(serializerObj.Deserialize<List<MetalBox>>(new Request().GetResponse(controller, method)));

            string str = metalBoxes[0].Notice;
            if (str != "null")
            {
                LabelNotice.Text = str + " New Notice(s)";
            }
        }
    }
}