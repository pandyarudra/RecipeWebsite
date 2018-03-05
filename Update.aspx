<%@ Page Title="UpdateRecipe" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Update.aspx.cs" Inherits="Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #txtDescription {
            width: 304px;
        }

        .auto-style2 {
            height: 96px;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder2" ID="Content3" runat="server">
    <!-- <link href="css/master.css" rel="stylesheet" />-->
     <link href="css/contact.css" rel="stylesheet" />
    <link href="css/recipes.css" rel="stylesheet" />
    <link rel="stylesheet" href="StyleSheet.css" />
    <div id="recipesMain">
        <label for="txtTitle">Recipe Title</label>
        <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="Please Add the Main Ingredient" ControlToValidate="txtTitle"></asp:RequiredFieldValidator>
        <br />
        <label for="txtCategory">Category</label>
        <div>
         
        <div>
            <asp:TextBox ID="txtCategory" runat="server"></asp:TextBox>
        </div>
        <%--<asp:Label ID="lbl_msg_category" runat="server" Text=""></asp:Label>--%>
        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtCategory" runat="server" ForeColor="Blue" ErrorMessage="Please Add the Category" ControlToValidate="txtCategory"></asp:RequiredFieldValidator>--%>
        <br />
        <label for="txtSubmitted">Submitted By</label>
        <asp:TextBox ID="txtSubmitted" runat="server" Enabled="false"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="Please Add your Name" ControlToValidate="txtSubmitted"></asp:RequiredFieldValidator>
        <br />
        <label for="txtCookingTime">Cooking Time</label>
        <asp:TextBox ID="txtCookingTime" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ErrorMessage="Please Add Cooking Time" ControlToValidate="txtCookingTime"></asp:RequiredFieldValidator>
        <br />
        <label for="txtNumServ">Number of Servings</label>
        <asp:TextBox ID="txtNumServ" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ErrorMessage="Please Add Number of Serving" ControlToValidate="txtNumServ"></asp:RequiredFieldValidator>
        <br />

        <!-- Generate HTML for recipe_ingridient data.-->
        <%if (moreIngridientList != null && moreIngridientList.Count > 0)
            { %>
        <input type="hidden" id="hdnIngridient" name="hdnIngridient" value="<%=moreIngridientList.Count %>" />

        <div id="divMoreIngridients">
            <%for (int i = 0; i < moreIngridientList.Count; i++)
                { %>
            <input type="hidden" id="hdnRecipeIngridientsId<%=(i+1) %>" name="hdnRecipeIngridientsId<%=(i+1) %>"
                value="<%=moreIngridientList[i].recipe_ingredientsid %>" />
            <div>
                <label for="lblIngridients<%=(i+1) %>">Ingridients <%=(i+1) %></label>
                <input name="txtIngridients<%=(i+1) %>" type="text" id="txtIngridients<%=(i+1) %>" value="<%=moreIngridientList[i].ingredientname %>">
            </div>
            <div>
                <label for="txtQuantity<%=(i+1) %>">Quantity <%=(i+1) %></label>
                <input name="txtQuantity<%=(i+1) %>" type="text" id="txtQuantity<%=(i+1) %>" value="<%=moreIngridientList[i].quantity %>">
            </div>
            <div>
                <label for="ddlUnit<%=(i+1) %>">Unit <%=(i+1) %></label>
                <select name="ddlUnit<%=(i+1) %>" id="ddlUnit<%=(i+1) %>">
                    <option value="">Select Unit</option>
                    <option value="Litre" <%=moreIngridientList[i].unit == "Litre" ? "selected" : "" %>>Litre</option>
                    <option value="Kgs" <%=moreIngridientList[i].unit == "Kgs" ? "selected" : "" %>>Kgs</option>
                    <option value="Grams" <%=moreIngridientList[i].unit == "Grams" ? "selected" : "" %>>Grams</option>
                </select>
            </div>
            <%} %>
        </div>
        <%} %>

        <br />
        <br />
        <label for="txtDescription">Recipe Description</label>
        <textarea id="txtDescription" runat="server" cols="20" rows="2"></textarea>

        <asp:Button ID="Button1" runat="server" Text="Save Changes" OnClick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;
    <a href="RecipeDetails.aspx?recipe=<%= Convert.ToString(Request.QueryString["recipe"]) %>">Back</a>
</asp:Content>
