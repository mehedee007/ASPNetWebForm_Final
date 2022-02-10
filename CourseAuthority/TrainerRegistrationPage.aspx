<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TrainerRegistrationPage.aspx.cs" Inherits="ASPFinalProject_Mehedee.CourseAuthority.TrainerRegistrationPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <br />
        <table style="width: 100%">
            <tr>
                <td colspan="4" style="font-size: x-large; text-align: center">Trainer Register</td>
                <td colspan="4" style="font-size: x-large; text-align: center">Registered Trainers</td>
            </tr>
            <tr>
                <td style="text-align: right; width: 185px">Trainer Name : </td>
                <td>
                    <asp:TextBox ID="txtTrainerName" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td colspan="2" rowspan="9" style="margin:auto">
                    <asp:DetailsView ID="dvTrainer" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="TrainerID" DataSourceID="SqlDSTrainer" Height="50px" Width="125px">
                        <Fields>
                            <asp:BoundField DataField="TrainerID" HeaderText="TrainerID" InsertVisible="False" ReadOnly="True" SortExpression="TrainerID" />
                            <asp:BoundField DataField="TrainerName" HeaderText="TrainerName" SortExpression="TrainerName" />
                            <asp:BoundField DataField="TrainerContact" HeaderText="TrainerContact" SortExpression="TrainerContact" />
                            <asp:BoundField DataField="TrainerEmail" HeaderText="TrainerEmail" SortExpression="TrainerEmail" />
                            <asp:BoundField DataField="TSPName" HeaderText="TSPName" SortExpression="TSPName" />
                            <asp:BoundField DataField="TSPID" HeaderText="TSPID" SortExpression="TSPID" />
                            <asp:BoundField DataField="AssignedCourse" HeaderText="AssignedCourse" SortExpression="AssignedCourse" />
                        </Fields>
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDSTrainer" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [TrainerList]"></asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right; width: 185px">Contact : </td>
                <td>
                    <asp:TextBox ID="txtContact" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right; width: 185px">Email : </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right; width: 185px">Registered TSP : </td>
                <td>
                    <asp:DropDownList ID="ddlTTsp" AppendDataBoundItems="True" runat="server" AutoPostBack="True" DataTextField="TSPName" DataValueField="TSPID" OnSelectedIndexChanged="ddlTTsp_SelectedIndexChanged" DataSourceID="SqlDSddlTsp">
                        <asp:ListItem Text="Select TSP" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDSddlTsp" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [TSPID], [TSPName] FROM [TSPs]"></asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right; width: 185px">Registered Course : </td>
                <td>
                    <asp:DropDownList ID="ddlTCourse" runat="server" DataTextField="CourseName" DataValueField="CourseID">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right; width: 185px">
                    <asp:Button ID="btnRegister" runat="server" BackColor="Gray" Font-Bold="True" ForeColor="White" Text="Register" OnClick="btnRegister_Click" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 185px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="height: 20px; width: 185px"></td>
                <td style="height: 20px"></td>
                <td style="height: 20px"></td>
                <td style="height: 20px"></td>
                <td style="height: 20px"></td>
                <td style="height: 20px"></td>
            </tr>
            <tr>
                <td style="width: 185px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 185px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 185px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>

</asp:Content>
