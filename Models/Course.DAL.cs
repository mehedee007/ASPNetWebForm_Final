using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.ComponentModel;

namespace ASPFinalProject_Mehedee.Models
{
    public class Course
    {
        public int CourseID { get; set; }
        public string CourseName { get; set; }
        public string Duration { get; set; }
        public int SeatAvailability { get; set; }
    }
    [DataObject(true)]
    public class Course_DAC
    {
        static string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        static SqlConnection con;
        static SqlCommand cmd;
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Course> GetCourses()
        {
            List<Course> courses = new List<Course>();
            using (con = new SqlConnection(cs))
            {
                cmd = new SqlCommand("SELECT * FROM CourseDetails", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Course course = new Course();
                    course.CourseID = Convert.ToInt32(reader["CourseID"]);
                    course.CourseName = reader["CourseName"].ToString();
                    course.Duration = reader["Duration"].ToString();
                    course.SeatAvailability = Convert.ToInt32(reader["SeatAvailability"]);
                    courses.Add(course);
                }
                return courses;
            }
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static int CourseAdd(string courseName, string duration, int seatAvailability)
        {
            using(con = new SqlConnection(cs))
            {
                cmd = new SqlCommand("INSERT INTO CourseDetails Values (@courseName, @duration, @seat)", con);
                cmd.Parameters.AddWithValue("courseName", courseName);
                cmd.Parameters.AddWithValue("duration", duration);
                cmd.Parameters.AddWithValue("seat", seatAvailability);
                con.Open();
                return cmd.ExecuteNonQuery();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public static int CourseUpdate(int courseId,string courseName, string duration, int seatAvailability)
        {
            using (con = new SqlConnection(cs))
            {
                cmd = new SqlCommand("UPDATE CourseDetails SET CourseName = @courseName, Duration = @duration, SeatAvailability = @seat WHERE CourseID =@courseId", con);
                SqlParameter paramCourseId = new SqlParameter("courseId", courseId);
                cmd.Parameters.Add(paramCourseId);
                SqlParameter paramName = new SqlParameter("courseName", courseName);
                cmd.Parameters.Add(paramName);
                SqlParameter paramDuration = new SqlParameter("duration", duration);
                cmd.Parameters.Add(paramDuration);
                SqlParameter paramSeat = new SqlParameter("seat", seatAvailability);
                cmd.Parameters.Add(paramSeat);
                
                con.Open();
                return cmd.ExecuteNonQuery();

            }
        }
        [DataObjectMethod(DataObjectMethodType.Delete)]
        public static int DeleteData(int courseId)
        {
            using (con = new SqlConnection(cs))
            {
                cmd = new SqlCommand("DELETE FROM CourseDetails WHERE CourseID = @id", con);
                cmd.Parameters.AddWithValue("id", courseId);
                con.Open();
                return cmd.ExecuteNonQuery();
            }
        }
    }
}