<%@ Page Title="Recipes" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="SignIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder2" ID="Content2" runat="server">
     <link rel="stylesheet" href="StyleSheet.css" />
    <link rel="stylesheet" href="css/contact.css" />
    <div id="recipesMain">
       
        <table id="signIn">
            <asp:Label ID="lblCheckBelow" runat="server" Text=""></asp:Label>
            <tr>
                
                <td><b>User Name:</b></td>
                <td><asp:TextBox ID="txtUser" runat="server" CssClass="m-l-md width-auto "></asp:TextBox>
               </td>
                
            </tr>
             <tr>
                
                <td><b>Password:</b></td>
                <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="m-l-md width-auto "></asp:TextBox>
               </td>
                
            </tr>
            <tr>
                <td> <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="m-l-md" OnClick="btnLogin_Click" /></td>
            </tr>
            <tr>
                <td><asp:Literal ID="litStatus" runat="server"></asp:Literal></td>
            </tr>
        </table>

    </div>
    
    
   

</asp:Content>