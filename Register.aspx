<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FriendBook.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FRIEND BOOK Register</title>
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

    <form id="form1" runat="server" class="w-50 text-center">
        
        <asp:Panel runat="server" ID="panelMain">
            <asp:Label runat="server" ID="lblFormTitle" CssClass="display-2">Register</asp:Label>
            <br />
            <br />
            <br />
            <br />
            <div class="input-group mb-3">
                <div class="input-group-prepend col-4">
                    <span class="input-group-text w-100">Username</span>
                </div>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend col-4">
                    <span class="input-group-text w-100">Password</span>
                </div>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend col-4">
                    <span class="input-group-text w-100">Retype Password</span>
                </div>
                <asp:TextBox ID="txtRePassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>


            <div class="input-group mb-3">
                <div class="input-group-prepend col-4">
                    <span class="input-group-text w-100">Gender</span>
                </div>
                <asp:DropDownList ID="cboGender" runat="server" CssClass="form-control"></asp:DropDownList>

            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend col-4">
                    <span class="input-group-text w-100">Ethenity</span>
                </div>
                <asp:DropDownList ID="cboEthenity" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend col-4">
                    <span class="input-group-text w-100">City</span>
                </div>
                <asp:DropDownList ID="cboCity" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </div>
            
            <div class="input-group mb-3">
                <div class="input-group-prepend col-4">
                    <span class="input-group-text w-100">Language Spoken</span>
                </div>
                <asp:CheckBoxList runat="server" ID="cboLanguage" CssClass="form-control scrollBox justify-content-center"></asp:CheckBoxList>
            </div>
            <div class="btn-group">
                
                <asp:Button runat="server" ID="submitting" Text="Register" OnClick="submitting_Click" CssClass="btn btn-info"/>
                <!--<button class="btn btn-info" value="Register" type="submit" name="submit">Submit</button>-->
                <button class="btn btn-light" type="reset" >Clear</button>
                
                <asp:Button runat="server" ID="btnBack" Text="Back To Login" CssClass="btn btn-light" OnClick="btnBack_Click"/>
            </div>
            <br />
            <asp:Label ID="lblInfo" runat="server" />
        </asp:Panel>
        
    </form>
    
</body>
</html>
