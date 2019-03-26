using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Text;
using System.Data;


namespace FriendBook
{
    public partial class WritingMessage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            OleDbConnection myCon = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\User\Desktop\YuChen\Programming\Internet\FriendBook\FriendBook\App_data\Friend_Book_Data.mdb;Persist Security Info=True");
            myCon.Open();
            string sql = "insert into Message(sender_username, receiver_username, message_title, message_content, sending_time) values ('";
            //sql += Session["CurrentUser"] + "', '" + lblMessage.Text + "', '" + txtMessageTitle.Text + "', '" + txtMessage.Text + "', Now())";
            OleDbCommand myCom = new OleDbCommand(sql, myCon);
            myCom.ExecuteNonQuery();
            lblSend.Text = "Message Send";
        }

        protected void btnAddReceipiant_Click(object sender, EventArgs e)
        {
            
        }
    }
}