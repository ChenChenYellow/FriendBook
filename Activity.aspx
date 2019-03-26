<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Activity.aspx.cs" Inherits="FriendBook.Activity" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FRIEND BOOK Search User & Write Message</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <style type="text/css">
        .scrollBox {
            overflow: auto;
        }

        .hDouble {
            height: 80px;
        }
    </style>
</head>
<body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <div class="w-100 text-center">
            <asp:Label runat="server" ID="lblFormTitle1" CssClass="display-2">Search User</asp:Label>
            <asp:Label runat="server" ID="lblFormTitle2" CssClass="display-2">&</asp:Label>
            <asp:Label runat="server" ID="lblFormTitle3" CssClass="display-2">Send Message</asp:Label>
    </div>
    <form id="form1" runat="server" class="w-100">
        <div>
            <asp:Table runat="server" ID="bigTable" CssClass="w-100">
                <asp:TableRow runat="server" CssClass="row w-100">
                    <asp:TableCell CssClass="col-6">
                        <asp:Panel runat="server" ID="searchPanel" CssClass="offset-1 border">

                            <div class="btn-group">
                                <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Sign out" CssClass="btn btn-danger" />
                                <asp:Button ID="btnReadMessage" runat="server" OnClick="btnReadMessage_Click" Text="Inbox" CssClass="btn btn-info" />
                            </div>
                            <asp:RadioButtonList runat="server" ID="cboSearch" AutoPostBack="true" OnSelectedIndexChanged="cboSearch_SelectedIndexChanged" CssClass="form-control hDouble col-10">
                                <asp:ListItem Selected="True" Text="Search with Username" Value="Username"></asp:ListItem>
                                <asp:ListItem Text="Search with Criteria" Value="Criteria"></asp:ListItem>
                            </asp:RadioButtonList>
                            <br />

                            <asp:Panel runat="server" ID="usernamePanel" CssClass="input-group col-10">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Search For Username</span>
                                </div>
                                <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>

                            <asp:Panel runat="server" ID="criteriaPanel" Visible="false" CssClass="col-10">
                                <div class="input-group">
                                    <div class="input-group-prepend col-2 border">
                                        <span>Gender</span>
                                    </div>
                                    <asp:CheckBoxList runat="server" ID="cboGender" CssClass="form-control scrollBox hDouble justify-content-center" OnSelectedIndexChanged="cboGender_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:CheckBoxList>
                                    <asp:RadioButtonList runat="server" ID="cboSelectAllGender" CssClass="input-group-append form-control hDouble" OnSelectedIndexChanged="cboSelectAllGender_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Text="Select All" Value="All"></asp:ListItem>
                                        <asp:ListItem Text="Deselect All" Value="None"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>

                                <div class="input-group">
                                    <div class="input-group-prepend col-2 border">
                                        <span>City</span>
                                    </div>
                                    <asp:CheckBoxList runat="server" ID="cboCity" CssClass="form-control scrollBox hDouble justify-content-center" OnSelectedIndexChanged="cboCity_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:CheckBoxList>
                                    <asp:RadioButtonList runat="server" ID="cboSelectAllCity" CssClass="input-group-append form-control hDouble" OnSelectedIndexChanged="cboSelectAllCity_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Text="Select All" Value="All"></asp:ListItem>
                                        <asp:ListItem Text="Deselect All" Value="None"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>

                                <div class="input-group">
                                    <div class="input-group-prepend col-2 border">
                                        <span>Race</span>
                                    </div>
                                    <asp:CheckBoxList runat="server" ID="cboRace" CssClass="form-control scrollBox hDouble justify-content-center" RepeatColumns="2" OnSelectedIndexChanged="cboRace_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:CheckBoxList>
                                    <asp:RadioButtonList runat="server" ID="cboSelectAllRace" CssClass="input-group-append form-control hDouble" OnSelectedIndexChanged="cboSelectAllRace_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Text="Select All" Value="All"></asp:ListItem>
                                        <asp:ListItem Text="Deselect All" Value="None"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>

                                <div class="input-group">
                                    <div class="input-group-prepend col-2 border">
                                        <span>Language</span>
                                    </div>
                                    <asp:CheckBoxList runat="server" ID="cboLanguage" CssClass="form-control scrollBox hDouble justify-content-center" RepeatColumns="2" OnSelectedIndexChanged="cboLanguage_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:CheckBoxList>
                                    <asp:RadioButtonList runat="server" ID="cboSelectAllLanguage" CssClass="input-group-append form-control hDouble" OnSelectedIndexChanged="cboSelectAllLanguage_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Text="Select All" Value="All"></asp:ListItem>
                                        <asp:ListItem Text="Deselect All" Value="None"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>

                            </asp:Panel>
                            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-primary" />
                            <asp:Label ID="lblTest" runat="server" />
                        </asp:Panel>
                    </asp:TableCell>
                    <asp:TableCell CssClass="col-6">
                        <asp:Panel runat="server" ID="resultPanel" Visible="false" CssClass="offset-1 border">
                            <asp:ListBox ID="listBoxResult" runat="server" CssClass="col-10 form-control" />
                            <asp:Button ID="btnChat" runat="server" Text="send message to this person" OnClick="btnChat_Click" CssClass="btn btn-primary col-10" />
                        </asp:Panel>
                    </asp:TableCell>

                </asp:TableRow>

                
                <asp:TableRow CssClass="row">
                    <asp:TableCell CssClass="col-12" ColumnSpan="2">
                        <asp:Panel ID="messagePanel" runat="server" Visible="true" CssClass="offset-2 border">
                            
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <asp:Label runat="server" Text="TO :" ID="lblTO" CssClass="float-left"/>
                                </div>
                                    <asp:CheckBoxList runat="server" ID="cboReceipiants" CssClass="form-control" RepeatDirection="Horizontal">

                                    </asp:CheckBoxList>
                            </div>
                            <br />
                            
                            <asp:Label runat="server" Text="Title :" ID="lblTitle"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtMessageTitle" runat="server" CssClass="col-8"></asp:TextBox>
                            <asp:TextBox ID="txtMessage" runat="server" Rows="10" TextMode="MultiLine" CssClass="col-8"></asp:TextBox>
                            <br />
                            <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" CssClass="btn btn-primary" />
                            <br />
                            <asp:Label ID="lblSend" runat="server" />
                        </asp:Panel>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

        </div>
    </form>
</body>
</html>
