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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindBrandRepeater();
        }

        protected void btnAddBrand_Click(object sender, EventArgs e)
        {
            if (txtBrand.Text != null && txtBrand.Text != "" && txtBrand.Text != string.Empty)
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EShoppingDB"].ConnectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Insert into tblBrands(Name) Values('" + txtBrand.Text + "')", con);
                    cmd.ExecuteNonQuery();

                    Response.Write("<script> alert('Brand Added Successfully ');  </script>");
                    txtBrand.Text = string.Empty;

                    con.Close();
                    //lblMsg.Text = "Registration Successfully done";
                    //lblMsg.ForeColor = System.Drawing.Color.Green;
                    txtBrand.Focus();
                }
                BindBrandRepeater();
            }

        }

        private void BindBrandRepeater()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EShoppingDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("select * from tblBrands", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrBrands.DataSource = dt;
                        rptrBrands.DataBind();
                    }
                }
            }
        }
    }
}