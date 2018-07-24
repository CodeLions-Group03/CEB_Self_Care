<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usage.aspx.cs" Inherits="CEB.Usage" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row"></div>
    <%-- tab controller --%>
    <div class='panel panel-inverse panel-with-tabs' data-sortable-id='ui-unlimited-tabs-1'>
        <%-- create dynamic account tabs --%>
        <div class='panel-heading p-0'>
            <%-- begin nav tabs --%>
            <div class='tab-overflow'>
                <ul class='nav nav-tabs nav-tabs-inverse'>
                    <li class='prev-button'><a class='text-success' href='javascript:;' data-click='prev-tab'><i class='fa fa-arrow-left'></i></a></li>
                    <%
                        for (int i = 1; i <= n; i++)
                        {
                            if (i == 1)
                            {
                                Response.Write("<li class='active'><a href='#nav-tab-" + i + "' data-toggle='tab'>Account " + i + "</a></li>");
                            }
                            else
                            {
                                Response.Write("<li class=''><a href='#nav-tab-" + i + "' data-toggle='tab'>Account " + i + "</a></li>");
                            }
                        }
                    %>
                    <li class='next-button'><a class='text-success' href='javascript:;' data-click='next-tab'><i class='fa fa-arrow-right'></i></a></li>
                </ul>
            </div>
            <%-- end begin nav tabs --%>
        </div>
        <%-- end create dynamic account tabs --%>
        <%-- content --%>
        <div class='tab-content'>
            <%
                if (n == 0)
                {
                    Response.Write("<h4>Sorry ! You don't have any accounts yet...</h4>");
                }
                else
                {
                    for (int i = 1; i <= n; i++)
                    {
                        if (i == 1)
                        {
                            Response.Write("<div class='tab-pane fade active in' id='nav-tab-" + i + "'>");
                        }
                        else
                        {
                            Response.Write("<div class='tab-pane fade' id='nav-tab-" + i + "'>");
                        }
                        Response.Write("<h3>Account No : " + accounts[i - 1].AccountNo + "</h3><hr>");
            %>
            <div class='row'>
                <%-- this month usage --%>
                <div class='col-md-6'>
                    <h5><i class='fa fa-dashboard fa-2x'> This Month Usage</i></h5>
                    <br />
                    <h1 style='color: grey; text-align: center'>Your current usage</h1>
                    <% Response.Write("<p style='text-align: center' id='realtime_usage_" + i + "' class='fa-4x'>" + accounts[i-1].MonthUsage + " (kWh) </p>"); %>
                    <p class='fa-4x'></p>
                    <br />
                    <ul style='color: red'>
                        <li>Note : </li>
                        <ul>
                            <li>These values are not fixed & change according to your electricity usage.</li>
                            <li>Refresh the page to get new values</li>
                        </ul>
                    </ul>
                </div>
                <%-- end this month usage --%>
                <%-- daily usage --%>
                <div class='col-md-6'>
                    <h5><i class='fa fa-bar-chart-o fa-2x'> Daily Usage</i></h5>

                </div>
                <%-- end daily usage --%>
            </div>
            <hr />
            <div class='row'>
                <%-- usage history --%>
                <div class='col-md-10'>
                    <h5><i class='fa fa-bar-chart-o fa-2x'> Usage History</i></h5>
                    <br />
                    <div class='row'>
                        <% Response.Write("<div id='usage_history_" + i + "' style='max-width: 100%; height: 300px; margin: 0 auto'></div>");
                            for (int j = 0; j < usages[i-1].Count; j++)
                            {
                                month[j] = usages[i - 1][j].Month;
                                value[j] = usages[i - 1][j].Value;
                            }
                        %>
                        <script>
                            Highcharts.chart('usage_history_<% =i %>', { chart: { type: 'column' }, title: { text: '' }, xAxis: { categories: [<% =month[0] %>,<% =month[1] %>,<% =month[2] %>,<% =month[3] %>,<% =month[4] %>,<% =month[5] %>,<% =month[6] %>,<% =month[7] %>,<% =month[8] %>,<% =month[9] %>], crosshair: false }, yAxis: { min: 0, title: { text: 'Usage (kWh)' } }, plotOptions: { column: { pointPadding: 0.2, borderWidth: 0 } }, series: [{ name: 'Month', data: [<% =value[0] %>,<% =value[1] %>,<% =value[2] %>,<% =value[3] %>,<% =value[4] %>,<% =value[5] %>,<% =value[6] %>,<% =value[7] %>,<% =value[8] %>,<% =value[9] %>] }] });
                        </script>
                    </div>
                </div>
                <%-- end usage history --%>
            </div>
            <%
                        Response.Write("</div>");
                    }
                }
            %>
        </div>
        <%-- end content --%>
    </div>
    <%-- end tab controller --%>
</asp:Content>
