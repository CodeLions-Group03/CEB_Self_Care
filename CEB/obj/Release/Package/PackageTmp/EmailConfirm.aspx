<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmailConfirm.aspx.cs" Inherits="CEB.EmailConfirm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>CEB Email Confirmation</title>
<!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500" />
    <link rel="stylesheet" href="../res_login/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../res_login/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../res_login/css/form-elements.css" />
    <link rel="stylesheet" href="../res_login/css/style.css" />

    <style>
        body {
            background-image: url('../res_login/img/ImageBackground.png');
            background-position: right center;
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
        }
    </style>

    <!-- Title Icon -->
    <link rel="shortcut icon" href="../res_login/ico/Title_icon.png" />
</head>

<body>
    <form role="form" runat="server">
        <div class="top-content">
            <div class="container">

                <div class="row show-login-form.active">
                    <div class="col-sm-4 col-md-offset-4" style="border-radius: 5px; background-color: rgba(0,0,0,0.2); padding: 20px;">
                        <div>
                            <span>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/res_login/ico/Title_icon.png" Height="50px" />
                                <asp:Label ID="TitleLbl" runat="server" Text="Email Confirmation" Font-Names="Times New Roman" Font-Size="20px"></asp:Label>
                            </span>
                        </div>
                        <div class="l-form">
                            <div class="form-group">
                                <asp:Label ID="CheckEmailConfirm" runat="server" ForeColor="Red"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="../res_login/js/jquery-1.11.1.min.js"></script>
    <script src="../res_login/bootstrap/js/bootstrap.min.js"></script>
    <script src="../res_login/js/jquery.backstretch.min.js"></script>
</body>

</html>
