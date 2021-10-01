<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="calculate.aspx.cs" Inherits="online_voting_system.calculate" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
                       <div>
            <br />
                           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:electionConnectionString %>" SelectCommand="SELECT [name], [vote] FROM [Candidates]"></asp:SqlDataSource>
                           <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:electionConnectionString %>" SelectCommand="SELECT name, vote, age FROM Candidates WHERE (vote IN (SELECT MAX(vote) AS Expr1 FROM Candidates AS Candidates_1))"></asp:SqlDataSource>
                           <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Height="76px" Width="396px">
                               <Columns>
                                   <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                   <asp:BoundField DataField="vote" HeaderText="vote" SortExpression="vote" />
                               </Columns>
                               <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                               <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                               <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                               <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                               <SortedAscendingCellStyle BackColor="#F7F7F7" />
                               <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                               <SortedDescendingCellStyle BackColor="#E5E5E5" />
                               <SortedDescendingHeaderStyle BackColor="#242121" />
                           </asp:GridView>
                           <br />
                           <asp:Label ID="Label1" runat="server"></asp:Label>
                           <br />
                           <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" DataSourceID="SqlDataSource2" >
                               <Columns>
                                   <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                   <asp:BoundField DataField="vote" HeaderText="vote" SortExpression="vote" />
                                   <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
                               </Columns>
                               <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                               <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                               <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                               <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                               <SortedAscendingCellStyle BackColor="#F7F7F7" />
                               <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                               <SortedDescendingCellStyle BackColor="#E5E5E5" />
                               <SortedDescendingHeaderStyle BackColor="#242121" />
                           </asp:GridView>
                           <br />
                           <br />
                           <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Declare" CssClass="btn btn-primary " />
                           <br />
            <br />
            </div>
        <div>
        </div>
    </asp:Content>