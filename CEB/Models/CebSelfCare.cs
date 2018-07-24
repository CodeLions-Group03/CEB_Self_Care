using System;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace CEB.Models
{
    public class CebSelfCare
    {
        private readonly string cs = ConfigurationManager.ConnectionStrings["CEBConnectionString"].ConnectionString;
        private readonly int userId;

        public CebSelfCare(int userId)
        {
            this.userId = userId;
        }

        private int a;

        public string GetProPic()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand sql = new SqlCommand("SELECT COUNT(profilePicture) FROM Users WHERE userId=" + userId, con);
                int count = Convert.ToInt32(sql.ExecuteScalar());
                if (count != 0)
                {
                    sql = new SqlCommand("SELECT profilePicture FROM Users WHERE userId=" + userId, con);
                    byte[] bytes = (byte[])sql.ExecuteScalar();
                    return Convert.ToBase64String(bytes);
                }
                else
                {
                    return "noPic";
                }
            }
        }

        public int UpdateProPic(byte[] pic)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand sql = new SqlCommand("UPDATE Users SET profilePicture=@array WHERE userId=@userID", con);
                sql.Parameters.Add("@array", SqlDbType.VarBinary).Value = pic;
                sql.Parameters.Add("@userID", SqlDbType.Int).Value = userId;
                a = sql.ExecuteNonQuery();
            }
            return a;
        }

        public int ChangePassword(string newPwd)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand sql = new SqlCommand("UPDATE Users SET password='" + newPwd + "' WHERE userId=" + userId, con);
                a = sql.ExecuteNonQuery();
            }
            return a;
        }

        public void UpdateLastVisitedTime(string str)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand sql = new SqlCommand("UPDATE Users SET " + str + "='" + DateTime.Now + "' WHERE userId=" + Convert.ToInt32(HttpContext.Current.Session["userId"]), con); // userid should be userId of current user
                sql.ExecuteNonQuery();
            }
        }
    }
}