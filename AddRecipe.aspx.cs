using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RecipeDatabaseModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Drawing;

public partial class AddRecipe : System.Web.UI.Page
{
    protected int MemberId = 0;
    protected string UserName = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Common.IsMemberAuthenticateLogin())
        {
            MemberId = Convert.ToInt32(Session["MemberId"]);

            UserName = Convert.ToString(Session["UserName"]);

            txtSubmitted.Text = UserName;
            txtSubmitted.Enabled = false;
        }
        else
        {
            Response.Redirect("SignIn.aspx");
        }

        if (!Page.IsPostBack)
        {
            Session["numOfGradient"] = 1;
            Session["ind"] = 1;
        }
    }

    protected void saveButton_Click(object sender, EventArgs e)
    {


        int LastInsertedRecipeId, LastInsertedIngredientId;
        RecipeDatabaseEntities rdbEnty = new RecipeDatabaseEntities();
        recipe rObj = new recipe();
        rObj.name = txtTitle.Text;
            rObj.category = txtCategory.Text;
        

        rObj.submitted_by = txtSubmitted.Text;
        rObj.cooking_time = txtCookingTime.Text;
        rObj.servings = txtNumServ.Text;
        rObj.Description = txtDescription.InnerText;
        rObj.MemberId = MemberId;
        rdbEnty.recipes.AddObject(rObj);
        rdbEnty.SaveChanges();
        LastInsertedRecipeId = rObj.id;


        int num = 0;
        if (Request.Form["hdnIngridient"] != null)
        {
            int.TryParse(Convert.ToString(Request.Form["hdnIngridient"]), out num);
        }

        if (num > 0)
        {
            saveIngridients(LastInsertedRecipeId, num);
        }

        rdbEnty.SaveChanges();
        Response.Redirect("Recipe.aspx");
    }

    private void addMoreIngridients(int recipeId)
    {
        RecipeDatabaseEntities rdbEnty = new RecipeDatabaseEntities();
        int ind = int.Parse(Session["ind"].ToString());
        string name = ""; int Q = 0; string unit = "";

        for (int i = 1; i < ind; i++)
        {
            if (Panel1.Controls[i] is TextBox && Panel1.Controls[i].ID.EndsWith("Q"))
            {
                Q = int.Parse(((TextBox)(Panel1.Controls[ind])).Text);
            }
            else if (Panel1.Controls[i] is TextBox)
            {
                name = ((TextBox)(Panel1.Controls[i])).Text;
            }
            else if (Panel1.Controls[i] is DropDownList)
            {
                unit = ((DropDownList)Panel1.Controls[i]).Text;
                ingredient iObj = new ingredient();
                iObj.name = name;
                iObj.MemberId = MemberId;
                rdbEnty.ingredients.AddObject(iObj);
                rdbEnty.SaveChanges();
                int LastInsertedIngredientId = iObj.id;

                recipe_ingredients riObj = new recipe_ingredients();
                riObj.ingredient_id = LastInsertedIngredientId;
                riObj.recipe_id = recipeId;
                riObj.unit = unit;
                riObj.quantity = Q;
                riObj.MemberId = MemberId;
                rdbEnty.recipe_ingredients.AddObject(riObj);
                rdbEnty.SaveChanges();
            }

        }
    }

    private void saveIngridients(int recipeId, int totalIngridients)
    {
        RecipeDatabaseEntities rdbEnty = new RecipeDatabaseEntities();
        string name = ""; int Q = 0; string unit = ""; string qty = "";


        for (int i = 1; i <= totalIngridients; i++)
        {
            name = "";
            qty = "";
            unit = "";
            Q = 0;


            if (Request.Form["txtIngridients" + i] != null && !string.IsNullOrWhiteSpace(Request.Form["txtIngridients" + i]))
            {
                name = Convert.ToString(Request.Form["txtIngridients" + i]);
            }

            if (Request.Form["txtQuantity" + i] != null && !string.IsNullOrWhiteSpace(Request.Form["txtQuantity" + i]))
            {
                qty = Convert.ToString(Request.Form["txtQuantity" + i]);

                int.TryParse(qty, out Q);

            }

            if (Request.Form["ddlUnit" + i] != null && !string.IsNullOrWhiteSpace(Request.Form["ddlUnit" + i]))
            {
                unit = Convert.ToString(Request.Form["ddlUnit" + i]);
            }

            if (!string.IsNullOrWhiteSpace(name) && !string.IsNullOrWhiteSpace(unit) && Q > 0)
            {
                ingredient iObj = new ingredient();
                iObj.name = name;
                iObj.MemberId = MemberId;
                rdbEnty.ingredients.AddObject(iObj);
                rdbEnty.SaveChanges();
                int LastInsertedIngredientId = iObj.id;

                recipe_ingredients riObj = new recipe_ingredients();
                riObj.ingredient_id = LastInsertedIngredientId;
                riObj.recipe_id = recipeId;
                riObj.name = name;
                riObj.unit = unit;
                riObj.quantity = Q;
                riObj.MemberId = MemberId;
                rdbEnty.recipe_ingredients.AddObject(riObj);
                rdbEnty.SaveChanges();
            }
        }
    }
    protected void cancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddRecipe.aspx");
    }
    protected void plus_Click(object sender, ImageClickEventArgs e)
    {

    }
}