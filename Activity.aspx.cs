﻿using System;
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
                if (Session["CurrentUser"] == null)
                {
                    Response.Redirect("index.aspx");
                }
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
                cboLanguage.DataTextField = "language_name";
                cboLanguage.DataBind();
                myRead.Close();
                myCon.Close();

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            StringBuilder ret = new StringBuilder("");
            if (cboSearch.SelectedItem.Value.Equals("Username"))
            {
                if (txtUsername.Text.Equals(""))
                {
                    lblTest.Text = "Enter a username";
                    return;
                }
                else
                {
                    ret.Append("select client_username from client where client_username = '" + txtUsername.Text + "'");
                }
            }
            else if (cboSearch.SelectedItem.Value.Equals("Criteria"))
            {
                ret.Append("select client.client_username from client where ");
                if (cboGender.SelectedItem != null)
                {
                    ret.Append("(client.gender_id in ( ");
                    foreach (ListItem item in cboGender.Items)
                    {
                        if (item.Selected)
                        {
                            ret.Append(item.Value + " , ");
                        }
                    }
                    ret = ret.Remove(ret.Length - 2, 2);
                    ret.Append(")) and ");
                }
                else
                {
                    lblTest.Text = "Select at least a gender";
                    return;
                }

                if (cboCity.SelectedItem != null)
                {
                    ret.Append("(client.city_id in ( ");
                    foreach (ListItem item in cboCity.Items)
                    {
                        if (item.Selected)
                        {
                            ret.Append(item.Value + " , ");
                        }
                    }
                    ret = ret.Remove(ret.Length - 2, 2);
                    ret.Append(")) and ");
                }
                else
                {
                    lblTest.Text = "Select at least a city";
                    return;
                }

                if (cboRace.SelectedItem != null)
                {
                    ret.Append("(client.race_id in ( ");
                    foreach (ListItem item in cboRace.Items)
                    {
                        if (item.Selected)
                        {
                            ret.Append(item.Value + " , ");
                        }
                    }
                    ret = ret.Remove(ret.Length - 2, 2);
                    ret.Append(")) and ");
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
                            ret.Append("(exists (select * from client_language where client.client_username = client_language.client_username and client_language.language_id = " + item.Value.ToString() + " )) and ");
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
            }
            OleDbConnection myCon = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\User\Desktop\YuChen\Programming\Internet\FriendBook\FriendBook\App_data\Friend_Book_Data.mdb;Persist Security Info=True");
            myCon.Open();
            
            OleDbDataAdapter adapter = new OleDbDataAdapter(ret.ToString(), myCon);
            DataTable table = new DataTable("search_client");
            adapter.Fill(table);
            
            listBoxResult.DataSource = table;
            listBoxResult.DataTextField = "client_username";
            listBoxResult.DataValueField = "client_username";
            listBoxResult.DataBind();
            myCon.Close();
            resultPanel.Visible = true;
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

        protected void cboGender_SelectedIndexChanged(object sender, EventArgs e)
        {
            cboSelectAllGender.ClearSelection();
        }

        protected void cboCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            cboSelectAllCity.ClearSelection();
        }

        protected void cboRace_SelectedIndexChanged(object sender, EventArgs e)
        {
            cboSelectAllRace.ClearSelection();
        }

        protected void cboLanguage_SelectedIndexChanged(object sender, EventArgs e)
        {
            cboSelectAllLanguage.ClearSelection();
        }

        protected void btnChat_Click(object sender, EventArgs e)
        {
            if (listBoxResult.SelectedIndex > -1)
            {
                messagePanel.Visible = true;

                foreach (ListItem item in cboReceipiants.Items)
                {
                    if (item.Value.Equals(listBoxResult.SelectedItem.Value))
                    {
                        item.Selected = true;
                        return;
                    }
                }
                ListItem temp = new ListItem();
                temp.Text = listBoxResult.SelectedItem.Value;
                temp.Value = listBoxResult.SelectedItem.Value;
                temp.Selected = true;
                cboReceipiants.Items.Add(temp);
            }
        }
        
        protected void btnSend_Click(object sender, EventArgs e)
        {
            OleDbConnection myCon = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\User\Desktop\YuChen\Programming\Internet\FriendBook\FriendBook\App_data\Friend_Book_Data.mdb;Persist Security Info=True");
            myCon.Open();
            string sql;
            foreach (ListItem item in cboReceipiants.Items)
            {
                if (item.Selected)
                {sql = "insert into Message(sender_username, receiver_username, message_title, message_content, sending_time) values ('";
            sql += Session["CurrentUser"] + "', '" + item.Value + "', '" + txtMessageTitle.Text + "', '" + txtMessage.Text + "', Now())";
            OleDbCommand myCom = new OleDbCommand(sql, myCon);
            myCom.ExecuteNonQuery();

                }
            }
            
            lblSend.Text = "Message Send";

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Session.Remove("CurrentUser");
            Response.Redirect("index.aspx");
        }

        protected void btnReadMessage_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReadingMessage.aspx");
        }
    }
}