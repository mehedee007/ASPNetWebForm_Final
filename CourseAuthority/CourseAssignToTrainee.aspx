<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CourseAssignToTrainee.aspx.cs" Inherits="ASPFinalProject_Mehedee.CourseAuthority.CourseAssignToTrainee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:GridView ID="grdTraineeCourseAssign" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="TraineeID" DataSourceID="SqlDSTraineeCourseAssign" OnSelectedIndexChanged="grdTraineeCourseAssign_SelectedIndexChanged" Width="100%">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="TraineeID" HeaderText="TraineeID" InsertVisible="False" ReadOnly="True" SortExpression="TraineeID" />
            <asp:BoundField DataField="TraineeName" HeaderText="TraineeName" SortExpression="TraineeName" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="TraineeContact" HeaderText="TraineeContact" SortExpression="TraineeContact" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="University" HeaderText="University" SortExpression="University" />
            <asp:BoundField DataField="CFScore" HeaderText="CFScore" SortExpression="CFScore" />
            <asp:BoundField DataField="PreferredCourses" HeaderText="PreferredCourses" SortExpression="PreferredCourses" />
            <asp:BoundField DataField="MotivationBehindTheChoice" HeaderText="MotivationBehindTheChoice" SortExpression="MotivationBehindTheChoice" />
            <asp:ImageField DataImageUrlField="TraineeImage" HeaderText="TraineeImage" ControlStyle-Width="80" ControlStyle-Height="80"/>
            <asp:BoundField DataField="CourseID" HeaderText="CourseID" SortExpression="CourseID" />
            <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
            <asp:BoundField DataField="TSPID" HeaderText="TSPID" SortExpression="TSPID" />
            <asp:BoundField DataField="TspName" HeaderText="TspName" SortExpression="TspName" />
        </Columns>
    </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    &nbsp;<asp:SqlDataSource ID="SqlDSTraineeCourseAssign" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Trainees]"></asp:SqlDataSource>
    <table style="width: 100%">
        <tr>
            <td style="width: 236px">
    <asp:label ID="lblSelectedId" runat="server" Text="Selected Trainee ID : " Font-Bold="true" Font-Italic="true"></asp:label>
    <br />
    
                &nbsp;</td>
            <td>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txtSelectedId" runat="server" ReadOnly="true"></asp:TextBox></td>
                </ContentTemplate>
            </asp:UpdatePanel>    
    
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                     <asp:UpdatePanel runat="server">
                         <ContentTemplate>
                        <asp:Label ID="lblSelectCourse" runat="server" Font-Bold="true">Assign Course</asp:Label>
                        &nbsp;:
                        <asp:DropDownList ID="ddlCourse" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataTextField="CourseName" DataValueField="CourseID" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged">
                            <asp:ListItem Value="0">Select Course</asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:SqlDataSource ID="SqlDSCourseTrainee" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [CourseID], [CourseName] FROM [CourseDetails]"></asp:SqlDataSource>--%>
                        <br />
                        <br />
                        <asp:Label ID="lblSelectTsp" runat="server" Font-Bold="True" Text="Select TSP : "></asp:Label>
                        &nbsp;<asp:DropDownList ID="ddlTsp" runat="server" DataTextField="TSPName" DataValueField="TSPID" AppendDataBoundItems="false">
                            <%--<asp:ListItem Text="Select TSP" Value="NOT ASSIGNED YET"></asp:ListItem>--%>
                        </asp:DropDownList>
                         <br />
                         <asp:Label ID="lblAssigned" runat="server"></asp:Label>
                         <br />
                         <asp:Button ID="btnAssign" runat="server" Font-Bold="True" Text="Assign" OnClick="btnAssign_Click" />
                         <asp:Button ID="btnCancel" runat="server" Font-Bold="True" Text="Cancel" BackColor="Red" OnClick="btnCancel_Click" />
                        
                       </ContentTemplate>
                        <%--<Triggers>
                           <asp:AsyncPostBackTrigger ControlID="grdTraineeCourseAssign" EventName="Click"/>
                        </Triggers>--%>
               </asp:UpdatePanel>
    
                <br />
    
            </td>
            <td rowspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 236px">
                &nbsp;</td>
            <td>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="ddlCourseFilter" AppendDataBoundItems="true" runat="server" AutoPostBack="True" DataSourceID="SqlDSddlTrainee" DataTextField="CourseName" DataValueField="CourseID" OnSelectedIndexChanged="ddlCourseFilter_SelectedIndexChanged">
                            <asp:ListItem Text="Select Course" Value="None"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:ListView ID="lstViewTrainee" runat="server" DataKeyNames="TraineeID">
                            <AlternatingItemTemplate>
                                <li style="background-color: #FFF8DC;">TraineeID:
                            <asp:Label ID="TraineeIDLabel" runat="server" Text='<%# Eval("TraineeID") %>' />
                                    <br />
                                    TraineeName:
                            <asp:Label ID="TraineeNameLabel" runat="server" Text='<%# Eval("TraineeName") %>' />
                                    <br />
                                    DOB:
                            <asp:Label ID="DOBLabel" runat="server" Text='<%# Eval("DOB") %>' />
                                    <br />
                                    Gender:
                            <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' />
                                    <br />
                                    TraineeContact:
                            <asp:Label ID="TraineeContactLabel" runat="server" Text='<%# Eval("TraineeContact") %>' />
                                    <br />
                                    Email:
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                    <br />
                                    University:
                            <asp:Label ID="UniversityLabel" runat="server" Text='<%# Eval("University") %>' />
                                    <br />
                                    CFScore:
                            <asp:Label ID="CFScoreLabel" runat="server" Text='<%# Eval("CFScore") %>' />
                                    <br />
                                    PreferredCourses:
                            <asp:Label ID="PreferredCoursesLabel" runat="server" Text='<%# Eval("PreferredCourses") %>' />
                                    <br />
                                    MotivationBehindTheChoice:
                            <asp:Label ID="MotivationBehindTheChoiceLabel" runat="server" Text='<%# Eval("MotivationBehindTheChoice") %>' />
                                    <br />
                                    TraineeImage:
                            <asp:Label ID="TraineeImageLabel" runat="server" Text='<%# Eval("TraineeImage") %>' />
                                    <br />
                                    CourseID:
                            <asp:Label ID="CourseIDLabel" runat="server" Text='<%# Eval("CourseID") %>' />
                                    <br />
                                    CourseName:
                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                                    <br />
                                    TSPID:
                            <asp:Label ID="TSPIDLabel" runat="server" Text='<%# Eval("TSPID") %>' />
                                    <br />
                                    TspName:
                            <asp:Label ID="TspNameLabel" runat="server" Text='<%# Eval("TspName") %>' />
                                    <br />
                                </li>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <li style="background-color: #008A8C; color: #FFFFFF;">TraineeID:
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
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </li>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                No data was returned.
                            </EmptyDataTemplate>
                            <InsertItemTemplate>
                                <li style="">TraineeName:
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
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </li>
                            </InsertItemTemplate>
                            <ItemSeparatorTemplate>
                                <br />
                            </ItemSeparatorTemplate>
                            <ItemTemplate>
                                <li style="background-color: #DCDCDC; color: #000000;">TraineeID:
                            <asp:Label ID="TraineeIDLabel" runat="server" Text='<%# Eval("TraineeID") %>' />
                                    <br />
                                    TraineeName:
                            <asp:Label ID="TraineeNameLabel" runat="server" Text='<%# Eval("TraineeName") %>' />
                                    <br />
                                    DOB:
                            <asp:Label ID="DOBLabel" runat="server" Text='<%# Eval("DOB") %>' />
                                    <br />
                                    Gender:
                            <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' />
                                    <br />
                                    TraineeContact:
                            <asp:Label ID="TraineeContactLabel" runat="server" Text='<%# Eval("TraineeContact") %>' />
                                    <br />
                                    Email:
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                    <br />
                                    University:
                            <asp:Label ID="UniversityLabel" runat="server" Text='<%# Eval("University") %>' />
                                    <br />
                                    CFScore:
                            <asp:Label ID="CFScoreLabel" runat="server" Text='<%# Eval("CFScore") %>' />
                                    <br />
                                    PreferredCourses:
                            <asp:Label ID="PreferredCoursesLabel" runat="server" Text='<%# Eval("PreferredCourses") %>' />
                                    <br />
                                    MotivationBehindTheChoice:
                            <asp:Label ID="MotivationBehindTheChoiceLabel" runat="server" Text='<%# Eval("MotivationBehindTheChoice") %>' />
                                    <br />
                                    TraineeImage:
                            <asp:Label ID="TraineeImageLabel" runat="server" Text='<%# Eval("TraineeImage") %>' />
                                    <br />
                                    CourseID:
                            <asp:Label ID="CourseIDLabel" runat="server" Text='<%# Eval("CourseID") %>' />
                                    <br />
                                    CourseName:
                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                                    <br />
                                    TSPID:
                            <asp:Label ID="TSPIDLabel" runat="server" Text='<%# Eval("TSPID") %>' />
                                    <br />
                                    TspName:
                            <asp:Label ID="TspNameLabel" runat="server" Text='<%# Eval("TspName") %>' />
                                    <br />
                                </li>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <li runat="server" id="itemPlaceholder" />
                                </ul>
                                <div style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                                </div>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <li style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">TraineeID:
                            <asp:Label ID="TraineeIDLabel" runat="server" Text='<%# Eval("TraineeID") %>' />
                                    <br />
                                    TraineeName:
                            <asp:Label ID="TraineeNameLabel" runat="server" Text='<%# Eval("TraineeName") %>' />
                                    <br />
                                    DOB:
                            <asp:Label ID="DOBLabel" runat="server" Text='<%# Eval("DOB") %>' />
                                    <br />
                                    Gender:
                            <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' />
                                    <br />
                                    TraineeContact:
                            <asp:Label ID="TraineeContactLabel" runat="server" Text='<%# Eval("TraineeContact") %>' />
                                    <br />
                                    Email:
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                    <br />
                                    University:
                            <asp:Label ID="UniversityLabel" runat="server" Text='<%# Eval("University") %>' />
                                    <br />
                                    CFScore:
                            <asp:Label ID="CFScoreLabel" runat="server" Text='<%# Eval("CFScore") %>' />
                                    <br />
                                    PreferredCourses:
                            <asp:Label ID="PreferredCoursesLabel" runat="server" Text='<%# Eval("PreferredCourses") %>' />
                                    <br />
                                    MotivationBehindTheChoice:
                            <asp:Label ID="MotivationBehindTheChoiceLabel" runat="server" Text='<%# Eval("MotivationBehindTheChoice") %>' />
                                    <br />
                                    TraineeImage:
                            <asp:Label ID="TraineeImageLabel" runat="server" Text='<%# Eval("TraineeImage") %>' />
                                    <br />
                                    CourseID:
                            <asp:Label ID="CourseIDLabel" runat="server" Text='<%# Eval("CourseID") %>' />
                                    <br />
                                    CourseName:
                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                                    <br />
                                    TSPID:
                            <asp:Label ID="TSPIDLabel" runat="server" Text='<%# Eval("TSPID") %>' />
                                    <br />
                                    TspName:
                            <asp:Label ID="TspNameLabel" runat="server" Text='<%# Eval("TspName") %>' />
                                    <br />
                                </li>
                            </SelectedItemTemplate>
                        </asp:ListView>
                    </ContentTemplate>
                </asp:UpdatePanel>
               
                <asp:SqlDataSource ID="SqlDSddlTrainee" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT DISTINCT [CourseID], [CourseName] FROM [Trainees]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="height: 18px; width: 236px;">
                &nbsp;</td>
            <td style="height: 18px">
                &nbsp;</td>
            <td style="height: 18px"></td>
        </tr>
        <tr>
            <td colspan="2" rowspan="11">
                <%--<asp:ListView ID="lstViewTrainee" runat="server" DataKeyNames="TraineeID">
                    <AlternatingItemTemplate>
                        <li style="background-color: #FFF8DC;">TraineeID:
                            <asp:Label ID="TraineeIDLabel" runat="server" Text='<%# Eval("TraineeID") %>' />
                            <br />
                            TraineeName:
                            <asp:Label ID="TraineeNameLabel" runat="server" Text='<%# Eval("TraineeName") %>' />
                            <br />
                            DOB:
                            <asp:Label ID="DOBLabel" runat="server" Text='<%# Eval("DOB") %>' />
                            <br />
                            Gender:
                            <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' />
                            <br />
                            TraineeContact:
                            <asp:Label ID="TraineeContactLabel" runat="server" Text='<%# Eval("TraineeContact") %>' />
                            <br />
                            Email:
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                            <br />
                            University:
                            <asp:Label ID="UniversityLabel" runat="server" Text='<%# Eval("University") %>' />
                            <br />
                            CFScore:
                            <asp:Label ID="CFScoreLabel" runat="server" Text='<%# Eval("CFScore") %>' />
                            <br />
                            PreferredCourses:
                            <asp:Label ID="PreferredCoursesLabel" runat="server" Text='<%# Eval("PreferredCourses") %>' />
                            <br />
                            MotivationBehindTheChoice:
                            <asp:Label ID="MotivationBehindTheChoiceLabel" runat="server" Text='<%# Eval("MotivationBehindTheChoice") %>' />
                            <br />
                            TraineeImage:
                            <asp:Label ID="TraineeImageLabel" runat="server" Text='<%# Eval("TraineeImage") %>' />
                            <br />
                            CourseID:
                            <asp:Label ID="CourseIDLabel" runat="server" Text='<%# Eval("CourseID") %>' />
                            <br />
                            CourseName:
                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                            <br />
                            TSPID:
                            <asp:Label ID="TSPIDLabel" runat="server" Text='<%# Eval("TSPID") %>' />
                            <br />
                            TspName:
                            <asp:Label ID="TspNameLabel" runat="server" Text='<%# Eval("TspName") %>' />
                            <br />
                        </li>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <li style="background-color: #008A8C;color: #FFFFFF;">TraineeID:
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
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </li>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        No data was returned.
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <li style="">TraineeName:
                            <asp:TextBox ID="TraineeNameTextBox" runat="server" Text='<%# Bind("TraineeName") %>' />
                            <br />DOB:
                            <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' />
                            <br />Gender:
                            <asp:TextBox ID="GenderTextBox" runat="server" Text='<%# Bind("Gender") %>' />
                            <br />TraineeContact:
                            <asp:TextBox ID="TraineeContactTextBox" runat="server" Text='<%# Bind("TraineeContact") %>' />
                            <br />Email:
                            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                            <br />University:
                            <asp:TextBox ID="UniversityTextBox" runat="server" Text='<%# Bind("University") %>' />
                            <br />CFScore:
                            <asp:TextBox ID="CFScoreTextBox" runat="server" Text='<%# Bind("CFScore") %>' />
                            <br />PreferredCourses:
                            <asp:TextBox ID="PreferredCoursesTextBox" runat="server" Text='<%# Bind("PreferredCourses") %>' />
                            <br />MotivationBehindTheChoice:
                            <asp:TextBox ID="MotivationBehindTheChoiceTextBox" runat="server" Text='<%# Bind("MotivationBehindTheChoice") %>' />
                            <br />TraineeImage:
                            <asp:TextBox ID="TraineeImageTextBox" runat="server" Text='<%# Bind("TraineeImage") %>' />
                            <br />CourseID:
                            <asp:TextBox ID="CourseIDTextBox" runat="server" Text='<%# Bind("CourseID") %>' />
                            <br />CourseName:
                            <asp:TextBox ID="CourseNameTextBox" runat="server" Text='<%# Bind("CourseName") %>' />
                            <br />TSPID:
                            <asp:TextBox ID="TSPIDTextBox" runat="server" Text='<%# Bind("TSPID") %>' />
                            <br />TspName:
                            <asp:TextBox ID="TspNameTextBox" runat="server" Text='<%# Bind("TspName") %>' />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </li>
                    </InsertItemTemplate>
                    <ItemSeparatorTemplate>
<br />
                    </ItemSeparatorTemplate>
                    <ItemTemplate>
                        <li style="background-color: #DCDCDC;color: #000000;">TraineeID:
                            <asp:Label ID="TraineeIDLabel" runat="server" Text='<%# Eval("TraineeID") %>' />
                            <br />
                            TraineeName:
                            <asp:Label ID="TraineeNameLabel" runat="server" Text='<%# Eval("TraineeName") %>' />
                            <br />
                            DOB:
                            <asp:Label ID="DOBLabel" runat="server" Text='<%# Eval("DOB") %>' />
                            <br />
                            Gender:
                            <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' />
                            <br />
                            TraineeContact:
                            <asp:Label ID="TraineeContactLabel" runat="server" Text='<%# Eval("TraineeContact") %>' />
                            <br />
                            Email:
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                            <br />
                            University:
                            <asp:Label ID="UniversityLabel" runat="server" Text='<%# Eval("University") %>' />
                            <br />
                            CFScore:
                            <asp:Label ID="CFScoreLabel" runat="server" Text='<%# Eval("CFScore") %>' />
                            <br />
                            PreferredCourses:
                            <asp:Label ID="PreferredCoursesLabel" runat="server" Text='<%# Eval("PreferredCourses") %>' />
                            <br />
                            MotivationBehindTheChoice:
                            <asp:Label ID="MotivationBehindTheChoiceLabel" runat="server" Text='<%# Eval("MotivationBehindTheChoice") %>' />
                            <br />
                            TraineeImage:
                            <asp:Label ID="TraineeImageLabel" runat="server" Text='<%# Eval("TraineeImage") %>' />
                            <br />
                            CourseID:
                            <asp:Label ID="CourseIDLabel" runat="server" Text='<%# Eval("CourseID") %>' />
                            <br />
                            CourseName:
                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                            <br />
                            TSPID:
                            <asp:Label ID="TSPIDLabel" runat="server" Text='<%# Eval("TSPID") %>' />
                            <br />
                            TspName:
                            <asp:Label ID="TspNameLabel" runat="server" Text='<%# Eval("TspName") %>' />
                            <br />
                        </li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <li runat="server" id="itemPlaceholder" />
                        </ul>
                        <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                        </div>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <li style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">TraineeID:
                            <asp:Label ID="TraineeIDLabel" runat="server" Text='<%# Eval("TraineeID") %>' />
                            <br />
                            TraineeName:
                            <asp:Label ID="TraineeNameLabel" runat="server" Text='<%# Eval("TraineeName") %>' />
                            <br />
                            DOB:
                            <asp:Label ID="DOBLabel" runat="server" Text='<%# Eval("DOB") %>' />
                            <br />
                            Gender:
                            <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' />
                            <br />
                            TraineeContact:
                            <asp:Label ID="TraineeContactLabel" runat="server" Text='<%# Eval("TraineeContact") %>' />
                            <br />
                            Email:
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                            <br />
                            University:
                            <asp:Label ID="UniversityLabel" runat="server" Text='<%# Eval("University") %>' />
                            <br />
                            CFScore:
                            <asp:Label ID="CFScoreLabel" runat="server" Text='<%# Eval("CFScore") %>' />
                            <br />
                            PreferredCourses:
                            <asp:Label ID="PreferredCoursesLabel" runat="server" Text='<%# Eval("PreferredCourses") %>' />
                            <br />
                            MotivationBehindTheChoice:
                            <asp:Label ID="MotivationBehindTheChoiceLabel" runat="server" Text='<%# Eval("MotivationBehindTheChoice") %>' />
                            <br />
                            TraineeImage:
                            <asp:Label ID="TraineeImageLabel" runat="server" Text='<%# Eval("TraineeImage") %>' />
                            <br />
                            CourseID:
                            <asp:Label ID="CourseIDLabel" runat="server" Text='<%# Eval("CourseID") %>' />
                            <br />
                            CourseName:
                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                            <br />
                            TSPID:
                            <asp:Label ID="TSPIDLabel" runat="server" Text='<%# Eval("TSPID") %>' />
                            <br />
                            TspName:
                            <asp:Label ID="TspNameLabel" runat="server" Text='<%# Eval("TspName") %>' />
                            <br />
                        </li>
                    </SelectedItemTemplate>
                </asp:ListView>--%>
                <asp:SqlDataSource ID="SqlDSTraineeList" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Trainees]"></asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
