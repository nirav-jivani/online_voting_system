<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="voter.aspx.cs" Inherits="online_voting_system.voter" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
               <div>
            <br />
            <br />
            </div>
        <div  class="row mb-3">
            <table class="w-100">
                <tr>
                    <td style="width: 230px">
            <label>voter id</label></td>
                    <td style="width: 283px"><asp:TextBox ID="vid" runat="server" CssClass="col-sm-10" ></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="vid" ForeColor="Red">* this filed is required.</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 230px; height: 69px">
                        <asp:Label ID="Label1" runat="server" Text="name(as per voterid) "></asp:Label>
                    </td>
                    <td style="height: 69px; width: 283px;">
            <asp:TextBox ID="vname"  runat="server" CssClass="col-sm-10"></asp:TextBox>
                    </td>
                    <td style="height: 69px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="vname" ForeColor="Red">* this filed is required.</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 230px; height: 36px;">
                        <asp:Label ID="Label2" runat="server" Text="age "></asp:Label>
                    </td>
                    <td style="height: 36px; width: 283px">
            <asp:TextBox ID="vage"  runat="server" CssClass="col-sm-10"></asp:TextBox>
                    </td>
                    <td style="height: 36px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="vage" ForeColor="Red">* this filed is required.</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 230px; height: 68px">
                        <asp:Label ID="Label3" runat="server" Text="Mobile Number"></asp:Label>
                    </td>
                    <td style="height: 68px; width: 283px;"><asp:TextBox  ID="vnum" runat="server" CssClass="col-sm-10"></asp:TextBox>
                    </td>
                    <td style="height: 68px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="vnum" ForeColor="Red">* this filed is required.</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 230px">
                        <asp:Label ID="Label4" runat="server" Text="Sign"></asp:Label>
                    </td>
                    <td style="width: 283px">
            <asp:FileUpload ID="FileUpload1"  runat="server" CssClass="col-sm-10" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="FileUpload1" ForeColor="Red">* this filed is required.</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 230px; height: 67px">
                        <asp:Label ID="Label5" runat="server" Text="Photo"></asp:Label>
                    </td>
                    <td style="height: 67px; width: 283px;">
            <asp:FileUpload ID="FileUpload2"  runat="server" CssClass="col-sm-10" />
                    </td>
                    <td style="height: 67px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="FileUpload2" ForeColor="Red">* this filed is required.</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <br />
                        <br />
            <asp:Button ID="Button1" runat="server" Text="submit" OnClick="Button1_Click" Width="184px" CssClass="btn btn-primary" />
                        <br />
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
        </div>
    </asp:Content>