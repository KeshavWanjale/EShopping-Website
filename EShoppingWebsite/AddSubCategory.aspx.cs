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
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMainCat();
                BindSubCatRptr();
            }
        }

        protected void btnAddtxtSubCategory_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EShoppingDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into tblSubCategory(SubCatName,MainCatID) Values('" + txtSubCategory.Text + "','" + ddlMainCatID.SelectedItem.Value + "')", con);
                cmd.ExecuteNonQuery();

                Response.Write("<script> alert('SubCategory Added Successfully ');  </script>");
                txtSubCategory.Text = string.Empty;

                con.Close();
                ddlMainCatID.ClearSelection();
                ddlMainCatID.Items.FindByValue("0").Selected = true;

            }
            BindMainCat();
            BindSubCatRptr();
        }

        private void BindSubCatRptr()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EShoppingDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("select A.*,B.* from tblSubCategory A inner join tblCategory B on B.CatID  =A.MainCatID  ", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrSubCat.DataSource = dt;
                        rptrSubCat.DataBind();
                    }
                }
            }
        }

        private void BindMainCat()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EShoppingDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblCategory", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlMainCatID.DataSource = dt;
                    ddlMainCatID.DataTextField = "CatName";// record we want to show
                    ddlMainCatID.DataValueField = "CatID"; // record we want to save in subcat
                    ddlMainCatID.DataBind();
                    ddlMainCatID.Items.Insert(0, new ListItem("-Select-", "0"));

                }
            }
        }
    }
}