using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace CEB
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EmailCheck.Visible = false;

            if (Session["Type"] != null)
            {
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
                    Session["Type"] = null;
                    Session["Request"] = null;
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
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if (r_form_first_name.Text != "" && r_form_NIC_number.Text != "" && r_form_last_name.Text != "" && r_form_address.Text != "" && r_form_email.Text != "" && r_form_contact_number.Text != "" && r_form_password.Text != "" && r_form_confirm_password.Text != "")
            {
                r_form_first_name.BorderColor = Color.White;
                r_form_last_name.BorderColor = Color.White;
                r_form_NIC_number.BorderColor = Color.White;
                r_form_contact_number.BorderColor = Color.White;
                r_form_city.BorderColor = Color.White;
                r_form_address.BorderColor = Color.White;
                r_form_email.BorderColor = Color.White;

                if (r_form_password.Text != r_form_confirm_password.Text)
                {
                    pwd_lable.Visible = true;
                    r_form_confirm_password.BorderColor = Color.Red;
                    r_form_password.BorderColor = Color.Red;
                }
                else
                {
                    r_form_confirm_password.BorderColor = Color.White;
                    r_form_password.BorderColor = Color.White;

                    string[] details = new string[9];
                    details[0] = r_form_first_name.Text;
                    details[1] = r_form_last_name.Text;
                    details[2] = r_form_address.Text;
                    details[3] = r_form_city.Text;
                    details[4] = r_form_NIC_number.Text;
                    details[5] = r_form_contact_number.Text;
                    details[6] = r_form_email.Text;
                    details[7] = new Classes.MySecurity().EncryptMd5(r_form_password.Text);
                    details[8] = title_dropdown.Text;
                    
                    if (new Models.Login(r_form_email.Text).CheckEmailExists() != 0)
                    {
                        EmailCheck.Visible = true;
                        EmailCheck.Text = "* This email address alrady exist";
                    }
                    else
                    {
                        if (new Models.Login(r_form_email.Text).RegisterUser(details))
                        {
                            string guId = new Classes.MySecurity().GuIdCode();
                            int affectedRows2 = new Models.Login(r_form_email.Text).SetGuId(guId);
                            string url1 = "Register.aspx";
                            string url2 = "EmailConfirm.aspx?email=" + r_form_email.Text + "&guId=" + guId;

                            if (new Classes.MyMail().SendActivationEmail(r_form_first_name.Text, r_form_email.Text, url1, url2))
                            {
                                Response.Write("<script LANGUAGE='JavaScript' >alert('Confirmation Email Successfully Send')</script>");
                                Response.Redirect("Login.aspx");
                            }
                            else
                            {
                                Response.Write("<script LANGUAGE='JavaScript'>alert('Error !!, Confirmation Email not send.')</script>");
                            }
                        }
                        else
                        {
                            Response.Write("<script LANGUAGE='JavaScript'>alert('Error !!, Please Register again.')</script>");
                            Response.Redirect("Register.aspx");
                        }
                    }
                }
            }
            else
            {
                pwd_lable.Visible = false;

                if (r_form_first_name.Text != "")
                {
                    r_form_first_name.BorderColor = Color.White;
                }
                else
                {
                    r_form_first_name.BorderColor = Color.Red;
                }

                if (r_form_last_name.Text != "")
                {
                    r_form_last_name.BorderColor = Color.White;
                }
                else
                {
                    r_form_last_name.BorderColor = Color.Red;
                }

                if (r_form_NIC_number.Text != "")
                {
                    r_form_NIC_number.BorderColor = Color.White;
                }
                else
                {
                    r_form_NIC_number.BorderColor = Color.Red;
                }

                if (r_form_address.Text != "")
                {
                    r_form_address.BorderColor = Color.White;
                }
                else
                {
                    r_form_address.BorderColor = Color.Red;
                }

                if (r_form_city.Text != "")
                {
                    r_form_city.BorderColor = Color.White;
                }
                else
                {
                    r_form_city.BorderColor = Color.Red;
                }

                if (r_form_email.Text != "")
                {
                    r_form_email.BorderColor = Color.White;
                }
                else
                {
                    r_form_email.BorderColor = Color.Red;
                }

                if (r_form_contact_number.Text != "")
                {
                    r_form_contact_number.BorderColor = Color.White;
                }
                else
                {
                    r_form_contact_number.BorderColor = Color.Red;
                }

                if (r_form_password.Text != "")
                {
                    r_form_password.BorderColor = Color.White;
                }
                else
                {
                    r_form_password.BorderColor = Color.Red;
                }
                if (r_form_password.Text != "")
                {
                    r_form_confirm_password.BorderColor = Color.White;
                }
                else
                {
                    r_form_confirm_password.BorderColor = Color.Red;
                }
            }
        }
    }
}