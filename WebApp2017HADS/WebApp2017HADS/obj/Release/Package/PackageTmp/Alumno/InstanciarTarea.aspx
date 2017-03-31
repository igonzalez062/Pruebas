<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InstanciarTarea.aspx.vb" Inherits="WebApp2017HADS.InstanciarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width:100%;">
            <tr>
                <td style="width:20%;">
                    <table style="width:100%;">
                        <tr>
                            <td>                  
                                <asp:LinkButton ID="LinkButtonCerrarSesion" runat="server">Cerrar Sesion</asp:LinkButton>
                            </td>
                        </tr>
                     </table>                   
                </td>
                <td style="width:80%;">
    <p style="text-align: center; font-size: x-large; font-style: normal; font-variant: small-caps; color: #FF0000; background-color: #C0C0C0; font-weight: bold;"> 
        <br />
        ALUMNOS - INSTANCIACION DE TAREA GENÉRICA
        <br /><br />
    </p>
                </td>
            </tr>
        </table>


    
        <asp:Label ID="Label2" runat="server" Text="Usuario: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxUsuario" runat="server" Height="16px" ReadOnly="True" Width="144px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Tarea: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxTarea" runat="server" ReadOnly="True" Width="142px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Horas Est.: "></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxHorasEstimadas" runat="server" ReadOnly="True" Width="148px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Horas Reales: "></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxHorasReales" runat="server" TextMode="Number">0</asp:TextBox>
        <br />
        <br />
        <asp:Button ID="ButtonCrearTarea" runat="server" Text="Crear Tarea" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelError" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" PostBackUrl="~/Alumno/TareasAlumno.aspx">Página Anterior</asp:LinkButton>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:GridView ID="GridViewTareasUser" runat="server">
            <AlternatingRowStyle BackColor="#FF9933" />
            <HeaderStyle BackColor="#FF66CC" />
        </asp:GridView>
        <br />
    
    </div>
    </form>
</body>
</html>
