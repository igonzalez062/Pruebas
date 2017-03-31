<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ResultadoCambioPassword.aspx.vb" Inherits="WebApp2017HADS.CambioPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server">Cambio de contraseña cambiado correctamente</asp:Label>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="LinkButtonInicio" runat="server" CausesValidation="False" PostBackUrl="~/Inicio.aspx">Inicio</asp:LinkButton>
    
    </div>
    </form>
</body>
</html>
