<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Login.aspx.cs" Inherits="online_voting_system.Webforms.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .label_styles{
            font:bold;
            display:inline;
        }
        .input_width{
            max-width:100%;
        }
    </style>
    <div class="shadow-lg p-3 mt-5 mb-5 rounded mb-3 ">
        <div class="alert alert-danger" role="alert" id="error">
            <h2>
                <asp:Label ID="login_error_label" runat="server" Text="" CssClass="form-label"></asp:Label></h2>
        </div>
        <div>
            <h1 class="card-header" style="font:bold; font-style:italic; text-align:center" >
                <asp:Label ID="login_label" runat="server" Text="Login" CssClass="form-label"></asp:Label>
            </h1>
            <div class="card-body">
                <h5 class="label_styles"><asp:Label ID="username_label" runat="server" Text="UserName:" CssClass="form-label card-text"></asp:Label></h5>
                <asp:TextBox ID="username_value" runat="server" CssClass="form-control input_width"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validator_for_username" runat="server" ControlToValidate="username_value" ErrorMessage="Username is required..." ForeColor="#CC3300"></asp:RequiredFieldValidator>
                <br />

                <h5 class="label_styles"><asp:Label ID="password_label" runat="server" Text="Password:" CssClass="form-label card-text"></asp:Label></h5>
                <asp:TextBox ID="password_value" runat="server" CssClass="form-control input_width" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="password_validator" runat="server" ControlToValidate="password_value" ErrorMessage="Password is required..." ForeColor="#CC3300"></asp:RequiredFieldValidator>
                <br />

                <asp:Button ID="login_button" runat="server" CssClass="btn btn-primary" Text="Login" OnClick="login_button_Click" />
                &nbsp
                <asp:Button ID="register_button" runat="server" CssClass="btn btn-secondary" Text="Register" CausesValidation="False" PostBackUrl="~/Webforms/Register.aspx" />
            </div>
        </div>
    </div>
    <script>
        var err = document.getElementById("error");
        var label = document.getElementById("<%= login_error_label.ClientID %>")
        if (label.innerText == "") {
            err.style.display = "none";
        }
        else {
            err.style.display = "";
            setTimeout(function () {
                err.style.display = "none";
            }, 5000);
        }
    </script>
</asp:Content>
