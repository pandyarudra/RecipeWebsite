using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Common
/// </summary>
public class Common
{

    /// <summary>
    /// This function is used for encryption.
    /// </summary>
    /// <param name="strCode">The code.</param>
    /// <returns>string</returns>
    public static string Sha1Hash(string strCode)
    {
        string rehash = "";
        System.Security.Cryptography.SHA1 hash = System.Security.Cryptography.SHA1.Create();
        System.Text.ASCIIEncoding encoder = new System.Text.ASCIIEncoding();
        byte[] combined = encoder.GetBytes(strCode);
        hash.ComputeHash(combined);
        rehash = Convert.ToBase64String(hash.Hash);
        return rehash;
    }

    /// <summary>
    /// This method is used to check member authenticate login.
    /// </summary>
    /// <returns>bool</returns>
    public static bool IsMemberAuthenticateLogin()
    {
        if (System.Web.HttpContext.Current.Session["MemberId"] != null)
            return true;
        else
            return false;
    }

    /// <summary>
    /// This method is used to get current date time.
    /// </summary>
    /// <returns>DateTime</returns>
    public static DateTime GetCurrentDateTime()
    {
        return DateTime.Now;
    }
}