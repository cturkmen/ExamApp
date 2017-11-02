using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ExamApp.WebUI.Models;

namespace ExamApp.WebUI
{
    public partial class ExamList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (ExamProjectDBEntities db = new ExamProjectDBEntities())
            {
                grdExamList.DataSource = db.Exams.ToList();
                grdExamList.DataBind();
            }
        }

        protected void grdExamList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            using (ExamProjectDBEntities db = new ExamProjectDBEntities())
            {
                int _examId = Convert.ToInt32(e.CommandArgument.ToString());
                Exam _exam = db.Exams.SingleOrDefault(x => x.ExamId == _examId);
                db.Exams.Remove(_exam);
                var qs = db.Questions.Where(x => x.ExamId == _exam.ExamId);
                db.Questions.RemoveRange(qs);

                foreach (Question item in qs)
                {
                    db.Answers.RemoveRange(db.Answers.Where(x => x.QuestionId == item.QuestionId));
                }
                db.SaveChanges();
            }
            Response.Redirect(Request.RawUrl);
        }
    }
}