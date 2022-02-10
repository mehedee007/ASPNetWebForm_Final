<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReportGenerate.aspx.cs" Inherits="ASPFinalProject_Mehedee.Reports.ReportGenerate" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="adminNavMenu" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="traineeNav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div>
         <asp:Button ID="btnReport" runat="server" Text="REPORT" OnClick="btnReport_Click" />
    </div>
    <div>
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
    </div>
    <%--<asp:GridView ID="test" runat="server"></asp:GridView>--%>
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
   
</asp:Content>
