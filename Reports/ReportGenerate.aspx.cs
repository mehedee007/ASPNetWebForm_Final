using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
namespace ASPFinalProject_Mehedee.Reports
{
    public partial class ReportGenerate : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReport_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(cs);
            cmd = new SqlCommand("Select * From CourseDetails", con);
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            //test.DataSource = ds;
            //test.DataBind();
            ReportDocument rpt = new ReportDocument();
            rpt.Load(Server.MapPath("CrystalReport1.rpt"));

            rpt.SetDataSource(ds.Tables["Table"]);
            CrystalReportViewer1.ReportSource = rpt;
            CrystalReportViewer1.RefreshReport();
            //ReportDocument reportDocument = new ReportDocument();
            ////reportDocument.Load(Server.MapPath("CrystalReport1.rpt"));
            //////reportDocument.Load(Server.MapPath("AdmitReport.rpt"));
            ////reportDocument.SetDataSource(ds.Tables["tables"]);
            ////CrystalReportViewer1.ReportSource = reportDocument;

            rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "CourseDetails");
        }
    }
}