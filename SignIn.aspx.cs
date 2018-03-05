using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RecipeDatabaseModel;

public partial class SignIn : System.Web.UI.Page
{
    protected string gblStrMessage = "";

    RecipeDatabaseEntities rdbEnty = new RecipeDatabaseEntities();

    #region Page Load Event
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(System.Web.HttpContext.Current.Request.HttpMethod) == "GET")
        {
            Session.Clear(); //Clear all the values of the session.
            Session.Abandon(); //Remove the current session.        
        }
    }
    #endregion

    #region Button Login Click
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (ValidateFormData())
        {
            string userName = txtUser.Text.Trim();
            string password = txtPassword.Text.Trim();
            string encryptedPassword = Common.Sha1Hash(password);
            var memberDetail = (from m in rdbEnty.Members
                                where m.UserName == userName
                                   && m.Password == encryptedPassword
                                select m).ToList();

            if (memberDetail != null && memberDetail.Count > 0)
            {
                //Store member details in session.
                Session["MemberId"] = memberDetail[0].MemberId;
                Session["UserName"] = memberDetail[0].UserName;

                Response.Redirect("Default.aspx", false);
            }
            else
            {
                gblStrMessage = "<span style=\"color: red;\">Invalid User Name / Password</span>";
                litStatus.Text = gblStrMessage;
            }

        }
        else
        {
            litStatus.Text = gblStrMessage;
        }
    }
    #endregion



    #region Validate Form Controls Details

    /// <summary>
    /// This method is used to validate form (controls) data.
    /// </summary>
    /// <returns>bool</returns>
    public bool ValidateFormData()
    {
        bool blnValid = true;
        gblStrMessage = string.Empty;

        if (string.IsNullOrWhiteSpace(txtUser.Text.Trim()))
        {
            gblStrMessage += "Please enter user name." + "<br/>";
            blnValid = false;
        }

        if (string.IsNullOrWhiteSpace(txtPassword.Text.Trim()))
        {
            gblStrMessage += "Please enter password." + "<br/>";
            blnValid = false;
        }
        return blnValid;
    }

    #endregion
}