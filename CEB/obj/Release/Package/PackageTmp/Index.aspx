<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CEB.WebForm1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Welcome to CEB</title>

    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Island Dreams... Best Tourism Services">
    <meta name="keywords" content="beautiful places, island dreams, hotels, vehicle, rent, sri lanka, tourist, guide" />

    <!-- CSS -->
    <link rel="stylesheet" href="../res_login/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../res_login/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../res_login/css/form-elements.css" />
    <link rel="stylesheet" href="../res/css/WelcomeCSS.css" />

    <!-- Title Icon -->
    <link rel="shortcut icon" href="../res_login/ico/Title_icon.png" />
</head>
<body>
    <%--Mouse point Animation--%>
    <canvas id="web-canvas" style="z-index: 2; position: absolute; left: 0px; top: 0px"></canvas>
    <%--End Mouse point Animation--%>
    <form role="form" runat="server">
        <div class="row">
            <%--Fixed header (welcome to CEB Self Care Center)--%>
            <div class="col-sm-12">
                <asp:Image ID="Image5" runat="server" ImageUrl="~/res/images/welcome/SiteHeader.png" Width="100%" Style="position: fixed; z-index: 10;" />
            </div>
            <%--End Fixed header (welcome to CEB Self Care Center)--%>
        </div>
        <div class="row" style="padding-top: 10%">
            <div class="col-md-1"></div>
            <div class="col-md-10" style="background-color: rgba(128, 128, 128,0.2)">
                <div class="row">
                    <%--Image animation to NewsFeed--%>
                    <div class="NewsFeed" style="margin: 20px; display:inline">
                        <asp:Image class="bottom" src="res/images/welcome/bg1.jpg" runat="server" />
                        <asp:Image class="top" src="res/images/welcome/bg2.jpg" runat="server" />
                    </div>
                    <%--Image animation to NewsFeed--%>

                    <%--Space set image to Animation--%>
                    <div style="padding:10px ; position:center;" >
                        <asp:Image src="res/images/welcome/spaceReserve.jpg" runat="server" Style=" width: 100%;" />
                    </div>
                    <%--End Space set image to Animation--%>
                </div>
                <div class="row" align="center">
                    <div class="col-sm-12" style="z-index: 3">
                        <asp:Button ID="LoginBtn" runat="server" Text="Login" CssClass="myButton" OnClick="LoginBtn_Click" Style="margin: 20px;" /> <%--Login button--%>
                        <asp:Button ID="RegisterBtn" runat="server" Text="Register" CssClass="myButton" OnClick="RegisterBtn_Click" Style="margin: 20px;" /> <%--Register button--%>
                    </div>
                </div>
                <%--Funtions of Dashboard--%>
                <div class="row" style="padding: 20px">
                    <div class="col-sm-3">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/res/images/welcome/02.jpg" Width="100%" />
                        <h3>Check This Month Usage</h3>
                        <p>Realtime usage updating in (kWh)</p>
                    </div>
                    <div class="col-sm-3">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/res/images/welcome/01.jpg" Width="100%" />
                        <h3>Online Bill Payment</h3>
                        <p>You can pay bills using Credit Cards, Debit Cards, eZ Cash... </p>
                    </div>
                    <div class="col-sm-3">
                        <asp:Image ID="Image3" runat="server" ImageUrl="~/res/images/welcome/04.jpg" Width="100%" />
                        <h3>Realtime Voltage Meter</h3>
                        <p>Displaying voltage differences...</p>
                    </div>
                    <div class="col-sm-3">
                        <asp:Image ID="Image4" runat="server" ImageUrl="~/res/images/welcome/03.jpg" Width="100%" />
                        <h3>Check Usage History</h3>
                        <p>Check usage differences of last months by using graphs.</p>
                    </div>
                </div>
                <%--End Funtions of Dashboard--%>
                <div class="row" style="background-color: white; padding: 20px">
                    <div class="col-sm-6" align="center" style="z-index: 3">
                        <div style="margin-top: 15%; text-shadow: 0px 0px 3px #2f6627;">
                            <h4>Get the CEB Self Care Mobile App On Here</h4> <%--App download title--%>
                            <br />
                            <asp:Button ID="AppBtn" runat="server"  Text="Download App" CssClass="myButton" style="margin:10px" /> <%--App download button--%>
                        </div>

                    </div>
                    <div class="col-sm-6" align="center">
                        <asp:Image ID="Image6" runat="server" ImageUrl="~/res/images/welcome/Android.png" Width="100%" /> <%--Icon of the App download--%>
                    </div>
                </div>
                <br />
                <br />
            </div>
        </div>
        <br />
        <br />
        <%--Details about page--%>
        <div class="row" style="background-color: rgba(0, 0, 0,0.3); padding: 50px">
            <div class="col-md-3">
                <h5>Store & Support</h5>
                <p>MySQL</p>
                <p>MsSQL</p>
                <p>Department of Computer Science</p>
            </div>
            <div class="col-md-3">
                <h5>Education</h5>
                <p>University Of Ruhuna</p>
                <p>Group 03</p>
            </div>
            <div class="col-md-3">
                <h5>Enterprise</h5>
                <p>Microsoft Azure</p>
            </div>
            <div class="col-md-3">
                <h5>Developer</h5>
                <p>Microsoft Visual Studio 2017</p>
            </div>
        </div>
        <%--End Details about page--%>
    </form>

    <script src="../res/js/EasePack.min.js"></script>
    <script src="../res/js/rAF.js"></script>
    <script src="../res/js/TweenLite.min.js"></script>
    <script src="../res/js/WelcomeAnimation.js"></script>
</body>
</html>
