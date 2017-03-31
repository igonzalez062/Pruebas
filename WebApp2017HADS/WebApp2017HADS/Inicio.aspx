<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Inicio.aspx.vb" Inherits="WebApp2017HADS.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="LabelEmail" runat="server" Text="Dirección de correo electrónico: "></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxEmail" runat="server" Width="186px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Email Requerido" ForeColor="Red">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="El email no es correcto" ForeColor="Red" ValidationExpression="^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="LabelPassword" runat="server" Text="Contraseña: "></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxContraseña" runat="server" Width="311px" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxContraseña" ErrorMessage="Contraseña Requerida" ForeColor="Red">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBoxContraseña" ErrorMessage="La contraseña debe contener una mayúscula, una minúscula y un número" ForeColor="Red" ValidationExpression="^(?:.*(?=[A-Z]).*(?=[a-z]).*(?=[0-9]).*|.*(?=[a-z]).*(?=[0-9]).*(?=[A-Z]).*|.*(?=[0-9]).*(?=[A-Z]).*(?=[a-z]).*|.*(?=[a-z]).*(?=[A-Z]).*(?=[0-9]).*)$" Enabled="False"></asp:RegularExpressionValidator>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="BotonLogin" runat="server" Height="75px" Text="Login" Width="225px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
        <asp:Label ID="LabelError" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:Label>
    
        <br />
    
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="LinkButtonNuevoRegistro" runat="server" CausesValidation="False" PostBackUrl="~/Registro.aspx">Nuevo registro</asp:LinkButton>
        <br />
&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="LinkButtonOlvidadoContraseña" runat="server" CausesValidation="False" PostBackUrl="~/CambiarPassword.aspx">He olvidado mi contraseña</asp:LinkButton>
        <br />
&nbsp;&nbsp;&nbsp;
            
    </div>
    </form>
</body>
</html>
