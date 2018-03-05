<%@ Page Title="Recipes" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddRecipe.aspx.cs" Inherits="AddRecipe" %>

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
<asp:Content  ContentPlaceHolderID="ContentPlaceHolder2" ID="Content3" runat="server">
    
    <link href="css/recipes.css" rel="stylesheet" />
     <link rel="stylesheet" href="StyleSheet.css" />
    <div id="recipesMain">
       To add a recipe, fill out all the boxes below and click Save Recipe.
        <br />
        <br />
        <table cellspacing="30">
            <asp:Label ID="lblCheckBelow" runat="server" Text=""></asp:Label>
            <tr>
               <td class="RecipeName"><b><label for="txtTitle">Name:</label></b></td>
               <td><asp:TextBox ID="txtTitle" runat="server" Width="200px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="reqName" ControlToValidate="txtTitle" runat="server" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
               </td>
            </tr>
            <tr>
                <td><b><label for="txtSubmitted">Submitted By:</label></b> 
                </td>
                <td>
                    <asp:TextBox ID="txtSubmitted" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtSubmitted" runat="server"  ForeColor="Red" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><b><label for="txtCategory">Category :</label></b> 
                </td>
                <td>
                    <asp:TextBox ID="txtCategory" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td><b><label for="txtCookingTime">Cooking Time :</label> </b>
                </td>
                <td>
                    <asp:TextBox ID="txtCookingTime" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td><b><label for="txtNumServ">Number of Servings :</label></b> 
                </td>
                <td>
                    <asp:TextBox ID="txtNumServ" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtNumServ" runat="server" ForeColor="Red" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><b>Ingredients :</b></td> 
                <td><table>
                    <tr>
                        <td>
                             <!-- More Ingridients Html Code START -->

            <input type="hidden" id="hdnIngridient" name="hdnIngridient" value="1" />
            <div id="divMoreIngridients">
                <div id="div11">
                    <label for="lblIngridients1">Ingridients 1</label>
                    <input name="txtIngridients1" type="text" id="txtIngridients1">	
                </div>
                <br />
              
                <div id="div12">
                    <label for="txtQuantity1">Quantity 1</label>
                    <input name="txtQuantity1" type="text" id="Text1">
                </div>
                <br />
                
                <div id="div13">
                    <label for="ddlUnit1">Unit 1</label>
                    <select name="ddlUnit1" id="ddlUnit1">
                        <option value="">Select Unit</option>
                        <option value="Litre">Litre</option>
                        <option value="Kgs">Kgs</option>
                        <option value="Grams">Grams</option>	
                    </select>
                 </div>
                </div>
        <!-- More Ingridients Html Code END-->
               </td></tr>
                   <tr>
                       <td>

                       </td>
                       <td>
                           <input type="button" name="Button2" value="More" onclick="addMoreIngredient();" id="Button2" />

                       </td>

                   </tr>     
                    </table>

                </td>
                
                
            </tr>
            
            <tr>
                <td class="auto-style2"> <b>Recipe Description / Method : </b>
                </td>
                <td class="auto-style2">
                   <textarea id="txtDescription" runat="server" rows="2" Width="200px"></textarea>
                    
                </td>
            </tr>
            <tr>
                <td>

             

        <asp:Button ID="saveButton" runat="server" Text="Save Recipe" OnClientClick="saveButton_Click" OnClick="saveButton_Click" />
                </td>
                <td>
                            <asp:Button ID="cancelButton" runat="server" Text="Cancel Recipe" OnClientClick="cancelButton_Click" OnClick="cancelButton_Click" />

                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">
        function addMoreIngredient() {
            var totalIngredients = $('#hdnIngridient').val();

            if (totalIngredients != null && totalIngredients != "") {
                totalIngredients = parseInt(totalIngredients) + 1;
            }

            var div1Html, div1Html, div3Html;

            div1Html = "<div id='div" + totalIngredients + 1 + "'><label for='txtIngridients" + totalIngredients + "'>Ingridients " + totalIngredients + "</label> <input name='txtIngridients" + totalIngredients + "' type='text' id='txtIngridients" + totalIngredients + "'></div><br>";

            div2Html = "<div id='div" + totalIngredients + 2 + "'><label for='txtQuantity" + totalIngredients + "'>Quantity " + totalIngredients + "</label> <input name='txtQuantity" + totalIngredients + "' type='text' id='txtQuantity" + totalIngredients + "'></div><br>";

            div3Html = "<div id='div" + totalIngredients + 3 + "'><label for='ddlUnit" + totalIngredients + "'>Unit " + totalIngredients + "</label>";
            div3Html += "<select name='ddlUnit" + totalIngredients + "' id='" + totalIngredients + "'>";
            div3Html += "<option value=''>Select Unit</option>";
            div3Html += "<option value='Litre'>Litre</option>";
            div3Html += "<option value='Kgs'>Kgs</option>";
            div3Html += "<option value='Grams'>Grams</option>";;
            div3Html += "</select></div>";

            $('#hdnIngridient').val(totalIngredients);

            $('#divMoreIngridients').append("<br/>" + (div1Html + div2Html + div3Html));

            return false;
        }

    </script>
    <asp:Panel ID="Panel1" runat="server">
        <asp:TextBox ID="TextBox1" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" Visible="false"></asp:TextBox>
        <asp:DropDownList ID="DropDownList1" runat="server" Visible="false">
                <asp:ListItem Value="">Select Unit</asp:ListItem>
                <asp:ListItem Value="Litre">Litre</asp:ListItem>
                <asp:ListItem Value="Kgs">Kgs</asp:ListItem>
                <asp:ListItem Value="Grams">Grams</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="TextBox3" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="TextBox4" runat="server" Visible="false"></asp:TextBox>
        <asp:DropDownList ID="DropDownList2" runat="server" Visible="false">
                <asp:ListItem Value="">Select Unit</asp:ListItem>
                <asp:ListItem Value="Litre">Litre</asp:ListItem>
                <asp:ListItem Value="Kgs">Kgs</asp:ListItem>
                <asp:ListItem Value="Grams">Grams</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="TextBox5" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="TextBox6" runat="server" Visible="false"></asp:TextBox>
        <asp:DropDownList ID="DropDownList3" runat="server" Visible="false">
                <asp:ListItem Value="">Select Unit</asp:ListItem>
                <asp:ListItem Value="Litre">Litre</asp:ListItem>
                <asp:ListItem Value="Kgs">Kgs</asp:ListItem>
                <asp:ListItem Value="Grams">Grams</asp:ListItem>
        </asp:DropDownList>


        <asp:TextBox ID="TextBox7" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="TextBox8" runat="server" Visible="false"></asp:TextBox>
        <asp:DropDownList ID="DropDownList4" runat="server" Visible="false">
                <asp:ListItem Value="">Select Unit</asp:ListItem>
                <asp:ListItem Value="Litre">Litre</asp:ListItem>
                <asp:ListItem Value="Kgs">Kgs</asp:ListItem>
                <asp:ListItem Value="Grams">Grams</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="TextBox9" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="TextBox10" runat="server" Visible="false"></asp:TextBox>
        <asp:DropDownList ID="DropDownList5" runat="server" Visible="false">
                <asp:ListItem Value="">Select Unit</asp:ListItem>
                <asp:ListItem Value="Litre">Litre</asp:ListItem>
                <asp:ListItem Value="Kgs">Kgs</asp:ListItem>
                <asp:ListItem Value="Grams">Grams</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="TextBox11" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="TextBox12" runat="server" Visible="false"></asp:TextBox>
        <asp:DropDownList ID="DropDownList6" runat="server" Visible="false">
                <asp:ListItem Value="">Select Unit</asp:ListItem>
                <asp:ListItem Value="Litre">Litre</asp:ListItem>
                <asp:ListItem Value="Kgs">Kgs</asp:ListItem>
                <asp:ListItem Value="Grams">Grams</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="TextBox13" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="TextBox14" runat="server" Visible="false"></asp:TextBox>
        <asp:DropDownList ID="DropDownList7" runat="server" Visible="false">
                <asp:ListItem Value="">Select Unit</asp:ListItem>
                <asp:ListItem Value="Litre">Litre</asp:ListItem>
                <asp:ListItem Value="Kgs">Kgs</asp:ListItem>
                <asp:ListItem Value="Grams">Grams</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="TextBox15" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="TextBox16" runat="server" Visible="false"></asp:TextBox>
        <asp:DropDownList ID="DropDownList8" runat="server" Visible="false">
                <asp:ListItem Value="">Select Unit</asp:ListItem>
                <asp:ListItem Value="Litre">Litre</asp:ListItem>
                <asp:ListItem Value="Kgs">Kgs</asp:ListItem>
                <asp:ListItem Value="Grams">Grams</asp:ListItem>
        </asp:DropDownList>


        <asp:TextBox ID="TextBox17" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="TextBox18" runat="server" Visible="false"></asp:TextBox>
        <asp:DropDownList ID="DropDownList9" runat="server" Visible="false">
                <asp:ListItem Value="">Select Unit</asp:ListItem>
                <asp:ListItem Value="Litre">Litre</asp:ListItem>
                <asp:ListItem Value="Kgs">Kgs</asp:ListItem>
                <asp:ListItem Value="Grams">Grams</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="TextBox19" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="TextBox20" runat="server" Visible="false"></asp:TextBox>
        <asp:DropDownList ID="DropDownList10" runat="server" Visible="false">
                <asp:ListItem Value="">Select Unit</asp:ListItem>
                <asp:ListItem Value="Litre">Litre</asp:ListItem>
                <asp:ListItem Value="Kgs">Kgs</asp:ListItem>
                <asp:ListItem Value="Grams">Grams</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="TextBox21" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="TextBox22" runat="server" Visible="false"></asp:TextBox>
        <asp:DropDownList ID="DropDownList11" runat="server" Visible="false">
                <asp:ListItem Value="">Select Unit</asp:ListItem>
                <asp:ListItem Value="Litre">Litre</asp:ListItem>
                <asp:ListItem Value="Kgs">Kgs</asp:ListItem>
                <asp:ListItem Value="Grams">Grams</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="TextBox23" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="TextBox24" runat="server" Visible="false"></asp:TextBox>
        <asp:DropDownList ID="DropDownList12" runat="server" Visible="false">
                <asp:ListItem Value="">Select Unit</asp:ListItem>
                <asp:ListItem Value="Litre">Litre</asp:ListItem>
                <asp:ListItem Value="Kgs">Kgs</asp:ListItem>
                <asp:ListItem Value="Grams">Grams</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="TextBox25" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="TextBox26" runat="server" Visible="false"></asp:TextBox>
        <asp:DropDownList ID="DropDownList13" runat="server" Visible="false">
                <asp:ListItem Value="">Select Unit</asp:ListItem>
                <asp:ListItem Value="Litre">Litre</asp:ListItem>
                <asp:ListItem Value="Kgs">Kgs</asp:ListItem>
                <asp:ListItem Value="Grams">Grams</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="TextBox27" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="TextBox28" runat="server" Visible="false"></asp:TextBox>
        <asp:DropDownList ID="DropDownList14" runat="server" Visible="false">
                <asp:ListItem Value="">Select Unit</asp:ListItem>
                <asp:ListItem Value="Litre">Litre</asp:ListItem>
                <asp:ListItem Value="Kgs">Kgs</asp:ListItem>
                <asp:ListItem Value="Grams">Grams</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="TextBox29" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="TextBox30" runat="server" Visible="false"></asp:TextBox>
        <asp:DropDownList ID="DropDownList15" runat="server" Visible="false">
                <asp:ListItem Value="">Select Unit</asp:ListItem>
                <asp:ListItem Value="Litre">Litre</asp:ListItem>
                <asp:ListItem Value="Kgs">Kgs</asp:ListItem>
                <asp:ListItem Value="Grams">Grams</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="TextBox31" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="TextBox32" runat="server" Visible="false"></asp:TextBox>
        <asp:DropDownList ID="DropDownList16" runat="server" Visible="false">
                <asp:ListItem Value="">Select Unit</asp:ListItem>
                <asp:ListItem Value="Litre">Litre</asp:ListItem>
                <asp:ListItem Value="Kgs">Kgs</asp:ListItem>
                <asp:ListItem Value="Grams">Grams</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="TextBox33" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="TextBox34" runat="server" Visible="false"></asp:TextBox>
        <asp:DropDownList ID="DropDownList17" runat="server" Visible="false">
                <asp:ListItem Value="">Select Unit</asp:ListItem>
                <asp:ListItem Value="Litre">Litre</asp:ListItem>
                <asp:ListItem Value="Kgs">Kgs</asp:ListItem>
                <asp:ListItem Value="Grams">Grams</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="TextBox35" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="TextBox36" runat="server" Visible="false"></asp:TextBox>
        <asp:DropDownList ID="DropDownList18" runat="server" Visible="false">
                <asp:ListItem Value="">Select Unit</asp:ListItem>
                <asp:ListItem Value="Litre">Litre</asp:ListItem>
                <asp:ListItem Value="Kgs">Kgs</asp:ListItem>
                <asp:ListItem Value="Grams">Grams</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="TextBox37" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="TextBox38" runat="server" Visible="false"></asp:TextBox>
        <asp:DropDownList ID="DropDownList19" runat="server" Visible="false">
                <asp:ListItem Value="">Select Unit</asp:ListItem>
                <asp:ListItem Value="Litre">Litre</asp:ListItem>
                <asp:ListItem Value="Kgs">Kgs</asp:ListItem>
                <asp:ListItem Value="Grams">Grams</asp:ListItem>
        </asp:DropDownList>
    </asp:Panel>
</asp:Content>
