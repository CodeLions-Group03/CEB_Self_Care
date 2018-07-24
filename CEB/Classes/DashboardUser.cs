using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CEB.Classes
{
    public class DashboardUser
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Nic { get; set; }
        public string Title { get; set; }
        public string UserType { get; set; }
        public string LastVisitedMessages { get; set; }
        public string LastVisitedNotices { get; set; }
    }
}