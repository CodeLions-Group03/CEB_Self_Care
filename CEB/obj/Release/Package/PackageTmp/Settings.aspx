<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="CEB.Settings" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class='row'></div>
    <div class='row'>
        <div class='panel panel-inverse' data-sortable-id='ui-widget-5' data-scrollbar='true'>
            <div class='panel-heading'>
                <h4 class='panel-title'>Settings</h4>
            </div>
            <div class='panel-body'>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <asp:Label ID="changePassword" class='form-control' runat="server" Text="Change your password"></asp:Label>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <asp:Label ID="oldPassword" runat="server" Text="Enter Current Password"></asp:Label>
                                </td>
                                <td>
                                    <div class="row">
                                        <div class='col-md-6'>
                                            <asp:TextBox class='form-control' ID="txtCurrentPassword" TextMode="Password" runat="server"></asp:TextBox>
                                        </div>
                                        <div class='col-md-6'></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="newPassword" runat="server" Text="Enter New Password"></asp:Label>
                                </td>
                                <td>
                                    <div class="row">
                                        <div class='col-md-6'>
                                            <asp:TextBox class='form-control' ID="txtNewPassword" TextMode="Password" runat="server"></asp:TextBox>
                                        </div>
                                        <div class='col-md-6'></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="verifyPassword" runat="server" Text="Verify New Password"></asp:Label>
                                </td>
                                <td>
                                    <div class="row">
                                        <div class='col-md-6'>
                                            <asp:TextBox class='form-control' ID="txtVerifyPassword" TextMode="Password" runat="server"></asp:TextBox>
                                        </div>
                                        <div class='col-md-3'>
                                            <asp:Button ID="btnPassword" class='btn btn-primary btn-sm m-r-5' runat="server" Text="Change Password" OnClick="BtnPassword_Click" />
                                        </div>
                                        <div class='col-md-3'>
                                            <asp:Label ID="changePwd" runat="server" Text="Label" Visible="False"></asp:Label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="table">
                        <thead>
                            <asp:Label ID="changeProPic" class='form-control' runat="server" Text="Change your profile picture"></asp:Label>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <asp:Label ID="chooseFile" runat="server" Text="Choose a file"></asp:Label>
                                </td>
                                <td>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <asp:FileUpload ID="FileUpload1" class='input-group' runat="server" />
                                        </div>
                                        <div class="col-md-4">
                                            <asp:Button ID="btnUpload" class='btn btn-primary btn-sm m-r-5' runat="server" Text="Upload" OnClick="BtnUpload_Click" />
                                        </div>
                                        <div class="col-md-4">
                                            <asp:Label ID="uploadLabel" runat="server" Text="Label" Visible="False"></asp:Label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
