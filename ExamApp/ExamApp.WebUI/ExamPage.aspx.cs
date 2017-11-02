using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ExamApp.WebUI.Models;
using System.Web.Services;
using System.Text;

namespace ExamApp.WebUI
{
    public partial class ExamPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Page.IsPostBack)
                return;

            int _examId = int.Parse(Request.QueryString["ExamId"].ToString());
            using (ExamProjectDBEntities db = new ExamProjectDBEntities())
            {
                Exam _exam = db.Exams.SingleOrDefault(x => x.ExamId == _examId);
                ltrExamName.Text = _exam.ExamName;
                ltrExamDesc.Text = _exam.ExamDesc;

                rptQuestion.DataSource = db.Questions.Where(x => x.ExamId == _exam.ExamId).ToList();
                rptQuestion.DataBind();




            }
        }

        [WebMethod]
        public static string GetData(string examId)
        {
            int eId = int.Parse(examId);
            StringBuilder sb = new StringBuilder();

            using (ExamProjectDBEntities db = new ExamProjectDBEntities())
            {
                var allResult = from texam in db.Exams
                                join tquestions in db.Questions on texam.ExamId equals tquestions.ExamId
                                join tanswers in db.Answers on tquestions.QuestionId equals tanswers.QuestionId
                                where texam.ExamId == eId && tanswers.IsCorrect == true
                                select new
                                {
                                    QuestionText = tquestions.QuestionText,
                                    AnswerText = tanswers.AnswerText
                                };
                foreach (var item in allResult)
                {
                    sb.Append(item.AnswerText + ",");
                }
            }
            return sb.ToString();
        }

        protected void rptQuestion_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Repeater rptOptions = (Repeater)e.Item.FindControl("rptQOptions");
            int questionId = Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "QuestionId"));
            using (ExamProjectDBEntities db = new ExamProjectDBEntities())
            {
                rptOptions.DataSource = db.Answers.Where(x => x.QuestionId == questionId).ToList();
                rptOptions.DataBind();
            }
        }

        protected void rptQOptions_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Literal ltrAlp = (Literal)e.Item.FindControl("ltrOrderAlph");
            switch (e.Item.ItemIndex)
            {
                case 0:
                    ltrAlp.Text = "A) ";
                    break;
                case 1:
                    ltrAlp.Text = "B) ";
                    break;
                case 2:
                    ltrAlp.Text = "C) ";
                    break;
                case 3:
                    ltrAlp.Text = "D) ";
                    break;
            }
        }
    }
}