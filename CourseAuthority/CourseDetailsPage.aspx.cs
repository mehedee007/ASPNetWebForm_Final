using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPFinalProject_Mehedee.CourseAuthority
{
    public partial class CourseDetailsPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            ObjectDSCourse.InsertParameters["CourseName"].DefaultValue = ((TextBox)grdCourse.FooterRow.FindControl("txtCourseName")).Text;
            ObjectDSCourse.InsertParameters["Duration"].DefaultValue = ((TextBox)grdCourse.FooterRow.FindControl("txtDuration")).Text;
            ObjectDSCourse.InsertParameters["SeatAvailability"].DefaultValue = ((TextBox)grdCourse.FooterRow.FindControl("txtSeat")).Text;
            ObjectDSCourse.Insert();
        }
    }
}