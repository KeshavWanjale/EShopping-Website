using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EShoppingWebsite
{
    public partial class UserHome : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["EShoppingDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Username"] != null)
            {
                btnsignout.Visible = true;
                btnsignin.Visible = false;
                lblSuccess.Text = "Login Success, Welcome " + Session["Username"].ToString();
            }
            else
            {
                btnsignout.Visible=false;
                btnsignin.Visible=true;
                Response.Redirect("~/SignIn.aspx");
            }
        }


        public void BindCartNumber()
        {
            if (Session["USERID"] != null)
            {
                string UserIDD = Session["USERID"].ToString();
                DataTable dt = new DataTable();
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("SP_BindCartNumberz", con)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@UserID", UserIDD);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            string CartQuantity = dt.Compute("Sum(Qty)", "").ToString();
                            pCount.InnerText = CartQuantity;
                        }
                        else
                        {
                            pCount.InnerText = "0";

                        }
                    }
                }
            }
        }

        protected void signout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session["Username"] = null;
            Response.Redirect("~/Default.aspx");
        }

        protected void signin_Click(Object sender,EventArgs e)
        {
            Response.Redirect("~/SignIn.aspx");
        }
    }
}