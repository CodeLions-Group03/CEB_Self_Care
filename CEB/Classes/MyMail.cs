using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace CEB.Classes
{
    public class MyMail
    {
        public Boolean SendActivationEmail(string firstName, string email, string url1, string url2)
        {
            using (MailMessage mm = new MailMessage("ceb.codelions@gmail.com", email))
            {
                mm.Subject = "Account Conformation";
                string body = "Hello " + firstName + ",";
                body += "<br /><br />Please click the following link to confirm your account";
                body += "<br /><a href = '" + HttpContext.Current.Request.Url.AbsoluteUri.Replace(url1, url2) + "'>Click here to confirm your account.</a>";
                body += "<br /><br />Thanks";
                mm.Body = body;
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    EnableSsl = true
                };
                NetworkCredential NetworkCred = new NetworkCredential("ceb.codelions@gmail.com", "codelions321");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
            }
            return true;
        }

        public Boolean SendResetPasswordEmail(string firstName, string email, string url1, string url2)
        {
            using (MailMessage mm = new MailMessage("ceb.codelions@gmail.com", email))
            {
                mm.Subject = "Reset Password";
                string body = "Hello " + firstName + ",";
                body += "<br /><br />Please click the following link to reset your password";
                body += "<br /><a href = '" + HttpContext.Current.Request.Url.AbsoluteUri.Replace(url1, url2) + "'>Click here to reset your password.</a>";
                body += "<br /><br />Thanks";
                mm.Body = body;
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    EnableSsl = true
                };
                NetworkCredential NetworkCred = new NetworkCredential("ceb.codelions@gmail.com", "codelions321");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
            }
            return true;
        }
    }
}