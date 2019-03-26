<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReadingMessage.aspx.cs" Inherits="FriendBook.ReadingMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FRIEND BOOK Inbox</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
</head>
<body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <div class="w-100 text-center">
            <asp:Label runat="server" ID="lblFormTitle" CssClass="display-2">Inbox</asp:Label>
        <br />
    </div>
    <form id="form1" runat="server" class="w-100">
        
        <div>
            <asp:Table ID="tableMain" runat="server" CssClass="w-100">
                <asp:TableRow Height="">
                    <asp:TableCell CssClass="w-100">
                        <asp:Panel ID="panelMessageList" runat="server" CssClass="offset-2 w-100">
                            <div class="btn-group">
                                <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Sign Out" CssClass="btn btn-danger" />
                                <asp:Button ID="btnWrite" runat="server" OnClick="btnWrite_Click" Text="Write a Message" CssClass="btn btn-info" />
                            </div>
                            <asp:GridView ID="gridViewMessageList" runat="server" OnSelectedIndexChanged="gridViewMessageList_SelectedIndexChanged" AutoGenerateSelectButton="false" CssClass="col-8" >
                                <Columns>
                                    <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="" Text="View" ControlStyle-CssClass="btn btn-light w-100" HeaderStyle-Width="10%"/>
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell CssClass="w-100">
                        <asp:Panel ID="panelReadMessage" runat="server" CssClass="offset-2 w-100">
                            <asp:Label ID="lblFrom" runat="server" Text="From :" />
                            <asp:TextBox ID="txtReadMessageFrom" runat="server" Enabled="false" CssClass="form-control col-8" />
                            <asp:Label ID="lblTime" runat="server" Text="Sent Time : " />
                            <asp:TextBox ID="txtReadMessageTime" runat="server" Enabled="false" CssClass="form-control col-8" />
                            <asp:Label ID="lblTitle" runat="server" Text="Title : " />
                            <asp:TextBox ID="txtReadMessageTitle" runat="server" Enabled="false" CssClass="col-8 form-control" />
                            <asp:TextBox ID="txtReadMessage" runat="server" Enabled="false" Rows="12" TextMode="MultiLine" CssClass="col-8 form-control" />
                        </asp:Panel>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

        </div>
    </form>
</body>
</html>
