<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Registro.aspx.vb" Inherits="WebApp2017HADS.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Dirección de correo electrónico: "></asp:Label>
        <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="El email no es correcto" ForeColor="Red" ValidationExpression="^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Nombre: "></asp:Label>
        <asp:TextBox ID="TextBoxNombre" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxNombre" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label8" runat="server" Text="Apellidos: "></asp:Label>
        <asp:TextBox ID="TextBoxApellidos" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxApellidos" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="DNI: "></asp:Label>
        <asp:TextBox ID="TextBoxDNI" runat="server" TextMode="Number"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxDNI" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxDNI" ErrorMessage="El DNI no es correcto" ForeColor="Red" ValidationExpression="(([X-Z]{1})([-]?)(\d{7})([-]?)([A-Z]{1}))|((\d{8})([-]?)([A-Z]{1}))" Enabled="False"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Password: "></asp:Label>
        <asp:TextBox ID="TextBoxContraseña" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxContraseña" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBoxContraseña" ErrorMessage="La contraseña debe contener una mayúscula, una minúscula y un número" ForeColor="Red" ValidationExpression="^(?:.*(?=[A-Z]).*(?=[a-z]).*(?=[0-9]).*|.*(?=[a-z]).*(?=[0-9]).*(?=[A-Z]).*|.*(?=[0-9]).*(?=[A-Z]).*(?=[a-z]).*|.*(?=[a-z]).*(?=[A-Z]).*(?=[0-9]).*)$"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Repetir Password: "></asp:Label>
        <asp:TextBox ID="TextBoxRepetirContraseña" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxRepetirContraseña" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxContraseña" ControlToValidate="TextBoxRepetirContraseña" ErrorMessage="Las contraseñas no coinciden" ForeColor="Red"></asp:CompareValidator>
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Text="Pregunta Secreta: "></asp:Label>
        <asp:TextBox ID="TextBoxPreguntaSecreta" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBoxPreguntaSecreta" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label7" runat="server" Text="Respuesta a la pregunta secreta: "></asp:Label>
        <asp:TextBox ID="TextBoxRespuestaSecreta" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBoxRespuestaSecreta" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="ButtonRegistrar" runat="server" Text="Registrar" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonVolver" runat="server" Text="Volver" CausesValidation="False" PostBackUrl="~/Inicio.aspx" />
        <br />
    
    </div>
    </form>
</body>
</html>
