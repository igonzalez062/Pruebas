<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InsertarTarea.aspx.vb" Inherits="WebApp2017HADS.InsertarTarea" %>

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
                <td style="width:80%;">
                    <p style="text-align: center; font-size: x-large; font-style: normal; font-variant: small-caps; color: #FF0000; background-color: #C0C0C0; font-weight: bold;"> 
                    <br /> PROFESOR - GESTION DE TAREAS GENÉRICAS <br /><br />
                    </p>
                </td>
                <td style="width:20%;">
                    <table style="width:100%;">
                        <tr>
                            <td>
                                <asp:Label ID="LabelUser" runat="server"></asp:Label><br />                            
                                <asp:LinkButton ID="LinkButtonCerrarSesion" runat="server">Cerrar Sesion</asp:LinkButton>
                            </td>
                        </tr>
                     </table>                   
                </td>                
            </tr>
        </table>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Codigo: "></asp:Label>
        <asp:TextBox ID="TextBoxCodigo" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Descripcion: "></asp:Label>
        <asp:TextBox ID="TextBoxDescripcion" runat="server" Height="58px" Width="364px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Asignatura: "></asp:Label>
        <asp:DropDownList ID="DropDownListAsignaturas" runat="server" DataSourceID="SqlDataSource1" DataTextField="codigo" DataValueField="codigo">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS20_F2ConnectionString %>" SelectCommand="SELECT Asignaturas.codigo FROM Asignaturas 
INNER JOIN GruposClase ON GruposClase.codigoasig = Asignaturas.codigo 
INNER JOIN ProfesoresGrupo ON ProfesoresGrupo.codigogrupo = GruposClase.codigo
WHERE ProfesoresGrupo.email = @email">
            <SelectParameters>
                <asp:SessionParameter Name="email" SessionField="UserID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Horas Estimadas: "></asp:Label>
        <asp:TextBox ID="TextBoxHorasEstimadas" runat="server" TextMode="Number"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Tipo Tarea: "></asp:Label>
        <asp:DropDownList ID="DropDownListTipoTarea" runat="server">
            <asp:ListItem>Laboratorio</asp:ListItem>
            <asp:ListItem>Ejercicio</asp:ListItem>
            <asp:ListItem>Examen</asp:ListItem>
            <asp:ListItem>Trabajo</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="ButtonAñadirTarea" runat="server" Text="Añadir Tarea" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LabelError" runat="server" ForeColor="Red"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Profesor/TareasProfesor.aspx">Ver Tareas</asp:LinkButton>
    
    </div>
    </form>
</body>
</html>
