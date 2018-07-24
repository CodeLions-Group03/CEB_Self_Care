using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEB
{
    public partial class EmailConfirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string email = Request.QueryString["email"];
                string guId = Request.QueryString["guId"];

                Models.Login loginObj = new Models.Login(email);
                string[] userDetails = loginObj.GetUserDetail();
                int x = loginObj.CheckEmailExists();
                int affectedRows;

                if (x != 0)
                {
                    if (userDetails[4] == "" || userDetails[4] != guId)
                    {
                        Response.Write("<script LANGUAGE='JavaScript' >alert('Your link has Expired !!, Please resend link')</script>");
                        CheckEmailConfirm.Text = "Resend Email Confirmation Link !!";
                    }
                    else if (userDetails[4] == guId)
                    {
                        if (userDetails[3] != "Active")
                        {
                            affectedRows = new Models.Login(email).ActivateUsers();
                            if (affectedRows != 0)
                            {
                                Response.Write("<script LANGUAGE='JavaScript' >alert('Activation successful, Please Sign in !!')</script>");
                                new Models.Login(email).DeleteGuId();
                                Session["Request"] = "Activation Successful, Please Sign in !!";
                                Session["Type"] = "Success";
                                Response.Redirect("~/Login.aspx");
                            }
                            else
                            {
                                Response.Write("<script LANGUAGE='JavaScript' >alert('Error !')</script>");
                            }
                        }
                        else
                        {
                            Session["Request"] = "Your account has alrady Activated, Please Sign in !!";
                            Session["Type"] = "Error";
                            Response.Redirect("~/Login.aspx");
                        }
                    }
                }
                
                else
                {
                    Session["Request"] = "Please Sign Up AGAIN !!";
                    Session["Type"] = "Error";
                    Response.Redirect("~/Register.aspx");
                }


            }
        }
    }
}