<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CambiarPassword.aspx.vb" Inherits="WebApp2017HADS.CambiarPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="LabelCorreo" runat="server" Text="Correo electrónico: "></asp:Label>
        <asp:TextBox ID="TextBoxCorreo" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxCorreo" ErrorMessage="*" ForeColor="Red" ValidationGroup="Grupo1"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxCorreo" ErrorMessage="El email no es correcto" ForeColor="Red" ValidationExpression="^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$" ValidationGroup="Grupo1"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Button ID="ButtonMostrarPreguntaSecreta" runat="server" Text="Mostrar Pregunta Secreta" ValidationGroup="Grupo1" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelResul1" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        <br />
        <br />
    
        <asp:Label ID="LabelPregunta" runat="server" Text="Pregunta Secreta: "></asp:Label>
        <asp:Label ID="LabelPreguntaSecreta" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label ID="LabelRespuesta" runat="server" Text="Respuesta Secreta: "></asp:Label>
        <asp:TextBox ID="TextBoxRespuestaSecreta" runat="server" Enabled="False"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBoxRespuestaSecreta" ValidationGroup="Grupo2"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="LabelNuevaContraseña" runat="server" Text="Nueva contraseña: "></asp:Label>
        <asp:TextBox ID="TextBoxNuevaContraseña" runat="server" Enabled="False" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxNuevaContraseña" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="Grupo2">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBoxNuevaContraseña" ErrorMessage="La contraseña debe contener una mayúscula, una minúscula y un número" ForeColor="Red" ValidationExpression="^(?:.*(?=[A-Z]).*(?=[a-z]).*(?=[0-9]).*|.*(?=[a-z]).*(?=[0-9]).*(?=[A-Z]).*|.*(?=[0-9]).*(?=[A-Z]).*(?=[a-z]).*|.*(?=[a-z]).*(?=[A-Z]).*(?=[0-9]).*)$" ValidationGroup="Grupo2"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="LabelRepitaNuevaContraseña" runat="server" Text="Repita Nueva Contraseña: "></asp:Label>
        <asp:TextBox ID="TextBoxNuevaContraseña2" runat="server" Enabled="False" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxNuevaContraseña2" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="Grupo2">*</asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxNuevaContraseña" ControlToValidate="TextBoxNuevaContraseña2" ErrorMessage="Las contraseñas no coinciden" ForeColor="Red" ValidationGroup="Grupo2"></asp:CompareValidator>
        <br />
        <br />
        <asp:Button ID="ButtonConfirmarCambioContraseña" runat="server" Text="Confirmar Cambio Contraseña" Enabled="False" ValidationGroup="Grupo2" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
