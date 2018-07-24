using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEB
{
    public partial class Login : Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["Type"] != null)
            {
                string x = Session["Type"].ToString();

                if (Session["Type"].ToString() == "Success")
                {
                    Links.ForeColor = System.Drawing.Color.Lime;
                    if (Session["Request"] != null)
                    {
                        Links.Text = Session["Request"].ToString();
                    }
                    else
                    {
                        Links.Text = "";
                    }
                    Session["Request"] = null;
                    Session["Type"] = null;
                }
                else if (Session["Type"].ToString() == "Error")
                {
                    Links.ForeColor = System.Drawing.Color.Red;
                    if (Session["Request"] != null)
                    {
                        Links.Text = Session["Request"].ToString();
                    }
                    else
                    {
                        Links.Text = "";
                    }
                    Session["Type"] = null;
                    Session["Request"] = null;
                }
            }


            if (Session["userId"] != null)
            {
                Response.Redirect("~/Dashboard.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ResetPwdBtn.Visible = false;
            LoginBtn.Visible = false;
            if (!IsPostBack)
            {
                if (Request.Cookies["UNAME"] != null && Request.Cookies["PWD"] != null)
                {
                    login_email.Text = Request.Cookies["UNAME"].Value;
                    login_pwd.Attributes["value"] = Request.Cookies["PWD"].Value;
                    CheckBox1.Checked = true;
                }
            }
        }

        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Register.aspx");
        }

        protected void RefreshBtn_Click(object sender, ImageClickEventArgs e)
        {
            string[] userDetails = new Models.Login(login_email.Text).GetUserDetail();
            string guId = new Classes.MySecurity().GuIdCode();
            int affectedRows = new Models.Login(login_email.Text).SetGuId(guId);
            string url1 = "Login.aspx";
            string url2 = "EmailConfirm.aspx?email=" + login_email.Text + "&guId=" + guId;

            if (new Classes.MyMail().SendActivationEmail(userDetails[0], login_email.Text, url1, url2))
            {
                Response.Write("<script LANGUAGE='JavaScript'>alert('Confirmation Email Successfully Send')</script>");
            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript'>alert('Error !!')</script>");
            }
        }

        protected Boolean ResetPassword(string firstname, string email, string url1, string url2, string guId)
        {
            int affectedRows = new Models.Login(email).SetGuId(guId);

            if (affectedRows != 0)
            {
                if (new Classes.MyMail().SendResetPasswordEmail(firstname, email, url1, url2))
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Password Reset Email Successfully Send')</script>");
                }
                else
                {
                    Response.Write("<script LANGUAGE='JavaScript'>alert('Error !!, Confirmation Email not send.')</script>");
                }
                return true;
            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('ERROR, Incorrect Email address !!')</script>");
                return false;
            }
        }

        protected void PasswordResetBtn_Click(object sender, EventArgs e)
        {
            TitleLbl.Text = "Send Paasword Reset Link";
            pwd_reset.Visible = false;
            login_pwd.Visible = false;
            check.Text = "";
            CheckBox1.Visible = false;
            Label1.Visible = false;
            sign_in.Visible = false;
            ResetPwdBtn.Visible = true;
            LoginBtn.Visible = true;
            register_btn.Visible = false;
        }

        protected void SigninBtn_Click(object sender, EventArgs e)
        {

            if (login_email.Text == "" || login_pwd.Text == "")
            {
                login_email.BorderColor = System.Drawing.Color.Red;
                login_pwd.BorderColor = System.Drawing.Color.Red;
                check.Text = "Incorrect User Name or Password !";
            }
            else
            {
                string[] userDetails = new Models.Login(login_email.Text).GetUserDetail();
                string pwd_entered = new Classes.MySecurity().EncryptMd5(login_pwd.Text);

                if (new Models.Login(login_email.Text).CheckEmailExists() != 0)
                {
                    if (pwd_entered == userDetails[1])
                    {
                        if (userDetails[3] == "Active")
                        {
                            if (CheckBox1.Checked)
                            {
                                Response.Cookies["UNAME"].Value = login_email.Text;
                                Response.Cookies["PWD"].Value = login_pwd.Text;
                                Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(7);
                                Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(7);
                            }
                            else
                            {
                                Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
                                Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(-1);
                            }
                            check.Text = "Match";
                            Session["userId"] = userDetails[2];
                            if (userDetails[5] == "Admin")
                            {
                                Response.Redirect("http://cebadmin.azurewebsites.net/AdminWebForms/adminIndex.aspx");
                            }
                            else if (userDetails[5] == "Customer")
                            {
                                Response.Redirect("~/Dashboard.aspx");
                            }
                        }
                        else
                        {
                            check.Text = "Please Confirm your Account," + "<br />" + "Click here to Resend Link ! ";
                            refresh_btn_image.Visible = true;
                        }
                    }
                    else
                    {
                        login_email.BorderColor = System.Drawing.Color.Red;
                        login_pwd.BorderColor = System.Drawing.Color.Red;
                        check.Text = "Wrong Password";
                        pwd_reset.Visible = true;
                    }
                }
                else
                {
                    check.Text = "Please Create an Account, Before Sign In !!";
                }
            }
        }

        protected void ResetPwdBtn_Click(object sender, EventArgs e)
        {
            if (login_email.Text == "")
            {
                check.Text = "Please Enter Email address";
            }
            else
            {
                string[] userDetails = new Models.Login(login_email.Text).GetUserDetail();
                string guId = new Classes.MySecurity().GuIdCode();
                int affectedRows = new Models.Login(login_email.Text).SetGuId(guId);
                string url1 = "Login.aspx";
                string url2 = "PasswordReset.aspx?email=" + login_email.Text + "&guId=" + guId;

                if (!ResetPassword(userDetails[0], login_email.Text, url1, url2, guId))
                {
                    ResetPwdBtn.Visible = true;
                }
                else
                {
                    LoginBtn.Visible = true;
                    register_btn.Visible = false;
                }
            }
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}