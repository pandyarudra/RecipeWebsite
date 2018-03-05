<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder2" runat="server" ID="Content3">
    <link rel="stylesheet" href="StyleSheet.css" />
    <div id="mainPage">
        <br />
        <table>
            <tr>
                <td><div id="mainContent1">
        This web-application has basic functionalities where you can view a recipe,
        <br />
        add a recipe or search a recipe from the list of all available recipes.
        <br />
        This website has over 100 recipes of different foods from different regions.
        <br />
        <br />
        <p>
            1). To view all the recipes, 
        <br />
            Click <strong><em>Recipes</em></strong> --> This allows system to view all the recipes in the database.
        </p>
        <br />
        <p>
            2). To Add a the recipe, 
        <br />
            Click on <strong><em>Add a recipe</em></strong> --> then, fill out all the input boxes to get  -->  hit<br />
            <em>Save the recipe.</em>.
        </p>
        <br />
        <p>
            3). To search a recipe from all the recipes, 
        <br />
            Click <strong><em>Search</em></strong> --> Enter the search criteria in the input box .<br />
            --> System will deiplay the search results. 
        </p>
        <br />
        <p>
            Moreover, the user will be able to navigate to any of the web-pages 
            <br />
            using the link in the navigation bar on the left.
        </p>

            </div></td>
                <td><div id="image"><asp:Image ID="Image2" Width="400px" runat="server" ImageUrl="~/image/Model.png"/>
        </div></td>
            </tr>

        </table>
        
        
    </div>
    
   
</asp:Content>
