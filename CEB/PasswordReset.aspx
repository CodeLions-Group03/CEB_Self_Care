<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PasswordReset.aspx.cs" Inherits="CEB.PasswordReset" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>CEB Password Reset</title>

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
                                <asp:Label ID="TitleLbl" runat="server" Text="Recover Password" Font-Names="Times New Roman" Font-Size="20px"></asp:Label>
                            </span>
                        </div>
                        <div class="l-form">
                            <div class="form-group">
                                <asp:Label ID="check_pwd" runat="server" ForeColor="Red"></asp:Label>
                                <asp:TextBox ID="reset_pwd" runat="server" placeholder="~ Password ~" class="l-form-password form-control" TextMode="Password" BorderWidth="1"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="reset_confirm_pwd" runat="server" placeholder="~ Confirm Password ~" class="l-form-confirm-password form-control" TextMode="Password" BorderWidth="1"></asp:TextBox>
                            </div>
                            <asp:Button ID="pwd_rest_btn" runat="server" Text="Reset" CssClass="btn btn-success" OnClick="PasswordResetBtn_Click" />
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
