using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;
using ExamApp.WebUI.Models;

namespace ExamApp.WebUI
{
    public partial class ExamAdd : System.Web.UI.Page
    {
        public XElement ReadXmlFromRSSPage()
        {
            HttpWebRequest myRequest = (HttpWebRequest)WebRequest.Create("https://www.wired.com/feed/rss");
            WebResponse myResponse;
            // https RSS bağlantısı TLS 1.2 versiyon protokol ile bağlantı gerektirir.
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            myResponse = myRequest.GetResponse();
            XmlDocument _xmlDoc = new XmlDocument();
            using (Stream responseStream = myResponse.GetResponseStream())
            {
                _xmlDoc.Load(responseStream);
            }
            return XElement.Load(new XmlNodeReader(_xmlDoc));
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                var dox = ReadXmlFromRSSPage();

                var x = dox.Descendants("item").Select(d =>
                new
                {
                    Title = d.Element("title").Value,
                    Desc = d.Element("description").Value
                }).Take(5).ToList();

                ddlTitles.DataSource = x;
                ddlTitles.DataTextField = "title";
                ddlTitles.DataValueField = "title";
                ddlTitles.DataBind();
                ddlTitles.Items.Insert(0, new ListItem("Başlık seçiniz"));
            }
        }


        protected void ddlTitles_SelectedIndexChanged(object sender, EventArgs e)
        {
            var dox = ReadXmlFromRSSPage();
            var x = dox.Descendants("item").Select(d =>
       new
       {
           Title = d.Element("title").Value,
           Desc = d.Element("description").Value
       }).Take(5).ToList();

            ltrP.Text = (x.Where(y => y.Title == ddlTitles.SelectedItem.Text).SingleOrDefault()).Desc;

        }

        protected void btnNewExam_Click(object sender, EventArgs e)
        {
            using (ExamProjectDBEntities db = new ExamProjectDBEntities())
            {
                Exam sinav = new Exam()
                {
                    ExamName = ddlTitles.SelectedItem.Text,
                    ExamDesc = ltrP.Text,
                    CreatedDate = DateTime.Now
                };
                db.Exams.Add(sinav);
                db.SaveChanges();



                char[] alp = "ABCD".ToCharArray();
                for (int a = 1; a < 5; a++)
                {
                    Control c = Page.FindControl("txtQuestion" + a.ToString());
                    if (!String.IsNullOrEmpty((c as TextBox).Text))
                    {
                        Question q = new Question()
                        {
                            ExamId = sinav.ExamId,
                            QuestionText = (c as TextBox).Text
                        };
                        db.Questions.Add(q);
                        db.SaveChanges();

                        for (int b = 1; b < 5; b++)
                        {
                            Control ctrl = Page.FindControl("Answer" + alp[b - 1] + a.ToString() + "Q" + b.ToString());
                            Answer _answer = new Answer();

                            _answer.QuestionId = q.QuestionId;
                            _answer.AnswerText = (ctrl as TextBox).Text;


                            if ((((DropDownList)(Page.FindControl("ddlCorectAnswer" + a))).SelectedValue).ToLower().ToString() == (ctrl as TextBox).ID.Substring((ctrl as TextBox).ID.Length - 1, 1))
                            {
                                _answer.IsCorrect = true;
                            }
                            else
                            {
                                _answer.IsCorrect = false;
                            }
                            db.Answers.Add(_answer);
                            db.SaveChanges();
                        }
                    }
                }
            }
            Response.Redirect("ExamList.aspx");
        }
    }
}