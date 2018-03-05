using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RecipeDatabaseModel;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            RecipeDatabaseEntities rdbEnty = new RecipeDatabaseEntities();
            var query = (from p in rdbEnty.recipes
                         select p);
            IEnumerable<recipe> recipeList = query.ToList();
            foreach (var recipe1 in recipeList)
            {
                ddRecipeName.Items.Add(new ListItem(recipe1.name, recipe1.id.ToString()));
                ddRecipeCreator.Items.Add(new ListItem(recipe1.submitted_by, recipe1.id.ToString()));
            }

            var query1 = (from i1 in rdbEnty.ingredients
                          select i1);
            IEnumerable<ingredient> incList = query1.ToList();
            foreach (var inc1 in incList)
            {
                ddInc.Items.Add(new ListItem(inc1.name, inc1.id.ToString()));
            }
        }
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        
    }

    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        int IncVal = Convert.ToInt32(ddInc.SelectedValue);
        int RecVal = Convert.ToInt32(ddRecipeName.SelectedValue);
        if (IncVal > 0 && RecVal > 0 && ddRecipeCreator.SelectedItem.Text != "All")
        {
            RecipeDatabaseEntities rdbEnty = new RecipeDatabaseEntities();
            var query = (from p in rdbEnty.recipes
                         from ri in rdbEnty.recipe_ingredients
                         join i in rdbEnty.ingredients on ri.ingredient_id equals i.id
                         where p.id == RecVal && i.id == IncVal && p.submitted_by == ddRecipeCreator.SelectedItem.Text
                         select p);
            IEnumerable<recipe> recipeList = query.ToList();
            string htmlElts;
            htmlElts = "";
            int ii;
            ii = 0;
            foreach (var recipe1 in recipeList)
            {
                htmlElts = htmlElts + "<p class='item'><a href='RecipeDetails.aspx?recipe=" + recipe1.id.ToString() + "'>" + recipe1.name + "</a></p>";
                ii++;
            }
            searchedItemsCount.InnerHtml = (ii).ToString();
            searchedItems.InnerHtml = htmlElts;
        }
        else if (IncVal > 0 && RecVal > 0 && ddRecipeCreator.SelectedItem.Text == "All")
        {
            RecipeDatabaseEntities rdbEnty = new RecipeDatabaseEntities();
            var query = (from p in rdbEnty.recipes from ri in rdbEnty.recipe_ingredients join i in rdbEnty.ingredients on ri.ingredient_id equals i.id where p.id == RecVal && i.id == IncVal select p);
            IEnumerable<recipe> recipeList = query.ToList();
            string htmlElts;
            htmlElts = "";
            int ii;
            ii = 0;
            foreach (var recipe1 in recipeList)
            {
                htmlElts = htmlElts + "<p class='item'><a href='RecipeDetails.aspx?recipe=" + recipe1.id.ToString() + "'>" + recipe1.name + "</a></p>";
                ii++;
            }
            searchedItemsCount.InnerHtml = (ii).ToString();
            searchedItems.InnerHtml = htmlElts;
        }
        else if (IncVal == 0 && RecVal > 0 && ddRecipeCreator.SelectedItem.Text != "All")
        {
            RecipeDatabaseEntities rdbEnty = new RecipeDatabaseEntities();
            var query = (from p in rdbEnty.recipes where p.id == RecVal && p.submitted_by == ddRecipeCreator.SelectedItem.Text select p);
            IEnumerable<recipe> recipeList = query.ToList();
            string htmlElts;
            htmlElts = "";
            int ii;
            ii = 0;
            foreach (var recipe1 in recipeList)
            {
                htmlElts = htmlElts + "<p class='item'><a href='RecipeDetails.aspx?recipe=" + recipe1.id.ToString() + "'>" + recipe1.name + "</a></p>";
                ii++;
            }
            searchedItemsCount.InnerHtml = (ii).ToString();
            searchedItems.InnerHtml = htmlElts;
        }
        else if (IncVal == 0 && RecVal > 0 && ddRecipeCreator.SelectedItem.Text == "All")
        {
            RecipeDatabaseEntities rdbEnty = new RecipeDatabaseEntities();
            var query = (from p in rdbEnty.recipes where p.id == RecVal select p);
            IEnumerable<recipe> recipeList = query.ToList();
            string htmlElts;
            htmlElts = "";
            int ii;
            ii = 0;
            foreach (var recipe1 in recipeList)
            {
                htmlElts = htmlElts + "<p class='item'><a href='RecipeDetails.aspx?recipe=" + recipe1.id.ToString() + "'>" + recipe1.name + "</a></p>";
                ii++;
            }
            searchedItemsCount.InnerHtml = (ii).ToString();
            searchedItems.InnerHtml = htmlElts;
        }
        else if (IncVal > 0 && RecVal == 0 && ddRecipeCreator.SelectedItem.Text == "All")
        {
            RecipeDatabaseEntities rdbEnty = new RecipeDatabaseEntities();
            var query = (from i in rdbEnty.ingredients where i.name == ddInc.SelectedItem.Text select i);
            IEnumerable<ingredient> recipeList = query.ToList();
            string htmlElts;
            htmlElts = "";
            int ii;
            ii = 0;
            foreach (var recipe1 in recipeList)
            {
                htmlElts = htmlElts + "<p class='item'><a href='RecipeDetails.aspx?recipe=" + recipe1.id.ToString() + "'>" + recipe1.name + "</a></p>";
                ii++;
            }
            searchedItemsCount.InnerHtml = (ii).ToString();
            searchedItems.InnerHtml = htmlElts;
        }
        else if (IncVal == 0 && RecVal == 0 && ddRecipeCreator.SelectedItem.Text != "All")
        {
            RecipeDatabaseEntities rdbEnty = new RecipeDatabaseEntities();
            var query = (from r in rdbEnty.recipes where r.submitted_by == ddRecipeCreator.SelectedItem.Text select r);
            IEnumerable<recipe> recipeList = query.ToList();
            string htmlElts;
            htmlElts = "";
            int ii;
            ii = 0;
            foreach (var recipe1 in recipeList)
            {
                htmlElts = htmlElts + "<p class='item'><a href='RecipeDetails.aspx?recipe=" + recipe1.id.ToString() + "'>" + recipe1.name + "</a></p>";
                ii++;
            }
            searchedItemsCount.InnerHtml = (ii).ToString();
            searchedItems.InnerHtml = htmlElts;
        }
        else
        {
            RecipeDatabaseEntities rdbEnty = new RecipeDatabaseEntities();
            var query = (from p in rdbEnty.recipes
                         select p);
            IEnumerable<recipe> recipeList = query.ToList();
            string htmlElts;
            htmlElts = "";
            int i;
            i = 0;
            foreach (var recipe1 in recipeList)
            {
                htmlElts = htmlElts + "<p class='item'><a href='RecipeDetails.aspx?recipe=" + recipe1.id.ToString() + "'>" + recipe1.name + "</a></p>";
                i++;
            }
            searchedItemsCount.InnerHtml = (i - 1).ToString();
            searchedItems.InnerHtml = htmlElts;
        }


    }
}