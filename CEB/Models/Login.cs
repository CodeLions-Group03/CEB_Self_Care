using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CEB.Models
{
    public class Login
    {
        private readonly string cs = ConfigurationManager.ConnectionStrings["CEBConnectionString"].ConnectionString;
        private readonly string email;

        private string[] a;
        private int b;

        public Login(string email)
        {
            this.email = email;
        }

        public Boolean RegisterUser(string[] details)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand sql = new SqlCommand("INSERT INTO Users(firstName,lastName,address,city,nic,phone,email,userType,password,status,title) VALUES ('" + details[0] + "','" + details[1] + "','" + details[2] + "','" + details[3] + "','" + details[4] + "'," + Convert.ToInt32(details[5]) + ",'" + details[6] + "','Customer','" + details[7] + "','NotActive','" + details[8] + "')", con);
                b = sql.ExecuteNonQuery();
            }
            return true;
        }

        public string[] GetUserDetail()
        {
            a = new string[6];
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand sql = new SqlCommand("SELECT firstName,password,userId,status,guId,userType FROM Users WHERE email='" + email + "'", con);
                SqlDataReader reader = sql.ExecuteReader();
                while (reader.Read())
                {
                    a[0] = Convert.ToString(reader.GetValue(0));
                    a[1] = Convert.ToString(reader.GetValue(1));
                    a[2] = Convert.ToString(reader.GetValue(2));
                    a[3] = Convert.ToString(reader.GetValue(3));
                    a[4] = Convert.ToString(reader.GetValue(4));
                    a[5] = Convert.ToString(reader.GetValue(5));
                }
            }
            return a;
        }

        public int ActivateUsers()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand sql = new SqlCommand("UPDATE Users SET status='Active' WHERE email = '" + email + "'", con);
                b = sql.ExecuteNonQuery();
            }
            return b;
        }

        public int CheckEmailExists()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand sql = new SqlCommand("SELECT COUNT(*) FROM Users WHERE email='" + email + "'", con);
                b = (int)sql.ExecuteScalar();
            }
            return b;
        }

        public int UpdatePassword(string pwd)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand sql = new SqlCommand("UPDATE Users SET password='" + pwd + "' WHERE email ='" + email + "'", con);
                b = (int)sql.ExecuteNonQuery();
            }
            return b;
        }

        public int SetGuId(string guId)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                conn.Open();
                SqlCommand sql = new SqlCommand("UPDATE Users SET guId = '" + guId + "' WHERE email = '" + email + "'", conn);
                b = (int)sql.ExecuteNonQuery();
            }
            return b;
        }

        public int DeleteGuId()
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                conn.Open();
                SqlCommand sql = new SqlCommand("UPDATE Users SET guId= NULL WHERE email='" + email + "' ", conn);
                b = (int)sql.ExecuteNonQuery();
            }
            return b;
        }

    }
}