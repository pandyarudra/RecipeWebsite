using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RecipeDatabaseModel;

public partial class Register : System.Web.UI.Page
{
    //Global Variables.
    protected string gblStrMessage = "";

    RecipeDatabaseEntities rdbEnty = new RecipeDatabaseEntities();

    #region Page Load Event
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    #endregion


    #region Register Button Click Event
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (ValidateFormData())
        {
            Member objMember = new Member();
            objMember.UserName = txtUser.Text.Trim();
            objMember.Password = Common.Sha1Hash(txtPassword.Text.Trim());
            objMember.IsActive = true;
            objMember.CreatedOn = Common.GetCurrentDateTime();

            rdbEnty.Members.AddObject(objMember);
            rdbEnty.SaveChanges();

            gblStrMessage = "<br><span style=\"color:green;font-size:18px;\">Your registration is completed successfully.<br> Please <a href=\"SignIn.aspx\">click here</a> to login.</span>";

            litStatus.Text = gblStrMessage;
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
        else if (string.IsNullOrWhiteSpace(txtConfirmPassword.Text.Trim()))
        {
            gblStrMessage += "Please enter confirm password." + "<br/>";
            blnValid = false;
        }
        else
        {
            if (txtPassword.Text.Trim() != txtConfirmPassword.Text.Trim())
            {
                gblStrMessage += "Confirm password must be same as password." + "<br/>";
                blnValid = false;
            }
        }
        return blnValid;
    }

    #endregion

}