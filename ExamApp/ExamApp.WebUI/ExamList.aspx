<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExamList.aspx.cs" Inherits="ExamApp.WebUI.ExamList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sınav Listesi</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
</head>
<body>
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <a class="btn btn-primary" href="ExamAdd.aspx"><i class="fa fa-plus"></i>Yeni Sınav Oluştur</a>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <form id="form1" runat="server">
                    <asp:GridView ID="grdExamList" runat="server" AutoGenerateColumns="False" Width="100%" OnRowCommand="grdExamList_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="#">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sınav Ad">
                                <ItemTemplate>
                                    <%# Eval("ExamName") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tarih">
                                <ItemTemplate>
                                    <%# Eval("CreatedDate","{0:d}") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton CommandName="RecordDelete" CommandArgument='<%# Eval("ExamId") %>' CssClass="btn btn-primary btn-sm" OnClientClick="return window.confirm('Kayıt silinecek onaylıyor musunuz ?');" runat="server"><i class="fa fa-trash-o"></i> Sil</asp:LinkButton>
                                    <a class="btn btn-success btn-sm" href="Exampage.aspx?ExamId=<%# Eval("ExamId") %>">Sınava Git</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
