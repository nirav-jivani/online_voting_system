<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="candidate.aspx.cs" Inherits="online_voting_system.candidate" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div>
                   <div>
                       <br />
                       <br />
                       <table class="w-100" style="border-collapse: collapse; margin-bottom: 25px">
                           <tr>
                               <td style="height: 67px; width: 289px">Candidate name </td>
                               <td style="height: 67px; width: 450px;">
            <asp:TextBox ID="cname" runat="server" CssClass="col-sm-10"></asp:TextBox>
                               </td>
                               <td style="height: 67px">
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="cname" ForeColor="Red"> * Name filed is required..</asp:RequiredFieldValidator>
                               </td>
                           </tr>
                           <tr>
                               <td style="height: 67px; width: 289px">candidate age</td>
                               <td style="height: 67px; width: 450px;"><asp:TextBox ID="cage1" runat="server" class="col-sm-5" CssClass="col-sm-10"></asp:TextBox>
                               </td>
                               <td style="height: 67px">
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="cage1" ForeColor="Red"> * Age filed is required..</asp:RequiredFieldValidator>
                               </td>
                           </tr>
                           <tr>
                               <td style="width: 289px; height: 57px">candidate sign </td>
                               <td style="height: 57px; width: 450px;">
                   <asp:FileUpload ID="FileUpload1" runat="server" class="col-sm-5" CssClass="col-sm-10" />
                               </td>
                               <td style="height: 57px">
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="FileUpload1" ForeColor="Red"> * Sign file is required..</asp:RequiredFieldValidator>
                               </td>
                           </tr>
                           <tr>
                               <td style="width: 289px; height: 84px">candidate photo</td>
                               <td style="height: 84px; width: 450px;">
                   <asp:FileUpload ID="FileUpload2" runat="server"  class="col-sm-5" CssClass="col-sm-10"/>
                               </td>
                               <td style="height: 84px">
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="FileUpload2" ForeColor="Red"> * Photo file is required...</asp:RequiredFieldValidator>
                               </td>
                           </tr>
                           <tr>
                               <td colspan="3">
            <asp:Button ID="Button1" runat="server" Text="submit" class="btn btn-primary" OnClick="Button1_Click" />
                               </td>
                           </tr>
                       </table>
                       <br />
            <br />
                       </div>
            <br />
            <br />
                   <br />
                   <br />
                   <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="#009900"></asp:Label>
        </div>
    </asp:Content>