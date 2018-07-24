<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Bill.aspx.cs" Inherits="CEB.Bill" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class='row'></div>
    <%--tab controller--%>
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
            <div class="row">
                <%--this month bill--%>
                <div class='col-md-6'>
                    <h5><i class='fa fa-book fa-2x'> This Month Bill</i></h5>

                </div>
                <%--end this month bill--%>
                <%--pay bills--%>
                <div class='col-md-6'>
                    <h5><i class='fa fa-credit-card fa-2x'> Pay Your Bills</i></h5>
                    <% Response.Write("<form id='form_" + i + "' class='form-horizontal' method='post' action='https://sandbox.payhere.lk/pay/checkout'>"); %>
                    <div>
                        <input type='hidden' name='merchant_id' value='1211039' />
                        <input type='hidden' name='return_url' value='http://sample.com/return' />
                        <input type='hidden' name='cancel_url' value='http://http://localhost:51827/Dashboard.aspx' />
                        <input type='hidden' name='notify_url' value='http://sample.com/notify' />
                        <input type='hidden' name='order_id' value='ItemNo12345' />
                        <input type='hidden' name='items' value='Electricity Bill Payment' style='font-weight: bold; border-style: none' />
                        <div class='row'>
                            <div class='col-md-6'>
                                <label class='control-label'>Amount (LKR) : </label>
                                <input type='hidden' name='currency' value='LKR' />
                                <input class='form-control' type='text' name='amount' required />
                            </div>
                            <div class='col-md-6'>
                                <label class='control-label'>Account No : </label>
                                <% Response.Write("<input class='form-control' type='text' name='account_no' value=" + accounts[i - 1].AccountNo + " readonly />"); %>
                            </div>
                        </div>
                        <br />
                        <label class='control-label'>Customer Details : </label>
                        <div class='row'>
                            <div class='col-md-6'>
                                <% Response.Write("<input class='form-control' type='text' name='first_name' value=" + profile[0].FirstName + " readonly />"); %>
                            </div>
                            <div class='col-md-6'>
                                <% Response.Write("<input class='form-control' type='text' name='last_name' value=" + profile[0].LastName + " readonly />"); %>
                            </div>
                        </div>
                        <br />
                        <div class='row'>
                            <div class='col-md-6'>
                                <% Response.Write("<input class='form-control' type='text' name='email' value=" + profile[0].Email + " readonly />"); %>
                            </div>
                            <div class='col-md-6'>
                                <% Response.Write("<input class='form-control' type='text' name='phone' value=" + profile[0].Email + " readonly /><br />"); %>
                            </div>
                        </div>
                        <div class='row'>
                            <div class='col-md-12'>
                                <% Response.Write("<input class='form-control' type='text' name='address' value=" + profile[0].Address + " readonly />"); %>
                            </div>
                        </div>
                        <% Response.Write("<input class='form-control' type='hidden' name='city' value=" + profile[0].City + " readonly />"); %>
                        <div class='row'>
                            <div class='col-md-4'>
                                <input class='form-control' type='hidden' name='country' value='Sri Lanka' />
                            </div>
                        </div>
                        <br />
                        <input class='btn btn-primary btn-lg m-r-5' type='submit' value='Pay Now' />
                    </div>
                    <% Response.Write("</form>"); %>
                    <br />
                    <div class='row'>
                        <img width='60px' height='auto' src='../res/images/pay/visa.png' class='method-img' alt='visa' />
                        <img width='60px' height='auto' src='../res/images/pay/master.png' class='method-img' alt='master' />
                        <img width='60px' height='auto' src='../res/images/pay/amex.png' class='method-img' alt='visa' />
                        <img width='60px' height='auto' src='../res/images/pay/sampath.png' class='method-img' alt='sampth bank' />
                        <img width='60px' height='auto' src='../res/images/pay/payapp.png' class='method-img' alt='payapp' />
                        <img width='60px' height='auto' src='../res/images/pay/hnb.png' class='method-img' alt='hnb' />
                        <img width='60px' height='auto' src='../res/images/pay/ezcash.png' class='method-img' alt='ezcash' />
                        <img width='60px' height='auto' src='../res/images/pay/mcash.png' class='method-img' alt='mcash' />
                    </div>
                    <br />
                </div>
                <%--end pay bills--%>
            </div>
            <hr />
            <div class="row">
                <%--previous bills--%>
                <div class='col-md-6'>
                    <h5><i class='fa fa-history fa-2x'> Previous Bills</i></h5>
                    <br />
                    <br />
                    <div class='row'>
                        <% Response.Write("<div id='bill_history_" + i + "' style='max-width: 100%; height: 400px; margin: 0 auto'></div>");
                            for (int j = 0; j < bills[i - 1].Count; j++)
                            {
                                month[j] = bills[i - 1][j].Month;
                                value[j] = bills[i - 1][j].Value;

                            }
                        %>
                        <script>
                            Highcharts.chart('bill_history_<% =i %>', { chart: { type: 'column' }, title: { text: '' }, xAxis: { categories: [<% =month[0] %>,<% =month[1] %>,<% =month[2] %>,<% =month[3] %>,<% =month[4] %>,<% =month[5] %>,<% =month[6] %>,<% =month[7] %>,<% =month[8] %>,<% =month[9] %>], crosshair: false }, yAxis: { min: 0, title: { text: 'Bill (Rs.)' } }, plotOptions: { column: { pointPadding: 0.2, borderWidth: 0 } }, series: [{ name: 'Month', data: [<% =value[0] %>,<% =value[1] %>,<% =value[2] %>,<% =value[3] %>,<% =value[4] %>,<% =value[5] %>,<% =value[6] %>,<% =value[7] %>,<% =value[8] %>,<% =value[9] %>] }] });
                        </script>
                    </div>
                </div>
                <%--end previous bills--%>
                <%--payment history--%>
                <div class='col-md-6'>
                    <h5><i class='fa fa-bar-chart-o fa-2x'> Payment History</i></h5>
                    <br />
                    <% Response.Write("<table id='data-table-" + i + "' class='table table-striped table-bordered'>"); %>
                    <thead>
                        <tr>
                            <th>Payment Date</th>
                            <th>Amount (Rs.)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int j = 0; j < payments[i - 1].Count; j++)
                            {
                                Response.Write("<tr>");
                                Response.Write("<td>" + payments[i - 1][j].Date + "</td>");
                                Response.Write("<td style='text-align:right'>" + (payments[i - 1][j].Value).ToString("#,###.00") + "</td>");
                                Response.Write("</tr>");
                            }
                        %>
                    </tbody>
                    <% Response.Write("</table>"); %>
                </div>
                <%--end payment history--%>
            </div>
            <%
                        Response.Write("</div>");
                    }
                }
            %>
        </div>
        <%-- end content --%>
    </div>
    <%--end tab controller--%>
</asp:Content>
