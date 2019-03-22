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
    public partial class Activity : System.Web.UI.Page
    {
        private string selectString(string tableName)
        {
            return "Select * from " + tableName;
        }
        private void selectAll(RadioButtonList radList, CheckBoxList checkList)
        {

            if (radList.SelectedValue == "All")
            {
                foreach (ListItem item in checkList.Items)
                {
                    item.Selected = true;
                }
            }
            else if (radList.SelectedValue == "None")
            {
                checkList.ClearSelection();
            }
        }
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
                cboRace.DataSource = myRead;
                cboRace.DataValueField = "race_id";
                cboRace.DataTextField = "race_name";
                cboRace.DataBind();
                myRead.Close();

                myComd = new OleDbCommand(selectString("[Language]"), myCon);
                myRead = myComd.ExecuteReader();
                cboLanguage.DataSource = myRead;
                cboLanguage.DataValueField = "language_id";
                cboLanguage.DataTextField = "language_id";
                cboLanguage.DataBind();
                myRead.Close();
                myCon.Close();

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            StringBuilder ret = new StringBuilder("select client.* from client, client_language where ");
            if (cboGender.SelectedItem!=null)
            {
                ret.Append("(");
                foreach (ListItem item in cboGender.Items)
                {
                    if (item.Selected)
                    {
                        ret.Append("client.gender_id = " + item.Value + " or ");
                    }
                }
                ret = ret.Remove(ret.Length - 3, 3);
                ret.Append(") and ");
            }else
            {
                lblTest.Text = "Select at least a gender";
                return;
            }

            if (cboCity.SelectedItem != null)
            {
                ret.Append("(");
                foreach (ListItem item in cboCity.Items)
                {
                    if (item.Selected)
                    {
                        ret.Append("client.city_id = " + item.Value + " or ");
                    }
                }
                ret = ret.Remove(ret.Length - 3, 3);
                ret.Append(") and ");
            }
            else
            {
                lblTest.Text = "Select at least a city";
                return;
            }


            if (cboRace.SelectedItem != null)
            {
                ret.Append("(");
                foreach (ListItem item in cboRace.Items)
                {
                    if (item.Selected)
                    {
                        ret.Append("client.race_id = " + item.Value + " or ");
                    }
                }
                ret = ret.Remove(ret.Length - 3, 3);
                ret.Append(") and ");
            }
            else
            {
                lblTest.Text = "Select at least a race";
                return;
            }



            if (cboLanguage.SelectedItem != null)
            {
                ret.Append("(");
                foreach (ListItem item in cboLanguage.Items)
                {
                    if (item.Selected)
                    {
                        ret.Append("(client_language.language_id = " + item.Value + " and client_language.client_username = client.client_username) and ");
                    }
                }
                ret = ret.Remove(ret.Length - 4, 4);
                ret.Append(")");
            }
            else
            {
                lblTest.Text = "Select at least a language";
                return;
            }


            OleDbConnection myCon = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\User\Desktop\YuChen\Programming\Internet\FriendBook\FriendBook\App_data\Friend_Book_Data.mdb;Persist Security Info=True");
            myCon.Open();
            myCon.Close();
            lblTest.Text = ret.ToString();

            OleDbDataAdapter adapter = new OleDbDataAdapter(ret.ToString(), myCon);
            DataSet myDataSet = new DataSet();
            DataTable table = new DataTable("searched_Client");
        }

        protected void cboSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboSearch.SelectedValue.Equals("Username"))
            {
                usernamePanel.Visible = true;
                criteriaPanel.Visible = false;
            }else if (cboSearch.SelectedValue.Equals("Criteria"))
            {
                usernamePanel.Visible = false;
                criteriaPanel.Visible = true;
            }
        }
        protected void cboSelectAllGender_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectAll(cboSelectAllGender, cboGender);
        }

        protected void cboSelectAllCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectAll(cboSelectAllCity, cboCity);
        }

        protected void cboSelectAllRace_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectAll(cboSelectAllRace, cboRace);
        }

        protected void cboSelectAllLanguage_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectAll(cboSelectAllLanguage, cboLanguage);
        }
    }
}