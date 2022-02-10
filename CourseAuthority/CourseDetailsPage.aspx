<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CourseDetailsPage.aspx.cs" Inherits="ASPFinalProject_Mehedee.CourseAuthority.CourseDetailsPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
        <table style="width: 100%">
            <tr>
                <td style="height: 19px; text-align: center; font-size: x-large">Course Details</td>
                <td style="height: 19px"></td>
                <td style="height: 19px"></td>
            </tr>
            <tr>
                <td rowspan="10">
                    <asp:GridView ID="grdCourse" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDSCourse" BackColor="#CCCCCC" BorderColor="#999999" DataKeyNames="CourseID" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" ShowFooter="True" style="margin-top: 0px">
                        <Columns>
                            <asp:BoundField DataField="CourseID" HeaderText="CourseID" SortExpression="CourseID" />
                            <asp:TemplateField HeaderText="CourseName" SortExpression="CourseName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CourseName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CourseName") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtCourseName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="insert" ID="rvCourseName" runat="server" ControlToValidate="txtCourseName" Text="Name can't be blank" ErrorMessage="Name can't be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Duration" SortExpression="Duration">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Duration") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Duration") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtDuration" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="insert" ID="rvDuration" runat="server" ControlToValidate="txtDuration" Text="Duration can't be blank" ErrorMessage="Duration can't be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SeatAvailability" SortExpression="SeatAvailability">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("SeatAvailability") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("SeatAvailability") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtSeat" runat="server" TextMode="Number"></asp:TextBox>
                                    <asp:RangeValidator ValidationGroup="insert" ID="rgvSeat" runat="server" Text="Seat must be between 15-50" ControlToValidate="txtSeat" MinimumValue="15" MaximumValue="50" Type="Integer" ErrorMessage="Seat must be between 15-50" ForeColor="Red"></asp:RangeValidator>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:LinkButton ID="btnAdd" ValidationGroup="insert" runat="server" Text="Add New" OnClick="btnAdd_Click"></asp:LinkButton>
                                </FooterTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" BorderColor="#009933" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="Gray" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDSCourse" runat="server" SelectMethod="GetCourses" TypeName="ASPFinalProject_Mehedee.Models.Course_DAC" InsertMethod="CourseAdd" UpdateMethod="CourseUpdate" DeleteMethod="DeleteData">
                        <DeleteParameters>
                            <asp:Parameter Name="courseId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="courseName" Type="String" />
                            <asp:Parameter Name="duration" Type="String" />
                            <asp:Parameter Name="seatAvailability" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="courseId" Type="Int32" />
                            <asp:Parameter Name="courseName" Type="String" />
                            <asp:Parameter Name="duration" Type="String" />
                            <asp:Parameter Name="seatAvailability" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="Yellow" BorderColor="#CC3300" BorderStyle="Dotted" Font-Bold="True" Font-Italic="True" ForeColor="#000099" />
                </td>
                <td style="height: 20px"></td>
                <td style="height: 20px"></td>
            </tr>
            <tr>
                <td style="height: 20px">&nbsp;</td>
                <td style="height: 20px">&nbsp;</td>
            </tr>
            <tr>
                <td style="height: 20px">&nbsp;</td>
                <td style="height: 20px">&nbsp;</td>
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
        </table>
    </p>
</asp:Content>
