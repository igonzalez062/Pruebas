<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="VerEstadisticas.aspx.vb" Inherits="WebApp2017HADS.VerEstadisticas" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

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
        <asp:Label ID="Label1" runat="server" Text="Alumno: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Asignatura: "></asp:Label>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Email" DataValueField="Email">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="codigoasig" DataValueField="codigoasig">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HADS20_F2ConnectionString %>" SelectCommand="SELECT DISTINCT GruposClase.codigoasig
FROM GruposClase
INNER JOIN EstudiantesGrupo ON GruposClase.codigo = EstudiantesGrupo.Grupo
WHERE EstudiantesGrupo.Email = @email">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="email" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS20_F2ConnectionString %>" SelectCommand="SELECT DISTINCT EstudiantesTareas.Email FROM EstudiantesTareas"></asp:SqlDataSource>
        <br />
        <br />
        <br />
        <asp:Chart ID="ChartEstadisticasAlumnoAsignatura" runat="server" DataSourceID="SqlDataSource3" Height="500px" ImageLocation="~/Imagenes/ChartPic_#SEQ(300,3)" Width="600px">
            <series>
                <asp:Series Name="Series1" XValueMember="CodTarea" YValueMembers="HReales">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:HADS20_F2ConnectionString %>" SelectCommand="SELECT EstudiantesTareas.*
FROM EstudiantesTareas
INNER JOIN TareasGenericas ON EstudiantesTareas.CodTarea = TareasGenericas.Codigo
WHERE TareasGenericas.CodAsig = @asigna AND EstudiantesTareas.Email = @emailsel">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="asigna" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList1" Name="emailsel" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
