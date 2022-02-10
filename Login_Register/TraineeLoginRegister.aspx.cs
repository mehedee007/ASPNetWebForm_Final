using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace ASPFinalProject_Mehedee.Login_Register
{
    public partial class TraineeLoginRegister : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    Session["userName"] = null;  
            //}
            //else
            //{
                
            //}
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (con = new SqlConnection(cs))
            {
                cmd = new SqlCommand("SELECT * FROM LoginInfo WHERE UserName = @userName AND Pass = @pass", con);
                cmd.Parameters.AddWithValue("userName", txtLoginUserName.Text);
                cmd.Parameters.AddWithValue("pass", txtLoginPassword.Text);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                
                if (reader.HasRows)
                {
                    reader.Read();
                    Session["userName"] = txtLoginUserName.Text;
                    //lblRespone.Text = Session["userName"].ToString();
                    Response.RedirectPermanent("details");
                }
                else
                {
                    lblResponse.Text = "Invalid User Name or Password";
                }
                
            }
        }

        protected void btnGoToRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("register");
        }
    }
}