using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for IngredientRecipeResult
/// </summary>
public class IngredientRecipeResult
{

    public int? recipe_ingredientsid { get; set; }
    public int? recipe_id { get; set; }
    public int? ingredient_id { get; set; }
    public string ingredientname { get; set; }
    public string unit { get; set; }
    public int? quantity { get; set; }
}