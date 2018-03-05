<%@ Page Title="SignUp" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder2" ID="Content2" runat="server">
    <link rel="stylesheet" href="StyleSheet.css" />
    <link rel="stylesheet" href="css/contact.css" />
    <div id="recipesMain">

        <table id="signIn">
            <tr>
                <td>
                    <label class="m-l-md">User Registration Page</label><br />
                </td>
            </tr>
            <tr>
                <td>
                    <label class="m-l-md">User Name:</label></td>
                <td>
                    <asp:TextBox ID="txtUser" runat="server" CssClass="m-l-md width-auto "></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <label class="m-l-md">Password:</label></td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="m-l-md width-auto "></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <label class="m-l-md">Confirm Password:</label></td>
                <td>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="m-l-md width-auto "></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="m-l-md" OnClick="btnRegister_Click" /></td>
            </tr>
            <tr>
                <td>
                    <asp:Literal ID="litStatus" runat="server"></asp:Literal></td>

            </tr>
        </table>


    </div>




</asp:Content>
