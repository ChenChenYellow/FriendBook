<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WritingMessage.aspx.cs" Inherits="FriendBook.WritingMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    
</head>
<body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="script.js" ></script>
    <div class="w-100 text-center">
            <asp:Label runat="server" ID="lblFormTitle1" CssClass="display-2">Write Message</asp:Label>
    </div>
    <form id="form1" runat="server">
    <div><asp:Table runat="server" ID="bigTable" CssClass="w-100">
    
                <asp:TableRow CssClass="row">
                    <asp:TableCell CssClass="col-12">
                        <asp:Panel ID="messagePanel" runat="server" Visible="true" CssClass="offset-2">
                            
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <asp:Label runat="server" Text="TO :" ID="lblTO" CssClass="float-left"/>
                                </div>
                                    <asp:CheckBoxList runat="server" ID="cboReceipiants" CssClass="form-control">

                                    </asp:CheckBoxList>
                            </div>
                            <br />
                            <asp:Button runat="server" Text="Add a Receipiant" ID="btnAddReceipiant" CssClass="float-left btn btn-info" OnClientClick="window.open('activity.aspx', 'pageActivity');" />
                            
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
