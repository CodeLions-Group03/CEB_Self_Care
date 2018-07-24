using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;

namespace CEB.Hubs
{
    public class DashboardHub : Hub
    {
        public void UpdateMeterReading(string value, string conId)
        {
            Clients.Client(conId).broadcastMessage(value);
        }

        public void UpdateMonthUsage(string value, string conId)
        {
            Clients.Client(conId).broadcastMessage(value);
        }
    }
}