<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Admin.aspx.vb" Inherits="WebApp2017HADS.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        
        <table style="width: 100%;">
            <tr>
                <td style="background-color:lightblue;width:30%">
                    <asp:Label ID="LabelUser" runat="server"></asp:Label><br />
                    <asp:LinkButton ID="LinkButton2" runat="server">Cerrar Sesion</asp:LinkButton><br /><br /><br />
                    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Admin/ModificarUsers.aspx">Cambiar Tipos de User</asp:LinkButton>
                </td>
                <td style="background-color:silver;text-align:center">MENU DEL ADMIN</td>
            </tr>            
        </table>
    
    </div>
    </form>
</body>
</html>
