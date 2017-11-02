<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExamAdd.aspx.cs" Inherits="ExamApp.WebUI.ExamAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yeni Sınav Oluştur</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label>Yazı</label>
                        <asp:DropDownList ID="ddlTitles" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTitles_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label>İçerik</label>
                        <br />
                        <asp:Literal ID="ltrP" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>

            <%-- Q1 --%>
            <div class="row">
                <div class="col-md-12">
                    Soru 1)
                    <asp:TextBox ID="txtQuestion1" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">A)<asp:TextBox ID="AnswerA1Q1" CssClass="form-control" runat="server"></asp:TextBox></div>
                <div class="col-md-6">B)<asp:TextBox ID="AnswerB1Q2" CssClass="form-control" runat="server"></asp:TextBox></div>
            </div>
            <div class="row">
                <div class="col-md-6">C)<asp:TextBox ID="AnswerC1Q3" CssClass="form-control" runat="server"></asp:TextBox></div>
                <div class="col-md-6">D)<asp:TextBox ID="AnswerD1Q4" CssClass="form-control" runat="server"></asp:TextBox></div>
            </div>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <br />
                    Doğru Cevap
                    <asp:DropDownList ID="ddlCorectAnswer1" runat="server" Width="100">
                        <asp:ListItem Value="1">A</asp:ListItem>
                        <asp:ListItem Value="2">B</asp:ListItem>
                        <asp:ListItem Value="3">C</asp:ListItem>
                        <asp:ListItem Value="4">D</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-4"></div>
            </div>
            <%-- Q1 --%>
            <hr />
            <%-- Q2 --%>
            <div class="row">
                <div class="col-md-12">
                    Soru 2)
                    <asp:TextBox ID="txtQuestion2" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">A)<asp:TextBox ID="AnswerA2Q1" CssClass="form-control" runat="server"></asp:TextBox></div>
                <div class="col-md-6">B)<asp:TextBox ID="AnswerB2Q2" CssClass="form-control" runat="server"></asp:TextBox></div>
            </div>
            <div class="row">
                <div class="col-md-6">C)<asp:TextBox ID="AnswerC2Q3" CssClass="form-control" runat="server"></asp:TextBox></div>
                <div class="col-md-6">D)<asp:TextBox ID="AnswerD2Q4" CssClass="form-control" runat="server"></asp:TextBox></div>
            </div>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <br />
                    Doğru Cevap
                    <asp:DropDownList ID="ddlCorectAnswer2" runat="server" Width="100">
                        <asp:ListItem Value="1">A</asp:ListItem>
                        <asp:ListItem Value="2">B</asp:ListItem>
                        <asp:ListItem Value="3">C</asp:ListItem>
                        <asp:ListItem Value="4">D</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-4"></div>
            </div>
            <%-- Q2 --%>
            <hr />
            <%-- Q3 --%>
            <div class="row">
                <div class="col-md-12">
                    Soru 3)
                    <asp:TextBox ID="txtQuestion3" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">A)<asp:TextBox ID="AnswerA3Q1" CssClass="form-control" runat="server"></asp:TextBox></div>
                <div class="col-md-6">B)<asp:TextBox ID="AnswerB3Q2" CssClass="form-control" runat="server"></asp:TextBox></div>
            </div>
            <div class="row">
                <div class="col-md-6">C)<asp:TextBox ID="AnswerC3Q3" CssClass="form-control" runat="server"></asp:TextBox></div>
                <div class="col-md-6">D)<asp:TextBox ID="AnswerD3Q4" CssClass="form-control" runat="server"></asp:TextBox></div>
            </div>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <br />
                    Doğru Cevap
                    <asp:DropDownList ID="ddlCorectAnswer3" runat="server" Width="100">
                        <asp:ListItem Value="1">A</asp:ListItem>
                        <asp:ListItem Value="2">B</asp:ListItem>
                        <asp:ListItem Value="3">C</asp:ListItem>
                        <asp:ListItem Value="4">D</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-4"></div>
            </div>
            <%-- Q3 --%>
            <hr />
            <%-- Q4 --%>
            <div class="row">
                Soru 4)
                <div class="col-md-12">
                    <asp:TextBox ID="txtQuestion4" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">A)<asp:TextBox ID="AnswerA4Q1" CssClass="form-control" runat="server"></asp:TextBox></div>
                <div class="col-md-6">B)<asp:TextBox ID="AnswerB4Q2" CssClass="form-control" runat="server"></asp:TextBox></div>
            </div>
            <div class="row">
                <div class="col-md-6">C)<asp:TextBox ID="AnswerC4Q3" CssClass="form-control" runat="server"></asp:TextBox></div>
                <div class="col-md-6">D)<asp:TextBox ID="AnswerD4Q4" CssClass="form-control" runat="server"></asp:TextBox></div>
            </div>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <br />
                    Doğru Cevap
                    <asp:DropDownList ID="ddlCorectAnswer4" runat="server" Width="100">
                        <asp:ListItem Value="1">A</asp:ListItem>
                        <asp:ListItem Value="2">B</asp:ListItem>
                        <asp:ListItem Value="3">C</asp:ListItem>
                        <asp:ListItem Value="4">D</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-4"></div>
            </div>
            <%-- Q4 --%>
            <hr />
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <br />
                    <asp:LinkButton ID="btnNewExam" CssClass="btn btn-success btn-block" runat="server" OnClick="btnNewExam_Click">Sınav Oluştur</asp:LinkButton>
                    <br />
                    <br />
                    <br />
                </div>
                <div class="col-md-4"></div>
            </div>
        </div>
    </form>
</body>
</html>
