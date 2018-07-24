using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEB
{
    public partial class PasswordReset : System.Web.UI.Page
    {
        protected string guId;
        protected string email;

        protected void Page_Load(object sender, EventArgs e)
        {
            guId = Request.QueryString["guId"];
            email = Request.QueryString["email"];

            string[] userDetails = new Models.Login(email).GetUserDetail();

            if (userDetails[4] == "" || userDetails[4] != guId)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Your link has Expired !!, Please resend link')</script>");
                pwd_rest_btn.Visible = false;
                reset_confirm_pwd.Visible = false;
                reset_pwd.Visible = false;
                check_pwd.Text = "Resend Password reset Link !!";
                Session["Request"] = "Resend Password reset Link !!";
                Session["Type"] = "Error";
                Response.Redirect("~/Login.aspx");
            }

        }

        protected void PasswordResetBtn_Click(object sender, EventArgs e)
        {
            if (reset_pwd.Text != "" && reset_confirm_pwd.Text != "")
            {
                if (reset_pwd.Text == reset_confirm_pwd.Text)
                {
                    string pwd = new Classes.MySecurity().EncryptMd5(reset_pwd.Text);
                    int affectedRows = new Models.Login(email).UpdatePassword(pwd);
                    if (affectedRows != 0)
                    {
                        new Models.Login(email).DeleteGuId();
                        Session["Request"] = "Password reset Successful, Please Login !!";
                        Session["Type"] = "Success";
                        Response.Redirect("~/Login.aspx");
                    }
                    else
                    {
                        check_pwd.Text = "Error !";
                    }
                }
                else
                {
                    check_pwd.Text = "Passwords not Match";
                }
            }
            else
            {
                check_pwd.Text = "Invalid Password";
            }
        }
    }
}