<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inbox.aspx.cs" Inherits="CEB.Inbox" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class='row'></div>
    <div class='row'>
        <div class='panel panel-inverse' data-sortable-id='ui-widget-5' data-scrollbar='true'>
            <div class='panel-heading'>
                <h4 class='panel-title'>Messages</h4>
            </div>
            <div class='panel-body'>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceInbox" CellPadding="4" ForeColor="#333333" GridLines="None" CellSpacing="1" EmptyDataText="No Messages !">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="sentDateTime" HeaderText="sentDateTime" SortExpression="sentDateTime" />
                        <asp:BoundField DataField="messageContent" HeaderText="messageContent" SortExpression="messageContent" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" ForeColor="Black" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceInbox" runat="server" ConnectionString="<%$ ConnectionStrings:CEBConnectionString %>" SelectCommand="SELECT [sentDateTime], [messageContent] FROM [Messages] ORDER BY [sentDateTime] DESC"></asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
