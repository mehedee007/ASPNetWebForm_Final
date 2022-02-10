using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace ASPFinalProject_Mehedee.CourseAuthority
{
    public partial class TspRegisterPage : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            using (con = new SqlConnection(cs))
            {
                cmd = new SqlCommand("INSERT INTO TSPs VALUES (@tspName,@tsplocation,@manager,@contact,@email,@courseid,@courseName,@numberofSeats, @sessionStart)", con);
                cmd.Parameters.AddWithValue("tspName", txtTspName.Text);
                cmd.Parameters.AddWithValue("tsplocation", ddlLocation.SelectedValue);
                cmd.Parameters.AddWithValue("manager", txtManager.Text);
                cmd.Parameters.AddWithValue("contact", txtContact.Text);
                cmd.Parameters.AddWithValue("email", txtEmail.Text);
                cmd.Parameters.AddWithValue("courseid", ddlCourse.SelectedValue);
                cmd.Parameters.AddWithValue("courseName", ddlCourse.SelectedItem.Text);
                cmd.Parameters.AddWithValue("numberofSeats", Convert.ToInt32(txtNumberofSeats.Text));
                cmd.Parameters.AddWithValue("sessionStart", calSessionStart.SelectedDate.ToShortDateString());

                con.Open();
                cmd.ExecuteNonQuery();
                //con.Open();
                //cmd = con.CreateCommand();
                //SqlTransaction transaction = con.BeginTransaction();
                //cmd.Transaction = transaction;
                //try
                //{


                //cmd = new SqlCommand("INSERT INTO TSPs VALUES ('"+txtTspName.Text+"','"+ddlLocation.SelectedValue+"','"+txtManager.Text+"','"+txtContact.Text+"','"+txtEmail.Text+"','"+ddlCourse.SelectedValue+"','"+ddlCourse.Text+"','"+ Convert.ToInt32(txtNumberofSeats.Text) + "', '"+ calSessionStart.SelectedDate.ToShortDateString() + "')", con);
                //cmd.CommandText = "INSERT INTO TSPs VALUES ('" + txtTspName.Text + "','" + ddlLocation.SelectedValue + "','" + txtManager.Text + "','" + txtContact.Text + "','" + txtEmail.Text + "','" + ddlCourse.SelectedValue + "','" + ddlCourse.Text + "','" + Convert.ToInt32(txtNumberofSeats.Text) + "', '" + calSessionStart.SelectedDate.ToShortDateString() + "')";

                //cmd.ExecuteNonQuery();
                //cmd = new SqlCommand("UPDATE CourseDetails SET SeatAvailability = SeatAvailability-'"+Convert.ToInt32(txtNumberofSeats.Text)+"' WHERE CourseID = '"+ddlCourse.SelectedValue+"'", con);
                //cmd.CommandText ="UPDATE CourseDetails SET SeatAvailability = SeatAvailability-'" + Convert.ToInt32(txtNumberofSeats.Text) + "' WHERE CourseID = '" + ddlCourse.SelectedValue + "'";


                //transaction.Commit();


                //}
                //catch
                //{
                //    lblMessage.Text = "Data Save Failed";
                //    transaction.Rollback();
                //}
                ////grdTsp.DataBind();
            }
            lblMessage.Text = "Registraion Successful";
            grdTsp.DataBind();
        }

        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            //using (con = new SqlConnection(cs))
            //{
            //    cmd = new SqlCommand("SELECT SeatAvailability FROM CourseDetails WHERE CourseID = @courseID", con);
            //    cmd.Parameters.AddWithValue("courseID", ddlCourse.SelectedValue);
            //    SqlDataReader reader = cmd.ExecuteReader();
            //    //DataTable dt = new DataTable();
            //    //DataRow dr= dt.NewRow();
            //    //dt.Rows.Add(dr);
            //    //lblSeats.Text = 
                
            //}
        }
    }
}