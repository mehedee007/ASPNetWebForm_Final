<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TraineeRegister.aspx.cs" Inherits="ASPFinalProject_Mehedee.Login_Register.TraineeRegister" %>

<%@ Register Src="~/UserControls/ucTraineeRegister.ascx" TagPrefix="uc1" TagName="ucTraineeRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:ucTraineeRegister runat="server" id="ucTraineeRegister" />
</asp:Content>
