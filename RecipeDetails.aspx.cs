using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RecipeDatabaseModel;
using System.Data.Objects;

public partial class RecipeDetails : System.Web.UI.Page
{

    protected bool gblBlnIsMemberLogin = false;

    protected int MemberId = 0;
    protected string MemberUserName = "";
 
        protected void Page_Load(object sender, EventArgs e)

    {

            if (Session["MemberId"] != null && Convert.ToInt32(Session["MemberId"]) > 0)
            {
                //Set true if session contains MemberId.
                gblBlnIsMemberLogin = true;

                MemberId = Convert.ToInt32(Session["MemberId"]);
                MemberUserName = Convert.ToString(Session["UserName"]);
            }
            int ReqRecipe = Convert.ToInt32(Request.QueryString["recipe"]);
        if (ReqRecipe > 0)
        {
            RecipeDatabaseEntities rdbEnty = new RecipeDatabaseEntities();
            var query = (from p in rdbEnty.recipes
                         where p.id == ReqRecipe
                         select p);
            IEnumerable<recipe> recipeList = query.ToList();
            foreach (var recipe1 in recipeList)
            {
                recipeName.InnerText = recipe1.name;
                submitted_by.InnerText = recipe1.submitted_by;
                cookingt.InnerText = recipe1.cooking_time + " minutes";
                servings.InnerText = recipe1.servings;
                direction.InnerText = recipe1.Description;
                var query1 = (from p1 in rdbEnty.recipe_ingredients where p1.recipe_id == recipe1.id select p1);
                IEnumerable<recipe_ingredients> recipeList1 = query1.ToList();
                string ri_items = "";
                foreach (recipe_ingredients recipe11 in recipeList1)
                {

                    ri_items = "<p class='item-sub'>" + recipe11.ingredient_id + ")." + recipe11.name + " : " + recipe11.quantity + " " + recipe11.unit + "</p>";
                }
                Ingredient.InnerHtml = ri_items;                
                
            }
        }


    }
    protected void DelRecipe(object sender, EventArgs e)
    {
        int ReqRecipe = Convert.ToInt32(Request.QueryString["recipe"]);
        RecipeDatabaseEntities rdbEnty = new RecipeDatabaseEntities();
        recipe robj = new recipe() { id = ReqRecipe };
        rdbEnty.recipes.Attach(robj);
        rdbEnty.recipes.DeleteObject(robj);
        rdbEnty.SaveChanges();

        Response.Redirect("Recipe.aspx");


    }
    protected void EditRecipe(object sender, EventArgs e)
    {
        int ReqRecipe = Convert.ToInt32(Request.QueryString["recipe"]);
        RecipeDatabaseEntities rdbEnty = new RecipeDatabaseEntities();
        var query = (from p in rdbEnty.recipes
                     where p.id == ReqRecipe
                     select p);
        IEnumerable<recipe> recipeList = query.ToList();
        string elts;
        elts = "";
        foreach (var recipe1 in recipeList)
        {
            elts = "?recipe=" + recipe1.id.ToString();
        }

        Response.Redirect("Update.aspx" + elts);

    }
}