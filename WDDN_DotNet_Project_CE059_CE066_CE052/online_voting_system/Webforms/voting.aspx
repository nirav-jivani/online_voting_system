<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="voting.aspx.cs" Inherits="online_voting_system.voting" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
                                <div>
                           <br />
                           <br />
                           <asp:Label ID="Label2" runat="server"></asp:Label>
                           <br />
                           <br />
                           <br />
                           <table class="w-100">
                               <tr>
                                   <td style="height: 68px; width: 151px">Voter id</td>
                                   <td style="width: 429px; height: 68px">
                                       <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="vid" DataValueField="vid">
                                       </asp:DropDownList>
                                   </td>
                                   <td style="height: 68px" colspan="3">
                                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Select candidate:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name" style="margin-left: 54px" >
                                       </asp:DropDownList>
                                   </td>
                               </tr>
                               <tr>
                                   <td style="height: 68px; width: 151px"></td>
                                   <td style="width: 429px; height: 68px">
                                       <asp:Button ID="check" runat="server" Text="check"  Width="122px" CssClass="btn btn-info" OnClick="check_Click1" UseSubmitBehavior="False" AutoPostback="False" />
                                   </td>
                                   <td style="height: 68px" colspan="3">
                                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                       <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" class="btn btn-primary" Text="view candidate  detail" Width="215px" UseSubmitBehavior="False" AutoPostback="False"/>
                                   </td>
                               </tr>
                               <tr>
                                   <td style="width: 151px; height: 84px;">Name</td>
                                   <td style="width: 429px; height: 84px;">
                                       <asp:Label ID="Label1" runat="server"></asp:Label>
                                   </td>
                                   <td style="width: 231px; " rowspan="3">
                                       &nbsp;&nbsp;
                                       <asp:Image ID="Image1" Width="99px" Height="96px" runat="server" style="margin-left: 31px" />
                                   </td>
                                   <td style="width: 304px" rowspan="3">
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
                                   <td rowspan="3"></td>
                               </tr>
                               <tr>
                                   <td style="width: 151px; height: 84px;">&nbsp;</td>
                                   <td style="width: 429px; height: 84px;">
                                       <asp:Image ID="Image2" runat="server" Height="100px" Width="90px" />
                                   </td>
                               </tr>
                               <tr>
                                   <td style="width: 151px; height: 49px">&nbsp;</td>
                                   <td style="width: 429px; height: 49px">
                                       <br />
                                       <asp:Button ID="Button1" runat="server" Text="vote" class="btn btn-primary" OnClick="Button1_Click" Width="160px" style="margin-left: 0px" />
                                       <br />
                                   </td>
                                   <td style="height: 49px">
                                       &nbsp;</td>
                               </tr>
                               </table>
                           <br />
                           <br />
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:electionConnectionString %>" SelectCommand="SELECT [name] FROM [Candidates]"></asp:SqlDataSource>
                           <br />
                           <br />
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:electionConnectionString %>" SelectCommand="SELECT [vid] FROM [Voters] WHERE ([vote] = @vote)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="0" Name="vote" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                           <br />
                           <br />
            </div>
</asp:Content>
