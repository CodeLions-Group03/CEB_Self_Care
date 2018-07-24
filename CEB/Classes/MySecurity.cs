using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;

namespace CEB.Classes
{
    public class MySecurity
    {
        public string EncryptMd5(string str)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] data = System.Text.Encoding.ASCII.GetBytes(str);
            data = md5.ComputeHash(data);
            String md5Hash = System.Text.Encoding.ASCII.GetString(data);

            return md5Hash;
        }

        public string GuIdCode()
        {
            String myGuId = Guid.NewGuid().ToString();
            return myGuId;
        }
    }
}