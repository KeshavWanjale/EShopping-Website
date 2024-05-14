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
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtsignup_Click(object sender, EventArgs e)
        {
            /*
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EshoppingDB"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into tblUsers(Username,Password,Email,Name,Gender) Values('"+ txtUname.Text+"','"+txtPass.Text+"','"+txtEmail.Text+"','"+txtName.Text+"','"+btnGender.SelectedItem.Text+"')",con);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Registration Done Successfully')</script>");
            con.Close();
            */

            if (isFormValid())
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EshoppingDB"].ConnectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Insert into tblUsers(Username,Password,Email,Name,Gender,UserType) Values('" + txtUname.Text + "','" + txtPass.Text + "','" + txtEmail.Text + "','" + txtName.Text + "','" + btnGender.SelectedItem.Text + "','User')", con);
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Registration Done Successfully')</script>");
                    lblMsg.Text = "Registration Done Successfully";
                    lblMsg.ForeColor = System.Drawing.Color.Green;
                    clr();
                    con.Close();
                }
                Response.Redirect("~/SignIn.aspx");
            }
            else
            {
                Response.Write("<script>alert('Registration Failed')</script>");
                lblMsg.Text = "All Fields Are Mandatory";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        private bool isFormValid()
        {
            if(txtUname.Text == "")
            { 
               Response.Write("<script>alert('Invalid User Name')</script>");
                txtUname.Focus();
               return false;
            }
            else if (txtPass.Text == "")
            {
                Response.Write("<script>alert('Invalid Password')</script>");
                txtPass.Focus();
                return false;
            }
            else if (txtPass.Text != txtCPass.Text)
            {
                Response.Write("<script>alert('Invalid Password')</script>");
                txtCPass.Focus();
                return false;
            }
            else if (txtName.Text == "")
            {
                Response.Write("<script>alert('Invalid Name')</script>");
                txtName.Focus();
                return false;
            }
            else if (txtEmail.Text == "")
            {
                Response.Write("<script>alert('Invalid Email')</script>");
                txtEmail.Focus();
                return false;
            }
            else if (btnGender.SelectedItem.Text == "")
            {
                Response.Write("<script>alert('Please Select The Gender')</script>");
                btnGender.Focus();
                return false;
            }

            return true;
        }

        private void clr()
        {
            this.btnGender.SelectedIndex = -1;
            this.txtName.Text = String.Empty;
            this.txtEmail.Text = String.Empty; 
            this.txtUname.Text = String.Empty;
        }
    }
}