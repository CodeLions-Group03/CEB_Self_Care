<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CEB.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>CEB Sign In</title>

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

                <%-- Request session link display label--%>
                <asp:Label ID="Links" runat="server" Text="" ForeColor="Lime" Font-Italic="True" Font-Size="20px" Font-Bold="True"></asp:Label><br /><br />
                <%-- End Request session link display label --%>

                <%-- Register Form --%>
                <div class="row show-register-form.active">
                    <div class="col-sm-4 col-md-offset-4" style="border-radius: 10px; background-color: rgba(0,0,0,0.2); padding: 20px;">
                        <div>
                            <span>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/res_login/ico/Title_icon.png" Height="50px" />
                                <asp:Label ID="TitleLbl" runat="server" Text="Register" Font-Names="Times New Roman" Font-Size="20px"></asp:Label>
                            </span>
                            <br />
                        </div>
                        <div class="r-form">
                            <div class="form-group">
                                <asp:DropDownList ID="title_dropdown" runat="server" CssClass="form-control">
                                    <asp:ListItem>Mr.</asp:ListItem>
                                    <asp:ListItem>Rev.</asp:ListItem>
                                    <asp:ListItem>Mrs.</asp:ListItem>
                                    <asp:ListItem>Ms.</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="r_form_first_name" placeholder="~ First Name ~" class="r-form-frist-name form-control" runat="server" BorderWidth="1"></asp:TextBox><br />
                                <asp:TextBox ID="r_form_last_name" placeholder="~ Last Name ~" class="r-form-last-name form-control" runat="server" BorderWidth="1"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="r_form_NIC_number" placeholder="~ NIC Number ~" class="r-form-NIC-number form-control" runat="server" BorderWidth="1"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="r_form_address" placeholder="~ Address ~" class="r-form-Address form-control" runat="server" TextMode="MultiLine" BorderWidth="1"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="r_form_city" placeholder="~ City ~" class="r-form-city form-control" runat="server" BorderWidth="1"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="r_form_contact_number" placeholder="~ Contact Number ~" class="r-form-contact-number form-control" runat="server" MaxLength="10" TextMode="Phone" BorderWidth="1" ToolTip="Enter your Phone Number" Rows="1"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="r_form_email" placeholder="~ E-mail ~" class="r-form-email form-control" runat="server" TextMode="Email" BorderWidth="1"></asp:TextBox>
                                <asp:Label ID="EmailCheck" runat="server" ForeColor="Red" Visible="False" Font-Bold="True"></asp:Label>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="r_form_password" placeholder="~ Password ~" class="r-form-password form-control" runat="server" TextMode="Password" BorderWidth="1"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="r_form_confirm_password" placeholder="~ Confirm Password ~" class="r-form-confirm-password form-control" runat="server" TextMode="Password" BorderWidth="1"></asp:TextBox><br />
                                <asp:Label ID="pwd_lable" runat="server" Text="*Password doesn't match" Visible="False" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="submit" CssClass="btn btn-success" runat="server" Text="Sign Up" OnClick="Submit_Click" />
                            </div>
                        </div>
                        <%-- login button --%>
                        <div>
                            <asp:Button ID="LoginBtn" runat="server" Text="Login" CssClass="btn btn-primary btn-block" OnClick="LoginBtn_Click" />
                        </div>
                        <%-- end login button --%>
                    </div>
                </div>
                <%-- End Register Form --%>
            </div>
        </div>

        <script src="../res_login/js/jquery-1.11.1.min.js"></script>
        <script src="../res_login/bootstrap/js/bootstrap.min.js"></script>
        <script src="../res_login/js/jquery.backstretch.min.js"></script>
    </form>

</body>

</html>
