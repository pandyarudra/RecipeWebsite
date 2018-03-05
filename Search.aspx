<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder2" ID="Content2" runat="server">
    <link rel="stylesheet" href="StyleSheet.css" />
    <link rel="stylesheet" href="css/contact.css" />
    <link rel="stylesheet" href="css/recipes.css" />
    <div class="container">
        <div class="container-contact">
            <table>
                <tr>
                    <td>
                        <asp:label id="Label1" runat="server" text="Search By Recipe Keyword"></asp:label>

                    </td>
                    <td>

                        <asp:dropdownlist id="ddRecipeName" runat="server">
              <asp:ListItem Value="0">All</asp:ListItem>
              </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:label id="Label2" runat="server" text="Search By Recipe Submitted Person"></asp:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="ddRecipeCreator" runat="server">
                <asp:ListItem Value="0">All</asp:ListItem>
                </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:label id="Label3" runat="server" text="Search By Ingrdient"></asp:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="ddInc" runat="server">
                <asp:ListItem Value="0">All</asp:ListItem>
                </asp:dropdownlist>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:button text="Search Recipes" runat="server" id="BtnSearch" onclick="BtnSearch_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <span>Search Results: </span><span runat="server" id="searchedItemsCount"></span>
        </div>
        <div runat="server" id="searchedItems">
        </div>


    </div>
</asp:Content>
