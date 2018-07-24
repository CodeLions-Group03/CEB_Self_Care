<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="CEB.About" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class='row'></div>
    <div class='row'>
        <%-- content --%>
        <div class='row'></div>
        <div class='row'>
            <%-- about us --%>
            <div class='col-md-6'>
                <div class='panel panel-inverse' data-sortable-id='ui-widget-5' data-scrollbar='true'>
                    <div class='panel-heading'>
                        <h4 class='panel-title'>About Us</h4>
                    </div>
                    <div class='panel-body'>
                        <h1 class='page-header'>Ceylon Electricity Board</h1>
                        <hr />
                        <i class='fa fa-eye fa-2x'> Vision “Enrich Life Through Power”</i><br />
                        <hr />
                        <i class='fa fa-exclamation-circle fa-2x'> Mission</i>
                        <p>To develop and maintain an efficient, coordinated and economical system of electricity supply to the whole of Sri Lanka, while adhering to our core values</p>
                        <ul>
                            <li>Quality</li>
                            <li>Service to the nation</li>
                            <li>Efficiency and effectiveness</li>
                            <li>Commitment</li>
                            <li>Safety</li>
                            <li>Professionalism</li>
                            <li>Sustainability</li>
                        </ul>
                        <hr />
                        <h5>Copyright © 2018 Electricity Board - Sri Lanka</h5>
                        <small>Developed by CodeLions @ UOR</small><br />
                        <small>2018 Final Year - Group Project</small><br />
                        <small>(SC/2015/9536 (Leader), SC/2015/9523, SC/2015/9537, SC/2015/9538, SC/2015/9541)</small>
                    </div>
                </div>
            </div>
            <%-- end about us --%>
            <%-- android ad --%>
            <div class='col-md-3'>
                <% new CEB.Classes.MyPanel().CreateAndroidAd(); %>
            </div>
            <%-- end android ad --%>
            <%-- contact numbers --%>
            <div class='col-md-3'>
                <% new CEB.Classes.MyPanel().CreateContactNo(); %>
            </div>
            <%-- end contact numbers --%>
        </div>
        <%-- end content --%>
    </div>
</asp:Content>