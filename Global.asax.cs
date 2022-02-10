using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using Microsoft.AspNet.FriendlyUrls;

namespace ASPFinalProject_Mehedee
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            //RouteConfig.RegisterRoutes(RouteTable.Routes);
            //BundleConfig.RegisterBundles(BundleTable.Bundles);
            RouteTable.Routes.EnableFriendlyUrls();
            CustomRoutes(RouteTable.Routes);
        }

        public void CustomRoutes(RouteCollection routes)
        {
            routes.MapPageRoute(
                routeName: "Trainee-Login-Register",
                routeUrl: "trainee/login",
                physicalFile: "~/Login_Register/TraineeLoginRegister.aspx"
                );
            routes.MapPageRoute(
                routeName: "Trainee-Details",
                routeUrl: "trainee/details",
                physicalFile: "~/Login_Register/TraineeDetails.aspx"
                );
            routes.MapPageRoute(
                routeName: "Trainee-Register",
                routeUrl: "trainee/register",
                physicalFile: "~/Login_Register/TraineeRegister.aspx"
                );

            //Admin Routes
            routes.MapPageRoute(
                routeName: "Course-CourseAdd",
                routeUrl: "admin/{0}/course/add",
                physicalFile: "~/CourseAuthority/CourseDetailsPage.aspx"
                );
            routes.MapPageRoute(
                routeName: "Admin-TrainerRegister",
                routeUrl: "admin/course/trainer",
                physicalFile: "~/CourseAuthority/TrainerRegistrationPage.aspx"
                );
            routes.MapPageRoute(
                routeName: "Admin-TspReg",
                routeUrl: "admin/tsp/reg",
                physicalFile: "~/CourseAuthority/TspRegisterPage.aspx"
                );
            routes.MapPageRoute(
                routeName: "Admin-TraineeCourse",
                routeUrl: "admin/trainee/course",
                physicalFile: "~/CourseAuthority/CourseAssignToTrainee.aspx"
                );

        }
    }
}