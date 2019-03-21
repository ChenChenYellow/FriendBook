using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace FriendBook
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private string quote(string a)
        {
            return "'" + a + "'";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            OleDbConnection myCon = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\User\Desktop\YuChen\Programming\Internet\FriendBook\FriendBook\App_data\Friend_Book_Data.mdb;Persist Security Info=True");
            myCon.Open();
            OleDbCommand myComd = new OleDbCommand("select client_username from client where client_username = " + quote(txtUsername.Text) + " and client_password = " + quote(txtPassword.Text), myCon);
            OleDbDataReader myRead = myComd.ExecuteReader();
            if (myRead.HasRows)
            {

            }
        }
    }
}