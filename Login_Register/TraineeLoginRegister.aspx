<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TraineeLoginRegister.aspx.cs" Inherits="ASPFinalProject_Mehedee.Login_Register.TraineeLoginRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style type="text/css">
    span{
        text-align:center;
    }
    .auto-style1 {
        font-size: large;
    }
</style>
    <h1>Trainee Login/Register</h1>
    <asp:Panel runat="server" ID="pnlTraineeLogin" BackColor="#00CC00" BorderColor="#003366" CssClass="panel-primary">
        <asp:Label ID="lblLUserName" runat="server" Font-Bold="True" Font-Size="Large" Text="UserName : "></asp:Label>
        <label for="txtLoginUserName">: </label>
        <asp:TextBox ID="txtLoginUserName" runat="server"></asp:TextBox><br />
        <asp:Label ID="lblLPass" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="Large" Text="Password : "></asp:Label>
        <label for="txtLoginPassword">: </label>
        <asp:TextBox ID="txtLoginPassword" runat="server" TextMode="Password"></asp:TextBox><br />
        <asp:Button ID="btnLogin" runat="server" BackColor="Blue" Text="LOGIN" Font-Bold="true" ForeColor="White" OnClick="btnLogin_Click"/>
        <asp:Label ID="lblResponse" runat="server"></asp:Label>
        <p class="auto-style1">
            If You&#39;ve not previously registered.
        </p>
        <asp:Button ID="btnGoToRegister" runat="server" Text="Register Here" OnClick="btnGoToRegister_Click" CssClass="btn-primary" Font-Bold="True"/>
    </asp:Panel>
</asp:Content>
