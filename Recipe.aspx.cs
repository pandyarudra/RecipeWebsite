using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RecipeDatabaseModel;

public partial class Recipe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RecipeDatabaseEntities rdbEnty = new RecipeDatabaseEntities();
        var query = (from p in rdbEnty.recipes
                     select p);
        IEnumerable<recipe> recipeList = query.ToList();
        string elts;
        elts = "";
        foreach (var recipe1 in recipeList)
        {
            elts = elts + "<p class='item'><a href='RecipeDetails.aspx?recipe=" + recipe1.id.ToString() + "'><span>" + recipe1.id.ToString() + ". " + recipe1.name + "</span></a></p>";
        }
        multiRecipe.InnerHtml = elts;
    }
    protected void saveButton_Click(object sender, EventArgs e)
    {
       
    }
    protected void cancelButton_Click(object sender, EventArgs e)
    {
       
    }
}