<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testing.aspx.cs" Inherits="FriendBook.testing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <style>
        .scrollBox {
            height: 125px;
            overflow: auto;
        }
    </style>
</head>
<body class="offset-3">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <!--<input type="text" name="aaaa" />-->
    <form id="form1" runat="server" class="w-50 text-center" method="post" action="Register.aspx">
        <div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span>abc</span>
                </div>
                <asp:TextBox runat="server" ID="txtBox" OnTextChanged="txtBox_TextChanged"></asp:TextBox>
            </div>
            <div class="btn-group">
                
                <button class="btn btn-info" type="submit" value="Register" name="submitting">Submit</button>
                <button class="btn btn-light" type="reset" >Clear</button>
                
            </div>
        </div>
    </form>
</body>
</html>
