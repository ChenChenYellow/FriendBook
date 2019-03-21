<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Activity.aspx.cs" Inherits="FriendBook.Activity" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <style type="text/css">
        .scrollBox {
            height: 100px;
            overflow: auto;
        }
    </style>
</head>
<body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <form id="form1" runat="server" class="w-100">
        <div>
            <asp:Table runat="server" ID="bigTable" CssClass="w-100">
                <asp:TableRow runat="server" CssClass="row w-100">
                    <asp:TableCell CssClass="col-6">
                        <asp:Panel runat="server" ID="searchPanel">
                            <asp:RadioButtonList runat="server" ID="cboSearch" RepeatColumns="2" AutoPostBack="true" OnSelectedIndexChanged="cboSearch_SelectedIndexChanged">
                                <asp:ListItem Text="Search with Username" Value="Username"></asp:ListItem>
                                <asp:ListItem Text="Search with Criteria" Value="Criteria"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:Panel runat="server" ID="usernamePanel" CssClass="input-group">
                                <div class="input-group-prepend">
                                    <span>Search For Username</span>
                                </div>
                                <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="criteriaPanel">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span>Gender</span>
                                    </div>
                                    <asp:CheckBoxList runat="server" ID="cboGender" CssClass="form-control scrollBox" RepeatColumns="3" CellPadding="10" CellSpacing="10">
                                    </asp:CheckBoxList>
                                    <asp:RadioButtonList runat="server" ID="cboSelectAllGender" CssClass="input-group-append" OnSelectedIndexChanged="cboSelectAllGender_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Text="Select All" Value="All"></asp:ListItem>
                                        <asp:ListItem Text="Deselect All" Value="None"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span>City</span>
                                    </div>
                                    <asp:CheckBoxList runat="server" ID="cboCity" CssClass="form-control scrollBox" RepeatColumns="3" CellPadding="10" CellSpacing="10">
                                    </asp:CheckBoxList>
                                    <asp:RadioButtonList runat="server" ID="cboSelectAllCity" CssClass="input-group-append" OnSelectedIndexChanged="cboSelectAllCity_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Text="Select All" Value="All"></asp:ListItem>
                                        <asp:ListItem Text="Deselect All" Value="None"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span>Race</span>
                                    </div>
                                    <asp:CheckBoxList runat="server" ID="cboRace" CssClass="form-control scrollBox" RepeatColumns="3" CellPadding="10" CellSpacing="10">
                                    </asp:CheckBoxList>
                                    <asp:RadioButtonList runat="server" ID="cboSelectAllRace" CssClass="input-group-append" OnSelectedIndexChanged="cboSelectAllRace_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Text="Select All" Value="All"></asp:ListItem>
                                        <asp:ListItem Text="Deselect All" Value="None"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span>Language</span>
                                    </div>
                                    <asp:CheckBoxList runat="server" ID="cboLanguage" CssClass="form-control scrollBox" RepeatColumns="3" CellPadding="10" CellSpacing="10">
                                    </asp:CheckBoxList>
                                    <asp:RadioButtonList runat="server" ID="cboSelectAllLanguage" CssClass="input-group-append" OnSelectedIndexChanged="cboSelectAllLanguage_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Text="Select All" Value="All"></asp:ListItem>
                                        <asp:ListItem Text="Deselect All" Value="None"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>

                            </asp:Panel>
                            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-primary" />
                        </asp:Panel>
                    </asp:TableCell>
                    <asp:TableCell CssClass="col-6">
                        <asp:Panel runat="server" ID="resultPanel">
                            <asp:ListBox runat="server" ID="lbxResult"></asp:ListBox>
                            <asp:Button ID="btnChat" runat="server" Text="send message to this person" />
                        </asp:Panel>
                    </asp:TableCell>

                </asp:TableRow>
                <asp:TableRow CssClass="row">
                    <asp:TableCell ColumnSpan="2" CssClass="col-12">
                        <asp:Panel ID="messagePanel" runat="server">
                        </asp:Panel>
                    </asp:TableCell>
                </asp:TableRow>


            </asp:Table>

        </div>
    </form>
</body>
</html>
