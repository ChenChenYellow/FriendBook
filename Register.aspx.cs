using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Text;

namespace FriendBook
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                OleDbConnection myCon = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\User\Desktop\YuChen\Programming\Internet\FriendBook\FriendBook\App_data\Friend_Book_Data.mdb;Persist Security Info=True");
                myCon.Open();
                OleDbCommand myComd = new OleDbCommand(selectString("City"), myCon);
                OleDbDataReader myRead = myComd.ExecuteReader();
                cboCity.DataSource = myRead;
                cboCity.DataValueField = "city_id";
                cboCity.DataTextField = "city_name";
                cboCity.DataBind();
                myRead.Close();

                myComd = new OleDbCommand(selectString("Gender"), myCon);
                myRead = myComd.ExecuteReader();
                cboGender.DataSource = myRead;
                cboGender.DataValueField = "gender_id";
                cboGender.DataTextField = "gender_name";
                cboGender.DataBind();
                myRead.Close();

                myComd = new OleDbCommand(selectString("Race"), myCon);
                myRead = myComd.ExecuteReader();
                cboEthenity.DataSource = myRead;
                cboEthenity.DataValueField = "race_id";
                cboEthenity.DataTextField = "race_name";
                cboEthenity.DataBind();
                myRead.Close();

                myComd = new OleDbCommand(selectString("[Language]"), myCon);
                myRead = myComd.ExecuteReader();
                cboLanguage.DataSource = myRead;
                cboLanguage.DataValueField = "language_id";
                cboLanguage.DataTextField = "language_name";
                cboLanguage.DataBind();
                myRead.Close();
                myCon.Close();
            }
        }
        private string selectString(string tableName)
        {
            return "Select * from " + tableName;
        }
        private string quote(string a)
        {
            return "'" + a + "'";
        }

        protected void submitting_Click(object sender, EventArgs e)
        {
            OleDbConnection myCon = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\User\Desktop\YuChen\Programming\Internet\FriendBook\FriendBook\App_data\Friend_Book_Data.mdb;Persist Security Info=True");
            myCon.Open();
            OleDbCommand myComd = new OleDbCommand(selectString("Client")+ " where client_username = " + quote(txtUsername.Text), myCon);
            OleDbDataReader myRead = myComd.ExecuteReader();
            if (myRead.HasRows)
            {
                lblInfo.Text = "Username Exist";
            }
            else if (!txtPassword.Text.Equals(txtRePassword.Text))
            {
                lblInfo.Text = "Please Enter Correctly the password";
            }
            else if (cboLanguage.SelectedItem == null)
            {
                lblInfo.Text = "Please Select at least one language";
            }
            else
            {
                myRead.Close();
                StringBuilder ret = new StringBuilder("");
                ret.Append("insert into client(client_username, client_password, gender_id, city_id, race_id) values(");
                ret.Append(quote(txtUsername.Text) + ", ");
                ret.Append(quote(txtPassword.Text) + ", ");
                ret.Append(cboGender.SelectedItem.Value + ", ");
                ret.Append(cboCity.SelectedItem.Value + ", ");
                ret.Append(cboEthenity.SelectedItem.Value + ") ");
                myComd = new OleDbCommand(ret.ToString(), myCon);
                myComd.ExecuteNonQuery();

                foreach (ListItem item in cboLanguage.Items)
                {
                    if (item.Selected)
                    {
                        ret = new StringBuilder("insert into Client_Language(Language_id, Client_username) values(");
                        ret.Append(item.Value);
                        ret.Append(", " + quote(txtUsername.Text) + ")");
                        myComd = new OleDbCommand(ret.ToString(), myCon);
                        myComd.ExecuteNonQuery();
                    }
                }
                myCon.Close();
                Response.Redirect("index.aspx");
            }
            myRead.Close();
            myCon.Close();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}