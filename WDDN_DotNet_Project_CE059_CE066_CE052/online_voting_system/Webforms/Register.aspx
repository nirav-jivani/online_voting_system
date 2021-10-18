<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Register.aspx.cs" Inherits="online_voting_system.Webforms.Register" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .float_right {
            float: right;
            margin-bottom: 4px;
            margin-right: 10px;
        }
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
                <asp:Label ID="register_error_label" runat="server" CssClass="form-label"></asp:Label></h2>
        </div>

        <div>
            <h1 class="card-header" style="font:bold; font-style:italic; text-align:center">
                <asp:Label ID="register_label" runat="server" Text="Register" CssClass="form-label"></asp:Label>
            </h1>
            <h5 class="label_styles"><asp:Label ID="username_label" runat="server" Text="UserName:" CssClass="form-label"></asp:Label></h5>
            <asp:TextBox ID="username_value" runat="server" CssClass="form-control input_width"></asp:TextBox>
            <asp:RequiredFieldValidator ID="validator_for_username" runat="server" ControlToValidate="username_value" ErrorMessage="Username is required..." ForeColor="#CC3300"></asp:RequiredFieldValidator>
            <br />

            <h5 class="label_styles"><asp:Label ID="email_label" runat="server" Text="Email:" CssClass="form-label"></asp:Label></h5>
            <asp:TextBox ID="email_value" runat="server" CssClass="form-control input_width" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="validator_for_email" runat="server" ControlToValidate="email_value" ErrorMessage="Email is required..." ForeColor="#CC3300"></asp:RequiredFieldValidator>
            <br />

            <h5 class="label_styles"><asp:Label ID="password_label" runat="server" Text="Password:" CssClass="form-label"></asp:Label></h5>
            <asp:TextBox ID="password_value" runat="server" CssClass="form-control input_width" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="password_validator" runat="server" ControlToValidate="password_value" ErrorMessage="Password is required..." ForeColor="#CC3300"></asp:RequiredFieldValidator>
            <br />

            <h5 class="label_styles"><asp:Label ID="mob_no_label" runat="server" Text="Mobile No:" CssClass="form-label"></asp:Label></h5>
            <asp:TextBox ID="mobile_no_value" runat="server" CssClass="form-control input_width" MaxLength="10" TextMode="Number"></asp:TextBox>
            <asp:RequiredFieldValidator ID="validator_for_mobile_no" runat="server" ControlToValidate="mobile_no_value" ErrorMessage="Mobile No is required..." ForeColor="#CC3300"></asp:RequiredFieldValidator>
            <br />

            <asp:Button ID="register_button" runat="server" CssClass="btn btn-primary" Text="Register" OnClick="register_button_Click" />

            <asp:LinkButton ID="login_link" runat="server" BorderStyle="Solid" BorderWidth="1px" PostBackUrl="~/Webforms/Login.aspx" CssClass="float_right" CausesValidation="False">Login</asp:LinkButton>

        </div>
    </div>
    <script>
        var err = document.getElementById("error");
        var label = document.getElementById("<%= register_error_label.ClientID %>")
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
