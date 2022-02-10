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
    public partial class CourseAssignToTrainee : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (con = new SqlConnection(cs))
                {
                    cmd = new SqlCommand("SELECT * FROM CourseDetails", con);
                    con.Open();
                    ddlCourse.DataSource = cmd.ExecuteReader();
                    ddlCourse.DataBind();
                }
            }
            
        }
        protected void grdTraineeCourseAssign_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtSelectedId.Text = grdTraineeCourseAssign.SelectedRow.Cells[1].Text;
        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            using (con = new SqlConnection(cs))
            {
                cmd = new SqlCommand("UPDATE Trainees SET CourseID = @courseId, CourseName = @courseName, TSPID = @tspId, TSPName = @tspName WHERE TraineeID = @traineeID", con);
                cmd.Parameters.AddWithValue("traineeId", Convert.ToInt32(txtSelectedId.Text));
                cmd.Parameters.AddWithValue("courseId", ddlCourse.SelectedItem.Value);
                cmd.Parameters.AddWithValue("courseName", ddlCourse.SelectedItem.Text);
                cmd.Parameters.AddWithValue("tspId", ddlTsp.SelectedItem.Value);
                cmd.Parameters.AddWithValue("tspName", ddlTsp.SelectedItem.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                lblAssigned.Text = "Course Assigned :)";
            }
            grdTraineeCourseAssign.DataBind();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {

            //There is a bug! Everytime I Select a different value the dropdownvalues just adds up!!
            //Solved! Second DropDownList's attribute AppendDataBoundItems was "true" which was needed to be false
            using (con = new SqlConnection(cs))
            {
                cmd = new SqlCommand("SELECT TSPID, TSPName FROM TSPs WHERE CourseID = @courseId", con);
                cmd.Parameters.AddWithValue("courseId", ddlCourse.SelectedItem.Value);
                con.Open();      
                ddlTsp.DataSource = cmd.ExecuteReader();
                ddlTsp.Enabled = true;
                ddlTsp.DataBind();
            }
        }

        protected void ddlCourseFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (con = new SqlConnection(cs))
            {
                cmd = new SqlCommand("SELECT * FROM Trainees WHERE CourseName = @courseName", con);
                cmd.Parameters.AddWithValue("courseName", ddlCourseFilter.SelectedItem.Text);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                lstViewTrainee.DataSource = dt;
                lstViewTrainee.DataBind();
            }
        }
    }
}