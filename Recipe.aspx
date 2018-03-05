<%@ Page Title="Recipes" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Recipe.aspx.cs" Inherits="Recipe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder2" ID="Content2" runat="server">
    <link rel="stylesheet" href="StyleSheet.css" />
    <link rel="stylesheet" href="css/contact.css" />
    <div id="recipesMain">

        <table cellspacing="30">
            <asp:label id="lblCheckBelow" runat="server" text=""></asp:label>
            <tr>
                <td>
                    <img src="image/Recipe/Quesadillas.jpg" height="141" width="250" />
                </td>
                <td>
                    <span class="foodHeadings"><b> Honeydew Melon Sherbet </b>
                    </span>
                    <br />
                    <br />

                    <span class="foodHeadings"><b>Ingridients :</b>
                    </span>
                    <br />
                    <ul>
                        <li>4 1/2 cups cubed honeydew melon</li>
                        <li>1 1/2 cups lime sherbet</li>
                    </ul>
                    <br />
                    <br />
                    <span class="foodHeadings">Directions : 
                    </span>
                    <br />
                    <ul>
                        <li>
                            <p>
                                Place honeydew melon in a single layer on a baking sheet. Cover and freeze until firm, about 30 minutes.
    Transfer frozen melon to a food processor with the sherbet and lime juice. Puree until smooth.
                            </p>
                        </li>
                        <li>
                            <p>Pour mixture evenly into 4 glasses, and garnish each glass with a strawberry. Serve immediately.</p>
                        </li>
                    </ul>
                    <br />
                    <br />
                    <span class="foodHeadings">Tip : 
                    </span>
                    <ul>
                        <li>Aluminum foil can be used to keep food moist, cook it evenly, and make clean-up easier.</li>
                    </ul>
                    <hr size="5" style="color: rgb(254, 0, 0)" />
                </td>

            </tr>
            <!--   <tr>
                <td>
                    2).
                </td>
            </tr>-->

            <tr>
                <td>
                    <img src="image/Recipe/Salmon.jpg" height="141" width="250" />
                </td>
                <td>
                    <span class="foodHeadings"><b>Veggie Manchurian Bowl  </b>
                    </span>
                    <br />
                    <br />

                    <span class="foodHeadings">Ingridients : 
                    </span>
                    <br />
                    <ul>
                        <li>0.5 Kg cabbage</li>
                        <li>0.5 Kg green pepper </li>
                        <li> small onion, diced </li>
                        <li>2 table spoon tastemaker</li>
                        <li>3 tablespoons vegetable oil</li>
                        <li>1 kg semolina floor</li>
                    </ul>

                    <br />
                    <br />
                    <span class="foodHeadings">Description : 
                    </span>
                    <br />
                    <ul>
                        <li>
                            <p>
                                Grind all the vegetables into fine pieces and mix it with semolina floor and make balls
                            </p>
                        </li>
                        <li>
                            <p>
                                Shape into 2 ounce balls; about 7 or 8 balls. In a large skillet over medium heat, heat the oil.
                             Fry each ball for 5 minutes on each side or until crispy and golden brown
                            </p>
                        </li>
                    </ul>
                    <br />
                    <br />
                    <span class="foodHeadings">Tip : 
                    </span>
                    <ul>
                        <li>Add it in the soup and your dish is ready!</li>
                    </ul>
                </td>

            </tr>
            <tr><td><span class="foodHeadings">Check out some more recipes clicking the links below below</span></td></tr>
            <tr>
                
                <td>
                    <div runat="server" id="multiRecipe"></div>
                    
                </td>

            </tr>
        </table>
    </div>




</asp:Content>
