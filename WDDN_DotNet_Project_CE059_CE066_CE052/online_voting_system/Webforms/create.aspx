<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="create.aspx.cs" Inherits="online_voting_system.create" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div>
            <br />
            <br />
            <div class="alert alert-success d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
  <div aria-atomic="True">
    <asp:Label ID="Label1" runat="server"></asp:Label>
      </div>
     </div>
            <br />
            <br />
                   <table style="width: 100%; border-collapse: collapse">
                       <tr>
                           <td style="width: 267px; height: 60px">Election Title</td>
                           <td style="height: 60px; width: 326px;">
                   <asp:TextBox ID="eletitle" Type="text"  runat="server" CssClass="col-sm-10"></asp:TextBox>
                           </td>
                           <td style="height: 60px">
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="eletitle" ForeColor="Red">*ElectionTitle field required..</asp:RequiredFieldValidator>
                           </td>
                       </tr>
                       <tr>
                           <td style="width: 267px; height: 60px">select the election date&nbsp;&nbsp;</td>
                           <td style="height: 60px; width: 326px;">
                   <asp:TextBox ID="eledate" Type="date" class="col-sm-3" runat="server" CssClass="col-sm-10"></asp:TextBox>
                           </td>
                           <td style="height: 60px">
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="eledate" ForeColor="Red">*election date field is required..</asp:RequiredFieldValidator>
                           </td>
                       </tr>
                       <tr>
                           <td style="height: 62px; width: 267px">select result date</td>
                           <td style="height: 62px; width: 326px;">
                   <asp:TextBox ID="resdate" Type="date" class="col-sm-3" runat="server" CssClass="col-sm-10"></asp:TextBox>
                           </td>
                           <td style="height: 62px">
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="resdate" ForeColor="Red">*Result date field required..</asp:RequiredFieldValidator>
                           </td>
                       </tr>
            </table>
            <br />
                   <br />
                   <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="create" Width="102px" OnClick="Button1_Click" />
            <br />
            <br />
            <br />
            <br />
        </div>
</asp:Content>