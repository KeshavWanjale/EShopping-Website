using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace EShoppingWebsite
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Checking if the password is loaded in COOKIES  or not
                if(Request.Cookies["UNAME"] != null && Request.Cookies["UEAMIL"] != null && Request.Cookies["UPWD"] != null)
                {
                    txtUname.Text = Request.Cookies["UNAME"].Value;
                    txtEmail.Text = Request.Cookies["UEAMIL"].Value;
                    txtPass.Text = Request.Cookies["UPWD"].Value;
                }
            }

        }

        protected void txtlogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EshoppingDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM tblUsers WHERE Username=@username and Email=@email and Password=@pwd", con);
                cmd.Parameters.AddWithValue("@username",txtUname.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@pwd", txtPass.Text);

                //cmd.ExecuteNonQuery();//will not use this method as we are not inserting in table
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if(dt.Rows.Count != 0)
                {
                    // creating session veriables
                    Session["USERID"] = dt.Rows[0]["Uid"].ToString();
                    Session["USEREMAIL"] = dt.Rows[0]["Email"].ToString();

                    Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["UPWD"].Expires = DateTime.Now.AddDays(-1);
                    //saving the passwords using cookies
                    if (CheckBox1.Checked)
                    {
                        Response.Cookies["UNAME"].Value = txtUname.Text;
                        Response.Cookies["UEMAIL"].Value = txtEmail.Text;
                        Response.Cookies["UPWD"].Value=txtPass.Text;

                        // Setting Time Duration
                        Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(10);
                        Response.Cookies["UEMAIL"].Expires = DateTime.Now.AddDays(10);
                        Response.Cookies["UPWD"].Expires =DateTime.Now.AddDays(10);
                    }
                    else
                    {
                        Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["UEMAIL"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["UPWD"].Expires = DateTime.Now.AddDays(-1);
                    }

                    //Session["Username"] = txtUname.Text;//to welcome user on userhome page
                    //Response.Redirect("~/UserHome.aspx");

                    String UType;
                    UType= dt.Rows[0][6].ToString().Trim();// getting user type from database 

                    if (UType == "User")
                    {
                     

                        Session["Username"] = txtUname.Text;
                        Session["USEREMAIL"] = dt.Rows[0]["Email"].ToString();
                        Session["getFullName"] = dt.Rows[0]["name"].ToString();
                        Session["LoginType"] = "User";
                        Response.Redirect("~/UserHome.aspx");
                        if (Request.QueryString["rurl"] != null)
                        {
                            if (Request.QueryString["rurl"] == "cart")
                            {
                                Response.Redirect("Cart.aspx");
                            }

                            if (Request.QueryString["rurl"] == "PID")
                            {
                                string myPID = Session["ReturnPID"].ToString();
                                Response.Redirect("ProductView.aspx?PID=" + myPID + "");
                            }
                        }
                        else
                        {
                            Response.Redirect("~/UserHome.aspx?UserLogin=YES");
                        }
                    }
                    if(UType == "Admin")
                    {
                        Session["Username"] = txtUname.Text;
                        Response.Redirect("~/AdminHome.aspx");
                    }
                    
                }
                else
                {
                    lblMsg.Text = "Invalid Username and Password";
                }

                //Response.Write("<script>alert('Login Done Successfully')</script>");
                //lblMsg.Text = "Registration Done Successfully";
                //lblMsg.ForeColor = System.Drawing.Color.Green;
                clr();
                con.Close();
            }
        }

        private void clr()
        {
            txtUname.Text = String.Empty;
            txtEmail.Text = String.Empty;
        }
    }
}