<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TspRegisterPage.aspx.cs" Inherits="ASPFinalProject_Mehedee.CourseAuthority.TspRegisterPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table style="width: 100%">
    <tr>
        <td style="width: 136px">&nbsp;</td>
        <td style="width: 90px">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td colspan="5" style="height: 20px; text-align: center">
            <h2>TSP Information</h2>
        </td>
        <td style="height: 20px"></td>
        <td style="height: 20px"></td>
        <td style="height: 20px"></td>
    </tr>
    <tr>
        <td style="height: 20px; text-align: left; width: 136px">TSP Name: </td>
        <td style="height: 20px; width: 90px;">
            <asp:TextBox ID="txtTspName" runat="server"></asp:TextBox>
        </td>
        <td style="height: 20px"></td>
        <td style="height: 20px"></td>
        <td style="height: 20px"></td>
        <td style="height: 20px"></td>
        <td style="height: 20px"></td>
        <td style="height: 20px"></td>
    </tr>
    <tr>
        <td style="text-align: left; width: 136px; height: 22px;">Location : </td>
        <td style="height: 22px; width: 90px">
            <asp:DropDownList ID="ddlLocation" runat="server" Height="16px" Width="137px">
                <asp:ListItem>Select City</asp:ListItem>
                <asp:ListItem>Dhaka</asp:ListItem>
                <asp:ListItem>Chittagong</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td colspan="5" style="height: 22px; text-align: center">
            <h3 style="text-decoration: underline"><strong>Registered TSP List</strong></h3>
        </td>
        <td style="height: 22px"></td>
    </tr>
    <tr>
        <td style="height: 20px; text-align: left; width: 136px">Manager : </td>
        <td style="width: 90px">
            <asp:TextBox ID="txtManager" runat="server"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align: left; width: 136px">Contact : </td>
        <td style="height: 20px; width: 90px;">
            <asp:TextBox ID="txtContact" runat="server" TextMode="Phone"></asp:TextBox>
        </td>
        <td colspan="5" rowspan="6">
            <asp:GridView ID="grdTsp" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="TSPID" DataSourceID="SqlDSTspDetails">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="TSPID" HeaderText="TSPID" InsertVisible="False" ReadOnly="True" SortExpression="TSPID" />
                    <asp:BoundField DataField="TSPName" HeaderText="TSPName" SortExpression="TSPName" />
                    <asp:BoundField DataField="TSPLocation" HeaderText="TSPLocation" SortExpression="TSPLocation" />
                    <asp:BoundField DataField="Manager" HeaderText="Manager" SortExpression="Manager" />
                    <asp:BoundField DataField="ContactNumber" HeaderText="ContactNumber" SortExpression="ContactNumber" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="CourseID" HeaderText="CourseID" SortExpression="CourseID" />
                    <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                    <asp:BoundField DataField="NumberOfSeats" HeaderText="NumberOfSeats" SortExpression="NumberOfSeats" />
                    <asp:BoundField DataField="SessionStartDate" HeaderText="SessionStartDate" SortExpression="SessionStartDate" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDSTspDetails" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [TSPs]"></asp:SqlDataSource>
        </td>
        <td style="height: 20px"></td>
    </tr>
    <tr>
        <td style="text-align: left; width: 136px">Email&nbsp; </td>
        <td style="width: 90px">
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align: left; width: 136px">Assigned Course : </td>
        <td style="width: 90px">
            <asp:DropDownList ID="ddlCourse" runat="server" AutoPostBack="True" DataSourceID="SqlDSCourseforTsp" DataTextField="CourseName" DataValueField="CourseID" Height="16px" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged" Width="137px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDSCourseforTsp" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [CourseName], [CourseID] FROM [CourseDetails]"></asp:SqlDataSource>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align: left; width: 136px">&nbsp;</td>
        <td style="width: 90px">
            <asp:Label ID="lblSeats" runat="server"></asp:Label>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align: left; width: 136px; height: 22px;">Available Seats : </td>
        <td style="height: 22px; width: 90px">
            <asp:TextBox ID="txtNumberofSeats" runat="server" TextMode="Number"></asp:TextBox>
        </td>
        <td style="height: 22px"></td>
    </tr>
    <tr>
        <td style="text-align: left; width: 136px">Session Start Date : </td>
        <td style="width: 90px">
            <asp:Calendar ID="calSessionStart" runat="server"></asp:Calendar>
        </td>
        <td></td>
    </tr>
    <tr>
        <td style="text-align: left; width: 136px">
            &nbsp;</td>
        <td style="width: 90px">
            <asp:Button ID="btnRegister" runat="server" Text="Register" BackColor="LightGreen" Font-Bold="True" OnClick="btnRegister_Click" />
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 136px; text-align: left;">&nbsp;</td>
        <td style="width: 90px">
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 136px">&nbsp;</td>
        <td style="width: 90px">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>

</asp:Content>
