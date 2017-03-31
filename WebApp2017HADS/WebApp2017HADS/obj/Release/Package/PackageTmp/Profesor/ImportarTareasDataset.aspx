<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ImportarTareasDataset.aspx.vb" Inherits="WebApp2017HADS.ImportarTareasDataset" %>

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
                    <br /> PROFESOR - IMPORTACIÓN DE TAREAS GENÉRICAS (V. DATASET)<br /><br />
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
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <asp:Label ID="Label1" runat="server" Text="Seleccionar Asignatura:"></asp:Label>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="codigo" AutoPostBack="True" DataValueField="codigo">
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
        Lista de tareas de la asignatura seleccionada:
        <asp:Label ID="LabelError" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <br />
        <br />
        <asp:Button ID="ButtonImportarDataset" runat="server" Text="Importar (Dataset)" />
        &nbsp;
        <asp:Label ID="LabelBBDD" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <asp:LinkButton ID="LinkButtonMenuProfesor" runat="server" PostBackUrl="~/Profesor/Profesor.aspx">Menu Profesor</asp:LinkButton>
        <br />
        <br />
        <br />
    </div>
    </form>
</body>
</html>
