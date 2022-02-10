<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTraineeRegister.ascx.cs" Inherits="ASPFinalProject_Mehedee.UserControls.ucTraineeRegister" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        text-align: center;
    }
    .auto-style3 {
        height: 26px;
    }
    .auto-style4 {
        height: 30px;
    }
    .auto-style5 {
        height: 23px;
    }
    .auto-style6 {
        width: 401px;
    }
    .auto-style7 {
        height: 30px;
        width: 401px;
        text-align: right;
        font-size: large;
    }
    .auto-style8 {
        height: 23px;
        width: 401px;
        text-align: right;
        font-size: large;
    }
    .auto-style9 {
        width: 401px;
        text-align: right;
        font-size: large;
    }
    .auto-style11 {
        width: 401px;
        text-align: right;
        height: 29px;
        font-size: large;
    }
    .auto-style12 {
        height: 29px;
    }
    .auto-style13 {
        width: 401px;
        text-align: right;
        height: 26px;
        font-size: large;
    }
    .auto-style15 {
        height: 29px;
        width: 395px;
    }
    .auto-style16 {
        width: 395px;
    }
    .auto-style17 {
        height: 26px;
        width: 395px;
    }
    .auto-style18 {
        height: 30px;
        width: 395px;
    }
    .auto-style19 {
        height: 23px;
        width: 395px;
    }
    .auto-style20 {
        width: 401px;
        height: 33px;
    }
    .auto-style21 {
        width: 395px;
        height: 33px;
    }
    .auto-style22 {
        height: 33px;
    }
    .auto-style24 {
        font-size: large;
    }
</style>

<table class="auto-style1">
    <%--<asp:ScriptManager ID="scr1" runat="server"></asp:ScriptManager>--%>
    <tr>
        <td class="auto-style2" colspan="5">
            <h1><strong>Trainee Registration Form</strong></h1>
        </td>
    </tr>
    <tr>
        <td class="auto-style11">
            Name : 
        </td>
        <td class="auto-style15">
            <asp:TextBox ID="txtTraineeName" runat="server" Height="33px" Width="188px"></asp:TextBox>
        </td>
        <td class="auto-style12"></td>
        <td class="auto-style12"></td>
        <td class="auto-style12"></td>
    </tr>
    <tr>
        <td class="auto-style9">
            Gender : 
        </td>
        <td class="auto-style16">
            <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" Font-Size="Large" Height="43px" Width="190px">
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style13">
            Date of Birth : 
        </td>
        <td class="auto-style17">
            <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" Height="25px" Width="184px"></asp:TextBox>
        </td>
        <td class="auto-style3"></td>
        <td class="auto-style3"></td>
        <td class="auto-style3"></td>
    </tr>
    <tr>
        <td class="auto-style13">
            University : </td>
        <td class="auto-style17">
            <asp:DropDownList ID="ddlUniversity" runat="server" Height="19px" Width="188px">
                <asp:ListItem>Select University</asp:ListItem>
                <asp:ListItem Value="DU">Dhaka University</asp:ListItem>
                <asp:ListItem Value="CU">University of Chittagong</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="auto-style3"></td>
        <td class="auto-style3"></td>
        <td class="auto-style3"></td>
    </tr>
    <tr>
        <td class="auto-style11">
            CF Score : 
        </td>
        <td class="auto-style15">
            <asp:TextBox ID="txtCfScore" runat="server" TextMode="Number" Height="31px" Width="180px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rvScore" runat="server" ControlToValidate="txtCfScore" ErrorMessage="Score is required." ForeColor="Red" SetFocusOnError="True">Score is required.</asp:RequiredFieldValidator>
        </td>
        <td class="auto-style12"></td>
        <td class="auto-style12"></td>
        <td class="auto-style12"></td>
    </tr>
    <tr>
        <td class="auto-style11">
            Preferred Courses : 
        </td>
        <td class="auto-style15">
            <asp:CheckBoxList ID="cblPreferredCourse" runat="server">
                <asp:ListItem>C#</asp:ListItem>
                <asp:ListItem>JAVA</asp:ListItem>
                <asp:ListItem>Python</asp:ListItem>
            </asp:CheckBoxList>
        </td>
        <td class="auto-style12"></td>
        <td class="auto-style12"></td>
        <td class="auto-style12"></td>
    </tr>
    <tr>
        <td class="auto-style9">
            Motivation Behind the Choice : 
        </td>
        <td class="auto-style16">
            <asp:TextBox ID="txtMotivation" runat="server" Height="60px" TextMode="MultiLine" Width="185px"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="lblMessage" runat="server" BorderColor="Red" ForeColor="Green"></asp:Label>
            <ajaxToolkit:AnimationExtender ID="lblMessage_AnimationExtender" runat="server" BehaviorID="lblMessage_AnimationExtender" TargetControlID="lblMessage">
            </ajaxToolkit:AnimationExtender>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style11">
            Phone Number : </td>
        <td class="auto-style15">
            <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" Height="25px" Width="174px"></asp:TextBox>
        </td>
        <td rowspan="6">
            <%--<asp:Image ID="imgField" runat="server" ImageUrl='<%#Bind("") %>' Width="120" Height="80"/>--%>
        </td>
        <td class="auto-style12"></td>
        <td class="auto-style12"></td>
    </tr>
    <tr>
        <td class="auto-style7">
            Email : 
        </td>
        <td class="auto-style18">
            <asp:TextBox ID="txtTraineeEmail" runat="server" Height="32px" Width="181px" ToolTip="i.e. abc @email.com"></asp:TextBox>
            <asp:RegularExpressionValidator ID="rgvEmail" runat="server" ControlToValidate="txtTraineeEmail" ErrorMessage="Incorrect Email Format." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Incorrect Email Format.</asp:RegularExpressionValidator>
        </td>
        <td class="auto-style4"></td>
        <td class="auto-style4"></td>
    </tr>
    <tr>
        <td class="auto-style8">
            Confirm Email : 
        </td>
        <td class="auto-style19">
            <asp:TextBox ID="txtTraineeConfirmEmail" runat="server" Height="28px" Width="181px"></asp:TextBox>
            <asp:CompareValidator ID="cmvEmail" runat="server" ControlToCompare="txtTraineeEmail" ControlToValidate="txtTraineeConfirmEmail" ErrorMessage="Email didn't match." ForeColor="Red">Email didn&#39;t match.</asp:CompareValidator>
        </td>
        <td class="auto-style5"></td>
        <td class="auto-style5"></td>
    </tr>
    <tr>
        <td class="auto-style11">
            <h3 class="auto-style24">UserName : </h3>
        </td>
        <td class="auto-style15">
            <h3>
                <%--<asp:UpdatePanel runat="server">
                    <ContentTemplate>
                         <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="txtTraineeUserName_TextChanged"></asp:TextBox>
                    </ContentTemplate>

                   
                </asp:UpdatePanel>--%>               <%-- <asp:UpdatePanel runat="server">
                    <ContentTemplate>--%>
                        <asp:TextBox ID="txtTraineeUserName" runat="server" Height="25px" Width="175px" ></asp:TextBox>
                <%--    </ContentTemplate>
                </asp:UpdatePanel>--%>                <%--<asp:TextBox ID="txtTraineeUserName" runat="server" OnTextChanged="txtTraineeUserName_TextChanged"></asp:TextBox>--%>
            <asp:Label ID="lblUserName" runat="server"></asp:Label>
            <ajaxToolkit:AnimationExtender ID="lblUserName_AnimationExtender" runat="server" BehaviorID="lblMessage_AnimationExtender" TargetControlID="lblUserName">
            </ajaxToolkit:AnimationExtender>
            </h3>
        </td>
        <td class="auto-style12">
            <h3></h3>
        </td>
        <td class="auto-style12">
            <h3></h3>
        </td>
    </tr>
    <tr>
        <td class="auto-style11">
            <h3 class="auto-style24">Password : </h3>
        </td>
        <td class="auto-style15">
            <asp:TextBox ID="txtTraineePass" runat="server" TextMode="Password" Height="26px" Width="172px"></asp:TextBox>
            <ajaxToolkit:PasswordStrength ID="txtTraineePass_PasswordStrength" runat="server" BehaviorID="txtTraineePass_PasswordStrength" TargetControlID="txtTraineePass" />
        </td>
        <td class="auto-style12"></td>
        <td class="auto-style12"></td>
    </tr>
    <tr>
        <td class="auto-style9">
            Trainee Image : 
        </td>
        <td class="auto-style16">
            <asp:FileUpload ID="uplTraineeImage" runat="server" Height="25px" Width="180px" />
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style20"></td>
        <td class="auto-style21">
            <asp:Button ID="btnRegister" runat="server" BackColor="#FFCCFF" BorderColor="Red" Font-Bold="True" ForeColor="Green" Height="23px" OnClick="btnRegister_Click" Text="Register" Width="124px" />
            <ajaxToolkit:ConfirmButtonExtender ID="btnRegister_ConfirmButtonExtender" runat="server" BehaviorID="btnRegister_ConfirmButtonExtender" ConfirmText="" TargetControlID="btnRegister" />
        </td>
        <td class="auto-style22"></td>
        <td class="auto-style22"></td>
        <td class="auto-style22"></td>
    </tr>
    <tr>
        <td class="auto-style6">&nbsp;</td>
        <td class="auto-style16">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>

