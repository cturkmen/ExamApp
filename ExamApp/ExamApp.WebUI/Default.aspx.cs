using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ExamApp.WebUI.Models;

namespace ExamApp.WebUI
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (ExamProjectDBEntities db = new ExamProjectDBEntities())
            {
                var _user = from x in db.Users
                            where x.Username == txtUsername.Text && x.Password == txtPassword.Text
                            select x;

                if (_user.Count() != 0)
                {
                    Response.Redirect("ExamList.aspx");
                }
                else
                {
                    Response.Write("<script>javascript:alert('Hatalı kullanıcı adı ve şifre.');</script>");
                }
            }
        }
    }
}