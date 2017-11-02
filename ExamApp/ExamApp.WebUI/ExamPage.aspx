<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExamPage.aspx.cs" Inherits="ExamApp.WebUI.ExamPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sınav</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var qans = "";

            $.ajax({
                type: "POST",
                url: "ExamPage.aspx/GetData",
                data: '{ "examId": "<%= Request.QueryString["ExamId"].ToString() %>" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $("#Content").text(response.d);
                    qans = response.d;
                },
                failure: function (response) {
                    alert(response.d);
                }
            });

            $("#btnSubmit").click(function () {
                var arrayq = qans.split(',');
                for (var i = 0; i < arrayq.length - 2; i++) {
                    //alert(arrayq[i])
                    var ele = "div#" + (i + 1) +'.'+ ">[class*='btn btn- block text- left btn- success']";
                    alert($(ele).text());
                }
            });

            $('#1 a').click(function () {
                $('#1 a').removeClass('btn btn-block text-left btn-success').addClass('btn btn-block text-left btn-light');
                $(this).removeClass('btn btn-block text-left btn-light').addClass('btn btn-block text-left btn-success');
            });

            $('#2 a').click(function () {
                $('#2 a').removeClass('btn btn-block text-left btn-success').addClass('btn btn-block text-left btn-light');
                $(this).removeClass('btn btn-block text-left btn-light').addClass('btn btn-block text-left btn-success');
            });

            $('#3 a').click(function () {
                $('#3 a').removeClass('btn btn-block text-left btn-success').addClass('btn btn-block text-left btn-light');
                $(this).removeClass('btn btn-block text-left btn-light').addClass('btn btn-block text-left btn-success');
            });

            $('#4 a').click(function () {
                $('#4 a').removeClass('btn btn-block text-left btn-success').addClass('btn btn-block text-left btn-light');
                $(this).removeClass('btn btn-block text-left btn-light').addClass('btn btn-block text-left btn-success');
            });
        });


    </script>
</head>
<body>
    <form id="frm" method="post" runat="server">
        <br />
        <div id="Content">
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>
                        <asp:Literal ID="ltrExamName" runat="server"></asp:Literal></h2>
                    <br />
                    <p>
                        <asp:Literal ID="ltrExamDesc" runat="server"></asp:Literal>
                    </p>
                </div>
            </div>

            <div class="row">

                <asp:Repeater ID="rptQuestion" runat="server" OnItemDataBound="rptQuestion_ItemDataBound">
                    <ItemTemplate>
                        <div class="col-md-6">
                            <div class="card" style="margin-bottom: 15px;">
                                <p class="card-header">
                                    <%# Container.ItemIndex + 1%>)&nbsp;<%# Eval("QuestionText") %>
                                </p>
                                <div id="<%# Container.ItemIndex + 1%>" class="card-body">
                                    <asp:Repeater ID="rptQOptions" runat="server" OnItemDataBound="rptQOptions_ItemDataBound">
                                        <ItemTemplate>
                                            <a href="#" class="btn btn-block text-left btn-light">
                                                <asp:Literal ClientIDMode="Static" ID="ltrOrderAlph" runat="server" /><%# Eval("AnswerText") %>
                                            </a>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <button id="btnSubmit" class="btn btn-block btn-success" type="button">SINAVI TAMAMLA</button>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
