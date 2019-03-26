using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

namespace FriendBook
{
    public partial class ReadingMessage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["CurrentUser"] == null)
                {
                    Response.Redirect("index.aspx");
                }
                OleDbConnection myCon = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\User\Desktop\YuChen\Programming\Internet\FriendBook\FriendBook\App_data\Friend_Book_Data.mdb;Persist Security Info=True");
                myCon.Open();
                string sql = "select sender_username as Sender, message_title as Title, sending_time as [Sent Time], message_content from message where receiver_username = '" + Session["CurrentUser"].ToString() + "'";
                OleDbDataAdapter adapter = new OleDbDataAdapter(sql, myCon);
                DataTable table = new DataTable();                
                adapter.Fill(table);
                gridViewMessageList.DataSource = table;
                gridViewMessageList.DataBind();
                if (table.Rows.Count > 0)
                {
                    gridViewMessageList.HeaderRow.Cells[4].Visible = false;
                    foreach (GridViewRow row in gridViewMessageList.Rows)
                    {
                        row.Cells[4].Visible = false;
                    }
                }else
                {
                    panelReadMessage.Visible = false;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Session.Remove("CurrentUser");
            Response.Redirect("index.aspx");
        }

        protected void btnWrite_Click(object sender, EventArgs e)
        {
            Response.Redirect("Activity.aspx");
        }

        protected void gridViewMessageList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gridViewMessageList.SelectedIndex > -1)
            {
                txtReadMessageFrom.Text = gridViewMessageList.SelectedRow.Cells[1].Text.ToString();
                txtReadMessageTime.Text = gridViewMessageList.SelectedRow.Cells[3].Text.ToString();
                txtReadMessageTitle.Text = gridViewMessageList.SelectedRow.Cells[2].Text.ToString();
                txtReadMessage.Text = gridViewMessageList.SelectedRow.Cells[4].Text.ToString();
            }
        }
    }
}