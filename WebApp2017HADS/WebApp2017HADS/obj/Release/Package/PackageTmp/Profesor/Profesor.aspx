<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Profesor.aspx.vb" Inherits="WebApp2017HADS.Profesor" %>

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
                    <asp:LinkButton ID="LinkButtonCerrarSesion" runat="server">Cerrar Sesion</asp:LinkButton><br /><br /><br />
                    <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Profesor/TareasProfesor.aspx">Gestion de Tareas</asp:LinkButton><br />
                    <br />
                    <asp:LinkButton ID="LinkButtonVerEstadisticas" runat="server" PostBackUrl="~/Profesor/VerEstadisticas.aspx">Ver Estadisticas</asp:LinkButton>
                    <br />
                    <br />
                    <asp:LinkButton ID="LinkButtonImportarXML" runat="server" PostBackUrl="~/Profesor/ImportarTareasXML.aspx">Importar v. XMLDocument</asp:LinkButton>
                    <br />
                    <br />
                    <asp:LinkButton ID="LinkButtonExportar" runat="server" PostBackUrl="~/Profesor/ExportarTareas.aspx" Enabled="False">Exportar</asp:LinkButton>
                    <br /><br />
                    <asp:LinkButton ID="LinkButtonImportarDataSet" runat="server" PostBackUrl="~/Profesor/ImportarTareasDataset.aspx">Importar v. DataSet</asp:LinkButton>
                    <br />
                </td>
                <td style="background-color:silver;text-align:center">MENU DEL PROFESOR</td>
            </tr>            
        </table>
    
        </div>
    </form>
</body>
</html>
