using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CEB.Classes
{
    public class MyPanel
    {
        public void CreateContactNo()
        {
            HttpContext.Current.Response.Write("<div class='panel panel-inverse' data-sortable-id='ui-widget-5' data-scrollbar='true' data-height='470px'>");
            HttpContext.Current.Response.Write("<div class='panel-heading'>");
            HttpContext.Current.Response.Write("<h4 class='panel-title'>Contact Numbers</h4>");
            HttpContext.Current.Response.Write("</div>");
            HttpContext.Current.Response.Write("<div class='panel-body'>");
            HttpContext.Current.Response.Write("<p>Call Center : 1987</p>");
            HttpContext.Current.Response.Write("<p>Ampara Area Office : 063-2222078</p>");
            HttpContext.Current.Response.Write("<p>Anuradapura Area Office : 025-2223222</p>");
            HttpContext.Current.Response.Write("<p>Badulla Area Office : 055-2222023</p>");
            HttpContext.Current.Response.Write("<p>Batticaloa Area Office : 065-2222639</p>");
            HttpContext.Current.Response.Write("<p>Colombo East Area Office : 011-2694296</p>");
            HttpContext.Current.Response.Write("<p>Colombo North Area Office : 011-2337672</p>");
            HttpContext.Current.Response.Write("<p>Colombo South Area Office : 011-2828427</p>");
            HttpContext.Current.Response.Write("<p>Colombo West Area Office : 011-2574159</p>");
            HttpContext.Current.Response.Write("<p>Galle Area Office : 091-2234344</p>");
            HttpContext.Current.Response.Write("<p>Gampaha Area Office : 033-4937475</p>");
            HttpContext.Current.Response.Write("<p>Hambanthota Area Office : 047-22561608</p>");
            HttpContext.Current.Response.Write("<p>Jaffna Area Office : 021-3212261</p>");
            HttpContext.Current.Response.Write("<p>Kalutara Area Office : 034-2237399</p>");
            HttpContext.Current.Response.Write("<p>Kandy City Area Office : 081-2232091</p>");
            HttpContext.Current.Response.Write("<p>Kegalle Area Office : 035-4928099</p>");
            HttpContext.Current.Response.Write("<p>Kilinochchi Area Office : 021-2283787</p>");
            HttpContext.Current.Response.Write("<p>Kurunegala Area Office : 037-2222192</p>");
            HttpContext.Current.Response.Write("<p>Matale Area Office : 066-2222745</p>");
            HttpContext.Current.Response.Write("<p>Matara Area Office : 041-2222322</p>");
            HttpContext.Current.Response.Write("<p>Monaragala Area Office : 055-2277351</p>");
            HttpContext.Current.Response.Write("<p>Nuwara Eliya Area Office : 052-2222918</p>");
            HttpContext.Current.Response.Write("<p>Puttalama Area Office : 032-2265995</p>");
            HttpContext.Current.Response.Write("<p>Rathnapura Area Office : 045-2222701</p>");
            HttpContext.Current.Response.Write("<p>Trincomalee Area Office : 026-2220060</p>");
            HttpContext.Current.Response.Write("<p>Vavuniya Area Office : 024-2222379</p>");
            HttpContext.Current.Response.Write("</div>");
            HttpContext.Current.Response.Write("</div>");
        }

        public void CreateAndroidAd()
        {
            HttpContext.Current.Response.Write("<div class='panel panel-inverse' data-sortable-id='ui-widget-5' data-height='400px'>");
            HttpContext.Current.Response.Write("<div class='panel-heading'>");
            HttpContext.Current.Response.Write("<h4 class='panel-title'>Download Our Android App</h4>");
            HttpContext.Current.Response.Write("</div>");
            HttpContext.Current.Response.Write("<div class='panel-body'>");
            HttpContext.Current.Response.Write("<img src='../res/images/android.jpg' style='width:100%' />");
            HttpContext.Current.Response.Write("</div>");
            HttpContext.Current.Response.Write("</div>");
        }
    }
}