using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RecipeDatabaseModel;

public partial class MasterPage : System.Web.UI.MasterPage
{
    //Global Boolean vairable. To identify member is loggedin or not.
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

        RecipeDatabaseEntities rdbEnty = new RecipeDatabaseEntities();
        var query = (from p in rdbEnty.recipes
                     select p);
        IEnumerable<recipe> recipeList = query.ToList();
        string menuItems;
        menuItems = "";
        foreach (var recipe1 in recipeList)
        {
            menuItems = menuItems + "<li><a href='recipeDetails.aspx?recipe=" + recipe1.id + "'>" + recipe1.name + " </a></li>";
        }
        //RecipeMenu.InnerHtml = menuItems;

    }
}
