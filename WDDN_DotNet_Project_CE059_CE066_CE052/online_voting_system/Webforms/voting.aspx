<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="voting.aspx.cs" Inherits="online_voting_system.voting" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
                                <div>
                           <br />
                           <br />
                           <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                           <br />
                           <br />
                           <br />
                           <table class="w-100">
                               <tr>
                                   <td style="height: 68px; width: 151px">Voter id</td>
                                   <td style="width: 354px; height: 68px">
                                       <asp:TextBox ID="TextBox1" runat="server" Width="292px"></asp:TextBox>
                                   </td>
                                   <td style="width: 416px; height: 68px">
                                       <asp:Button ID="check" runat="server" Text="check"  Width="122px" CssClass="btn btn-info" OnClick="check_Click1"  />
                                   </td>
                                   <td style="height: 68px">&nbsp;</td>
                               </tr>
                               <tr>
                                   <td style="width: 151px; height: 84px;">Name</td>
                                   <td style="width: 354px; height: 84px;">
                                       <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                   <td style="width: 151px; height: 155px">Select candidate</td>
                                   <td style="width: 354px; height: 155px">
                                       <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name" >
                                       </asp:DropDownList>
                                   </td>
                                   <td style="width: 416px; height: 155px">
                                       <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" class="btn btn-primary" Text="view candidate  detail" Width="215px" />
                                   </td>
                                   <td style="height: 155px">
                                       <asp:Image ID="Image1" Width="99px" Height="96px" runat="server" />
                                       <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                                           <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                           <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                           <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                           <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                           <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                           <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                           <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                           <SortedDescendingHeaderStyle BackColor="#242121" />
                                       </asp:GridView>
                                   </td>
                               </tr>
                               <tr>
                                   <td colspan="2">
                                       <asp:Button ID="Button1" runat="server" Text="vote" class="btn btn-primary" OnClick="Button1_Click" Width="160px" />
                                   </td>
                               </tr>
                           </table>
                           <br />
                           <br />
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:electionConnectionString %>" SelectCommand="SELECT [name] FROM [Candidates]"></asp:SqlDataSource>
                           <br />
                           <br />
                           <br />
                           <br />
            </div>
</asp:Content>
