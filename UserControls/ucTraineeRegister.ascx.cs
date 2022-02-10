using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace ASPFinalProject_Mehedee.UserControls
{
    public partial class ucTraineeRegister : System.Web.UI.UserControl
    {
        string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtTraineeUserName.Text = "";
                txtTraineePass.Text = "";
            }
                
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string imgPath = Path.GetFileName(uplTraineeImage.PostedFile.FileName);
            uplTraineeImage.SaveAs(Server.MapPath("~/Images/Trainees/" + imgPath));
            using (con = new SqlConnection(cs))
            {
                //cmd.CommandText = ";
                //cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //cmd.Connection = con;
                cmd = new SqlCommand("EXEC sp_TraineeInsertLoginInsert 1, @traineeName,@dob,@gender,@traineeContact," +
                    "@traineeEmail,@university,@cfScore,@preferredCourses,@motivation,@traineeImage,@userName,@password", con);
                cmd.Parameters.AddWithValue("traineeName", txtTraineeName.Text);
                cmd.Parameters.AddWithValue("dob", txtDOB.Text);
                cmd.Parameters.AddWithValue("gender", rblGender.SelectedValue);
                cmd.Parameters.AddWithValue("traineeContact", txtPhone.Text);
                cmd.Parameters.AddWithValue("traineeEmail", txtTraineeEmail.Text);
                cmd.Parameters.AddWithValue("university", ddlUniversity.SelectedValue);
                cmd.Parameters.AddWithValue("cfScore", Convert.ToInt32(txtCfScore.Text));
                //List<string> course = new List<string>();
                //for (int i = 0; i < cblPreferredCourse.Items.Count; i++)
                //{
                //    if (this.cblPreferredCourse.Items[i].Selected)
                //    {
                //        course.Add(cblPreferredCourse.Items[i].Value + ",");
                //    }
                //}
                cmd.Parameters.AddWithValue("preferredCourses", cblPreferredCourse.SelectedValue);
                cmd.Parameters.AddWithValue("motivation", txtMotivation.Text);
                cmd.Parameters.AddWithValue("traineeImage", "~/Images/Trainees/" + imgPath);
                cmd.Parameters.AddWithValue("userName", txtTraineeUserName.Text);
                cmd.Parameters.AddWithValue("password", txtTraineePass.Text);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            lblMessage.Text = "You've registered Successfully. Please Login to see the Result";
            ClearData();
        }

        public void ClearData()
        {
            txtTraineeName.Text = "";
            txtDOB.Text = "";
            rblGender.SelectedValue = "";
            txtPhone.Text = "";
            txtTraineeEmail.Text = "";
            txtTraineeConfirmEmail.Text = "";
            ddlUniversity.SelectedValue = "";
            txtCfScore.Text = "";
            cblPreferredCourse.SelectedValue = "";
            txtMotivation.Text = "";
            txtTraineeUserName.Text = "";
            txtTraineePass.Text = "";



        }

        //protected void txtTraineeUserName_TextChanged(object sender, EventArgs e)
        //{
        //    using (con = new SqlConnection(cs))
        //    {
        //        cmd = new SqlCommand("SELECT UserName FROM LoginInfo", con);
        //        con.Open();
        //        SqlDataReader reader = cmd.ExecuteReader();
        //        if (reader.Read())
        //        {
        //            if (reader["UserName"] != DBNull.Value)
        //            {
        //                lblUserName.Text = "Username is taken";
        //                lblUserName.ForeColor = System.Drawing.Color.Red;
        //            }
                                       
        //        }
        //        else
        //        {
        //            lblUserName.Text = "Username is Avaliable";
        //            lblUserName.ForeColor = System.Drawing.Color.Green;
        //        }
        //    }
        //}
    }
}