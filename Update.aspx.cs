using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RecipeDatabaseModel;

public partial class Update : System.Web.UI.Page
{
    protected int MemberId = 0;

    protected List<IngredientRecipeResult> moreIngridientList = new List<IngredientRecipeResult>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //fill category drop down list
           

            int ReqRecipe = Convert.ToInt32(Request.QueryString["recipe"]);
            if (ReqRecipe > 0)
            {
                RecipeDatabaseEntities rdbEnty = new RecipeDatabaseEntities();
                var query = (from p in rdbEnty.recipes
                             where p.id == ReqRecipe
                             select p);
                IEnumerable<recipe> recipeEditList = query.ToList();
                foreach (var recipe1 in recipeEditList)
                {
                    txtTitle.Text = recipe1.name;
                    txtCategory.Text = recipe1.category;
                    txtCookingTime.Text = recipe1.cooking_time;
                    txtNumServ.Text = recipe1.servings;
                    txtSubmitted.Text = recipe1.submitted_by;
                    txtDescription.InnerText = recipe1.Description;
                }

                //Get More ingridient list.
                var moreIngridientResult = (from ri in rdbEnty.recipe_ingredients
                                            join r in rdbEnty.recipes on ri.recipe_id equals r.id
                                            join i in rdbEnty.ingredients on ri.ingredient_id equals i.id
                                            where ri.recipe_id == ReqRecipe
                                            select new IngredientRecipeResult
                                            {
                                                recipe_ingredientsid = ri.id,
                                                recipe_id = ri.recipe_id,
                                                ingredient_id = ri.ingredient_id,
                                                ingredientname = i.name,
                                                unit = ri.unit,
                                                quantity = ri.quantity
                                            });

                moreIngridientList = moreIngridientResult.ToList();

            }
        }

    }
    private void updateIngridients(int recipeId, int totalIngridients)
    {
        RecipeDatabaseEntities rdbEnty = new RecipeDatabaseEntities();
        string name = ""; int Q = 0; string unit = ""; string qty = "";

        int recipe_ingredientsid = 0;
        for (int i = 1; i <= totalIngridients; i++)
        {
            name = "";
            qty = "";
            unit = "";
            Q = 0;

            //Get recipe_ingredientsid.
            if (Request.Form["hdnRecipeIngridientsId" + i] != null && !string.IsNullOrWhiteSpace(Request.Form["hdnRecipeIngridientsId" + i]))
            {
                int.TryParse(Convert.ToString(Request.Form["hdnRecipeIngridientsId" + i]), out recipe_ingredientsid);

            }


            //Get Ingridients.
            if (Request.Form["txtIngridients" + i] != null && !string.IsNullOrWhiteSpace(Request.Form["txtIngridients" + i]))
            {
                name = Convert.ToString(Request.Form["txtIngridients" + i]);
            }

            //Get Quantity.
            if (Request.Form["txtQuantity" + i] != null && !string.IsNullOrWhiteSpace(Request.Form["txtQuantity" + i]))
            {
                qty = Convert.ToString(Request.Form["txtQuantity" + i]);

                //Parse the string variable qty have valid interger value and store into Q (int) variable. Otherwise it will store 0.
                int.TryParse(qty, out Q);

            }

            //Get Unit Name.
            if (Request.Form["ddlUnit" + i] != null && !string.IsNullOrWhiteSpace(Request.Form["ddlUnit" + i]))
            {
                unit = Convert.ToString(Request.Form["ddlUnit" + i]);
            }

            if (!string.IsNullOrWhiteSpace(name) && !string.IsNullOrWhiteSpace(unit) && Q > 0)
            {
                var ingridientResult = (from ri in rdbEnty.recipe_ingredients
                                        join r in rdbEnty.recipes on ri.recipe_id equals r.id
                                        join ing in rdbEnty.ingredients on ri.ingredient_id equals ing.id
                                        where ri.recipe_id == recipeId && ri.id == recipe_ingredientsid
                                        select ing);

                //Update ingridient.
                IEnumerable<ingredient> ingredientEditList = ingridientResult.ToList();
                foreach (var ingredient in ingredientEditList)
                {
                    ingredient.name = name;
                    ingredient.MemberId = MemberId;
                    rdbEnty.SaveChanges();
                }

                var recipe_ingridientResult = (from ri in rdbEnty.recipe_ingredients
                                               join r in rdbEnty.recipes on ri.recipe_id equals r.id
                                               join ing in rdbEnty.ingredients on ri.ingredient_id equals ing.id
                                               where ri.recipe_id == recipeId && ri.id == recipe_ingredientsid
                                               select ri);

                //Update recipe_ingridient.
                IEnumerable<recipe_ingredients> recipe_ingredientsEditList = recipe_ingridientResult.ToList();
                foreach (var recipe_ingredients in recipe_ingredientsEditList)
                {
                    recipe_ingredients.ingredient_id = ingredientEditList.ToList()[0].id;
                    recipe_ingredients.recipe_id = recipeId;
                    recipe_ingredients.unit = unit;
                    recipe_ingredients.quantity = Q;
                    recipe_ingredients.MemberId = MemberId;
                    rdbEnty.SaveChanges();
                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int ReqRecipe = Convert.ToInt32(Request.QueryString["recipe"]);
        if (ReqRecipe > 0)
        {
            RecipeDatabaseEntities rdbEnty = new RecipeDatabaseEntities();
            var query = (from p in rdbEnty.recipes
                         where p.id == ReqRecipe
                         select p);
            IEnumerable<recipe> recipeEditList = query.ToList();
            foreach (var recipe1 in recipeEditList)
            {
                ///recipeName.InnerText = recipe1.name;

                //update recipe data
                recipe1.name = txtTitle.Text;
                
                    recipe1.category = txtCategory.Text;
               
                recipe1.cooking_time = txtCookingTime.Text;
                recipe1.servings = txtNumServ.Text;
                recipe1.Description = txtDescription.InnerText;

                rdbEnty.SaveChanges();
            }


            int num = 0;
            if (Request.Form["hdnIngridient"] != null)
            {
                int.TryParse(Convert.ToString(Request.Form["hdnIngridient"]), out num);
            }

            if (num > 0)
            {
                updateIngridients(ReqRecipe, num);
            }

            //Redirect to recipe edit details page.
            Response.Redirect("RecipeDetails.aspx?recipe=" + ReqRecipe);
        }
    }
}