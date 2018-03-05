<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="RecipeDetails.aspx.cs" Inherits="RecipeDetails" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder2" ID="Content3" runat="server">
    <p>
    </p>
    <div class="container">
        <div class="container-contact">
            <div runat="server" id="singleRecipe">
               
                <p class="item">
                    <span><b>Recipe Name:</b></span>
                    <span runat="server" id="recipeName"></span>
                </p>
                <p class="item">
                    <span><b>submitted By:</b></span>
                    <span runat="server" id="submitted_by"></span>
                </p>
                <p class="item">
                    <span><b>Recipe cooking time:</b></span>
                    <span runat="server" id="cookingt"></span>
                </p>
                <p class="item">
                    <span><b>Recipe servings:</b></span>
                    <span runat="server" id="servings"></span>
                </p>
                <p class="item">
                    <span><b>Ingredient Name:</b></span>
                    <p runat="server" id="Ingredient"></p>
                </p>
                <p class="item">
                    <span><b>Directions :</b></span>
                    <span runat="server" id="direction"></span>
                </p>
            </div>
            <div runat="server" id="multiRecipe">
                 <p>
                    <br />
                            <%if (MemberUserName == submitted_by.InnerText)
                        { //Show Add Recipe link only if member is logged in.%>
                     <asp:Button ID="Button1" runat="server" OnClick="EditRecipe" Text="Edit" CssClass="pull-right" />&nbsp;&nbsp;&nbsp;
                <asp:Button runat="server" ID="Button2" OnClick="DelRecipe" Text="Delete" />&nbsp&nbsp&nbsp
            <%} %>
                   
                </p>
            </div>
        </div>
    </div>
</asp:Content>
