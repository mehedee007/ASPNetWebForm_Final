using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
namespace ASPFinalProject_Mehedee.CourseAuthority
{
    public partial class TrainerRegistrationPage : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    using (con = new SqlConnection(cs))
            //    {
            //        cmd = new SqlCommand("SELECT TSPID, TSPName FROM TSPs", con);
            //        con.Open();
            //        ddlTTsp.DataSource = cmd.ExecuteReader();
            //        ddlTTsp.DataBind();
            //    }
            //}
        }

        protected void ddlTTsp_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (con = new SqlConnection(cs))
            {
                cmd = new SqlCommand("SELECT CourseID, CourseName FROM TSPs WHERE TSPID = @tspId", con);
                cmd.Parameters.AddWithValue("tspId", ddlTTsp.SelectedItem.Value);
                con.Open();
                ddlTCourse.DataSource = cmd.ExecuteReader();
                ddlTCourse.DataBind();
            }
               
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            using (con = new SqlConnection(cs))
            {
                cmd = new SqlCommand("INSERT INTO TrainerList VALUES (@name, @contact, @email,@tspName,@tspId,@courseName)", con);
                cmd.Parameters.AddWithValue("name", txtTrainerName.Text);
                cmd.Parameters.AddWithValue("contact", txtContact.Text);
                cmd.Parameters.AddWithValue("email", txtEmail.Text);
                cmd.Parameters.AddWithValue("tspName", ddlTTsp.SelectedItem.Text);
                cmd.Parameters.AddWithValue("tspId", ddlTTsp.SelectedItem.Value);
                cmd.Parameters.AddWithValue("courseName", ddlTCourse.SelectedItem.Text);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            dvTrainer.DataBind();
        }
    }
}