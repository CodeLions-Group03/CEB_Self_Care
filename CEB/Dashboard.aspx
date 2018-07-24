<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CEB.Dashboard" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class='row'></div>
    <div class='row'>
        <!-- Connection details -->
        <div class='col-md-8'>
            <div class="row"></div>
            <!-- tab controller -->
            <div class='panel panel-inverse panel-with-tabs' data-sortable-id='ui-unlimited-tabs-1'>
                <!-- create dynamic account tabs -->
                <div class='panel-heading p-0'>
                    <!-- begin nav tabs -->
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
                                        Response.Write("<li><a href='#nav-tab-" + i + "' data-toggle='tab'>Account " + i + "</a></li>");
                                    }
                                }
                            %>
                            <li class='next-button'><a class='text-success' href='javascript:;' data-click='next-tab'><i class='fa fa-arrow-right'></i></a></li>
                        </ul>
                    </div>
                    <!-- end begin nav tabs -->
                </div>
                <!-- end create dynamic account tabs -->

                <!-- content -->
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
                                Response.Write("<h5><i class='fa fa-info-circle fa-2x'> Account No : " + accounts[i - 1].AccountNo + " (Connection Details)</i></h5><hr />");
                    %>
                    <!-- connection details -->
                    <div class='row'>
                        <!-- realtime usage -->
                        <div class="col-md-6">
                            <div id='live_<%=i %>' style='max-width: 100%; height: 300px; margin: 0 auto'></div>
                            <script>
                                Highcharts.setOptions({ global: { useUTC: false } }); Highcharts.chart('live_<% =i %>', { chart: { type: 'spline', animation: Highcharts.svg, marginRight: 10, events: { load: function () { var series = this.series[0]; setInterval(function () { var x = (new Date()).getTime(), y = <% =accounts[i-1].CurrentReading %>; series.addPoint([x, y], true, true); }, 1000); } } }, title: { text: 'Realtime Usage' }, xAxis: { type: 'datetime', tickPixelInterval: 150 }, yAxis: { title: { text: 'Usage (kWh)' }, plotLines: [{ value: 0, width: 1, color: '#808080' }] }, tooltip: { formatter: function () { return '<b>' + this.series.name + '</b><br />' + Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br />' + Highcharts.numberFormat(this.y, 2); } }, legend: { enabled: false }, exporting: { enabled: false }, series: [{ name: 'Live Usage', data: (function () { var data = [], time = (new Date()).getTime(), i; for (i = -59; i <= 0; i += 1) { data.push({ x: time + i * 1000, y: 0 }); } return data; }()) }] });
                            </script>
                        </div>
                        <!-- end realtime usage -->
                        <!-- voltge -->
                        <div class="col-md-6">
                            <div id="voltage_<% =i %>" style="min-width: 310px; max-width: 400px; height: 300px; margin: 0 auto"></div>
                            <script>
                                Highcharts.chart('voltage_<% =i %>', { chart: { type: 'gauge', plotBackgroundColor: null, plotBackgroundImage: null, plotBorderWidth: 0, plotShadow: false }, title: { text: 'Voltage' }, pane: { startAngle: -150, endAngle: 150, background: [{ backgroundColor: { linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 }, stops: [[0, '#FFF'], [1, '#333']] }, borderWidth: 0, outerRadius: '109%' }, { backgroundColor: { linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 }, stops: [[0, '#333'], [1, '#FFF']] }, borderWidth: 1, outerRadius: '107%' }, {}, { backgroundColor: '#DDD', borderWidth: 0, outerRadius: '105%', innerRadius: '103%' }] }, yAxis: { min: 0, max: 440, minorTickInterval: 'auto', minorTickWidth: 1, minorTickLength: 10, minorTickPosition: 'inside', minorTickColor: '#666', tickPixelInterval: 30, tickWidth: 2, tickPosition: 'inside', tickLength: 10, tickColor: '#666', labels: { step: 2, rotation: 'auto' }, title: { text: 'Voltage' }, plotBands: [{ from: 0, to: 220, color: '#DDDF0D' }, { from: 220, to: 240, color: '#55BF3B' }, { from: 240, to: 440, color: '#DF5353' }] }, series: [{ name: 'Voltage_<% =i %>', data: [80], tooltip: { valueSuffix: ' V' } }] }, function (chart) { if (!chart.renderer.forExport) { setInterval(function () { var point = chart.series[0].points[0], newVal, inc = Math.round((Math.random() - 0.5) * 220); newVal = point.y + inc; if (newVal < 0 || newVal > 440) { newVal = point.y - inc; } point.update(newVal); }, 2000); } });
                            </script>
                        </div>
                        <!-- end voltage & current -->
                    </div>
                    <!-- end connection details -->
                    <%
                                Response.Write("</div>");
                            }
                        }
                    %>
                </div>
                <!-- end content -->
            </div>
            <!-- end tab controller -->
        </div>
        <!-- end Connection details -->
        <!-- add new accounts -->
        <div class='col-md-4'>
            <div class='panel panel-inverse' data-sortable-id='ui-widget-5'>
                <div class='panel-heading'>
                    <h4 class='panel-title'>Add Your New Meters</h4>
                </div>
                <div class='panel-body'>
                    <div class='form-group'>
                        <div class="row">
                            <div class='col-md-6'>
                                <label class='control-label'>Account Type</label>
                                <select class='form-control'>
                                    <option>Normal</option>
                                    <option>Religious</option>
                                    <option>General</option>
                                    <option>Industrial</option>
                                    <option>Hotel</option>
                                </select>
                            </div>
                            <div class='col-md-6'>
                                <label class='control-label'>Account No</label>
                                <input type='number' class='form-control' />
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <div class="row">
                            <div class='col-md-6'>
                                <label class='control-label'>NIC No</label>
                                <input type='text' class='form-control' />
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <div class="row">
                            <div class='col-md-3'>
                                <label class='control-label' style='text-align: left'>Meter Address</label>
                            </div>
                            <div class='col-md-9'>
                                <textarea class='form-control' rows='5'></textarea>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <div class="row">
                            <div class='col-md-6'>
                                <input class='btn btn-primary btn-lg m-r-5' type='submit' value='Submit Request' />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end add new accounts -->
    </div>

    <!-- signalr script to update data -->
    <script type="text/javascript">
        $(function () {
            var hubConnection = $.connection.DashboardHub; // setup a proxy to hub
            $.connection.hub.url = 'http://cebwebapi.azurewebsites.net/signalr'; // signalr server path

            // client calls "UpdateData()" method that place in server
            hubConnection.client.UpdateData = function () {

            };

            // start the connection
            $.connection.hub.start().done(function () {

            });
        });
    </script>
</asp:Content>
