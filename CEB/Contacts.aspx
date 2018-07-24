<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="CEB.Contacts" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class='row'></div>
    <div class='row'>
        <%-- content --%>
        <div class='row'></div>
        <div class='row'>
            <%-- complains --%>
            <div class='col-md-6'>
                <div class='panel panel-inverse' data-sortable-id='ui-widget-5' data-scrollbar='true'>
                    <div class='panel-heading'>
                        <h4 class='panel-title'>Complains</h4>
                    </div>
                    <div class='panel-body'>
                        <asp:Panel ID='p1' runat="server" Visible="false">
                            <h4>Sorry ! You don't have any accounts yet...</h4>
                        </asp:Panel>
                        <asp:Panel ID='p2' runat="server" Visible="false">
                            <p style='color: red'>Note :- This feature must use only for report the problems according to your own bill accounts and other forms will be ignored.</p>
                            <p style='color: grey'>(If you have problems separate from this feature, please use our contact numbers)</p>
                            <div class='form-group'>
                                <div class="row">
                                    <div class='col-md-12'>
                                        <label class='control-label'>Account No</label>
                                        <input type='number' class='form-control' />
                                    </div>
                                </div>
                            </div>
                            <div class='form-group'>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class='control-label' style='text-align: left'>Content <small>(enter details about your problem)</small></label>
                                        <textarea class='form-control' rows='8'></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class='form-group'>
                                <a class='btn btn-primary btn-lg m-r-5' href='javascript:;'>Submit</a>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
            <%-- end complains --%>
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
