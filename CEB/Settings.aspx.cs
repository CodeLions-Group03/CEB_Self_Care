using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using CEB.Models;
using CEB.Classes;

namespace CEB
{
    public partial class Settings : Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected CebSelfCare model;
        protected List<DashboardUser> profile1;
        protected List<LoginUser> profile2;

        protected void Page_Load(object sender, EventArgs e)
        {
            model = new CebSelfCare(Convert.ToInt32(Session["userId"]));

            ((Site)Master).LinkDashboard.Attributes["class"] = "has-sub";
            ((Site)Master).LinkUsage.Attributes["class"] = "has-sub";
            ((Site)Master).LinkBill.Attributes["class"] = "has-sub";
            ((Site)Master).LinkSettings.Attributes["class"] = "has-sub active";
            ((Site)Master).LinkContacts.Attributes["class"] = "has-sub";
            ((Site)Master).LinkAbout.Attributes["class"] = "has-sub";

            if (!IsPostBack)
            {
                uploadLabel.Visible = false;
            }
        }

        protected void BtnUpload_Click(object sender, EventArgs e)
        {

            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string fileName = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(fileName);
            int fileSize = postedFile.ContentLength;

            if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".bmp" || fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png")
            {
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                int affectedRows = model.UpdateProPic(bytes);
                uploadLabel.Visible = true;
                if (affectedRows != 0)
                {
                    Response.Redirect("~/Dashboard.aspx");
                }
                else
                {
                    uploadLabel.Text = "Error!";
                    uploadLabel.ForeColor = Color.Red;
                }
            }
            else
            {
                uploadLabel.Visible = true;
                uploadLabel.Text = "Only images (.jpg, .bmp, .gif, .png) can be uploaded !";
                uploadLabel.ForeColor = Color.Red;
            }
        }

        protected void BtnPassword_Click(object sender, EventArgs e)
        {
            JavaScriptSerializer serializerObj = new JavaScriptSerializer();
            string controller = "DashboardValue";
            string method = "GetUserDetail?userId=" + Convert.ToString(Session["userId"]);
            profile1 = new List<DashboardUser>(serializerObj.Deserialize<List<DashboardUser>>(new Request().GetResponse(controller, method))); // get user details from dashboard user class

            controller = "LoginValue";
            method = "GetUserDetail?email=" + profile1[0].Email;
            profile2 = new List<LoginUser>(serializerObj.Deserialize<List<LoginUser>>(new Request().GetResponse(controller, method))); // get user details from login user class

            MySecurity secObj = new MySecurity();
            string oldPwd = profile2[0].Password;

            if (oldPwd == secObj.EncryptMd5(txtCurrentPassword.Text))
            {
                int status = model.ChangePassword(secObj.EncryptMd5(txtNewPassword.Text));
                if (status != 0)
                {
                    Response.Redirect("~/Dashboard.aspx");
                }
                else
                {
                    changePwd.Visible = true;
                    changePwd.Text = "Error!";
                    changePwd.BackColor = Color.Red;
                }
            }
            else
            {
                changePwd.Visible = true;
                changePwd.Text = "Your current password is incorrect!";
                changePwd.BackColor = Color.Red;
            }
        }
    }
}