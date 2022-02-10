<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TraineeDetails.aspx.cs" Inherits="ASPFinalProject_Mehedee.Login_Register.TraineeDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style2">
                        <h2><strong>Trainee Details</strong></h2>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td rowspan="11">
                        <asp:FormView ID="fvTraineeDetails" runat="server" DataKeyNames="TraineeID" DataSourceID="SqlDSTraineeDetails" CellPadding="4" ForeColor="#333333" Height="398px" ViewStateMode="Disabled" Width="356px">
                            <EditItemTemplate>
                                TraineeID:
                                <asp:Label ID="TraineeIDLabel1" runat="server" Text='<%# Eval("TraineeID") %>' />
                                <br />
                                TraineeName:
                                <asp:TextBox ID="TraineeNameTextBox" runat="server" Text='<%# Bind("TraineeName") %>' />
                                <br />
                                DOB:
                                <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' />
                                <br />
                                Gender:
                                <asp:TextBox ID="GenderTextBox" runat="server" Text='<%# Bind("Gender") %>' />
                                <br />
                                TraineeContact:
                                <asp:TextBox ID="TraineeContactTextBox" runat="server" Text='<%# Bind("TraineeContact") %>' />
                                <br />
                                Email:
                                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                                <br />
                                University:
                                <asp:TextBox ID="UniversityTextBox" runat="server" Text='<%# Bind("University") %>' />
                                <br />
                                CFScore:
                                <asp:TextBox ID="CFScoreTextBox" runat="server" Text='<%# Bind("CFScore") %>' />
                                <br />
                                PreferredCourses:
                                <asp:TextBox ID="PreferredCoursesTextBox" runat="server" Text='<%# Bind("PreferredCourses") %>' />
                                <br />
                                MotivationBehindTheChoice:
                                <asp:TextBox ID="MotivationBehindTheChoiceTextBox" runat="server" Text='<%# Bind("MotivationBehindTheChoice") %>' />
                                <br />
                                TraineeImage:
                                <asp:TextBox ID="TraineeImageTextBox" runat="server" Text='<%# Bind("TraineeImage") %>' />
                                <br />
                                CourseID:
                                <asp:TextBox ID="CourseIDTextBox" runat="server" Text='<%# Bind("CourseID") %>' />
                                <br />
                                CourseName:
                                <asp:TextBox ID="CourseNameTextBox" runat="server" Text='<%# Bind("CourseName") %>' />
                                <br />
                                TSPID:
                                <asp:TextBox ID="TSPIDTextBox" runat="server" Text='<%# Bind("TSPID") %>' />
                                <br />
                                TspName:
                                <asp:TextBox ID="TspNameTextBox" runat="server" Text='<%# Bind("TspName") %>' />
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <InsertItemTemplate>
                                TraineeName:
                                <asp:TextBox ID="TraineeNameTextBox" runat="server" Text='<%# Bind("TraineeName") %>' />
                                <br />
                                DOB:
                                <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' />
                                <br />
                                Gender:
                                <asp:TextBox ID="GenderTextBox" runat="server" Text='<%# Bind("Gender") %>' />
                                <br />
                                TraineeContact:
                                <asp:TextBox ID="TraineeContactTextBox" runat="server" Text='<%# Bind("TraineeContact") %>' />
                                <br />
                                Email:
                                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                                <br />
                                University:
                                <asp:TextBox ID="UniversityTextBox" runat="server" Text='<%# Bind("University") %>' />
                                <br />
                                CFScore:
                                <asp:TextBox ID="CFScoreTextBox" runat="server" Text='<%# Bind("CFScore") %>' />
                                <br />
                                PreferredCourses:
                                <asp:TextBox ID="PreferredCoursesTextBox" runat="server" Text='<%# Bind("PreferredCourses") %>' />
                                <br />
                                MotivationBehindTheChoice:
                                <asp:TextBox ID="MotivationBehindTheChoiceTextBox" runat="server" Text='<%# Bind("MotivationBehindTheChoice") %>' />
                                <br />
                                TraineeImage:
                                <asp:TextBox ID="TraineeImageTextBox" runat="server" Text='<%# Bind("TraineeImage") %>' />
                                <br />
                                CourseID:
                                <asp:TextBox ID="CourseIDTextBox" runat="server" Text='<%# Bind("CourseID") %>' />
                                <br />
                                CourseName:
                                <asp:TextBox ID="CourseNameTextBox" runat="server" Text='<%# Bind("CourseName") %>' />
                                <br />
                                TSPID:
                                <asp:TextBox ID="TSPIDTextBox" runat="server" Text='<%# Bind("TSPID") %>' />
                                <br />
                                TspName:
                                <asp:TextBox ID="TspNameTextBox" runat="server" Text='<%# Bind("TspName") %>' />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                TraineeID:
                                <asp:Label ID="TraineeIDLabel" runat="server" Text='<%# Eval("TraineeID") %>' />
                                <br />
                                TraineeName:
                                <asp:Label ID="TraineeNameLabel" runat="server" Text='<%# Bind("TraineeName") %>' />
                                <br />
                                DOB:
                                <asp:Label ID="DOBLabel" runat="server" Text='<%# Bind("DOB") %>' />
                                <br />
                                Gender:
                                <asp:Label ID="GenderLabel" runat="server" Text='<%# Bind("Gender") %>' />
                                <br />
                                TraineeContact:
                                <asp:Label ID="TraineeContactLabel" runat="server" Text='<%# Bind("TraineeContact") %>' />
                                <br />
                                Email:
                                <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                                <br />
                                University:
                                <asp:Label ID="UniversityLabel" runat="server" Text='<%# Bind("University") %>' />
                                <br />
                                CFScore:
                                <asp:Label ID="CFScoreLabel" runat="server" Text='<%# Bind("CFScore") %>' />
                                <br />
                                PreferredCourses:
                                <asp:Label ID="PreferredCoursesLabel" runat="server" Text='<%# Bind("PreferredCourses") %>' />
                                <br />
                                MotivationBehindTheChoice:
                                <asp:Label ID="MotivationBehindTheChoiceLabel" runat="server" Text='<%# Bind("MotivationBehindTheChoice") %>' />
                                <br />
                                <%--TraineeImage:
                                <asp:Label ID="TraineeImageLabel" runat="server" Text='<%# Bind("TraineeImage") %>' />--%>
                                <asp:Image ID="imgField" runat="server" ImageUrl='<%#Bind("TraineeImage") %>' Width="120" Height="80"/>
                                <br />
                                CourseID:
                                <asp:Label ID="CourseIDLabel" runat="server" Text='<%# Bind("CourseID") %>' />
                                <br />
                                CourseName:
                                <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Bind("CourseName") %>' />
                                <br />
                                TSPID:
                                <asp:Label ID="TSPIDLabel" runat="server" Text='<%# Bind("TSPID") %>' />
                                <br />
                                TspName:
                                <asp:Label ID="TspNameLabel" runat="server" Text='<%# Bind("TspName") %>' />
                                <br />

                            </ItemTemplate>
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDSTraineeDetails" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
                            SelectCommand="SELECT * FROM Trainees tr
                                                JOIN LoginInfo li
                                                ON tr.TraineeID = li.TraineeID
                                                WHERE li.UserName = @userName">
                            <SelectParameters>
                                <asp:SessionParameter Name="userName" SessionField="userName" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="btnLogout" runat="server" Font-Bold="True" ForeColor="Red" Height="48px" OnClick="btnLogout_Click" Text="LOGOUT" Width="100px" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
