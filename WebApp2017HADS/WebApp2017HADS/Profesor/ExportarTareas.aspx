<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ExportarTareas.aspx.vb" Inherits="WebApp2017HADS.ExportarTareas" %>

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
                    <br /> PROFESOR - EXPORTACIÓN DE TAREAS GENÉRICAS <br /><br />
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
        <asp:Label ID="Label1" runat="server" Text="Seleccionar Asignatura:"></asp:Label>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="ButtonExportarXML" runat="server" Text="EXPORTAR XML" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonExportarJSON" runat="server" Text="EXPORTAR JSON" />
        <br />
        <br />
        <asp:Label ID="LabelExportacionResult" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <asp:GridView ID="GridViewTareas" runat="server" EmptyDataText="No hay tareas en esta asignatura">
        </asp:GridView>
        <br />
        <br />
        <asp:LinkButton ID="LinkButtonMenuProfesor" runat="server" PostBackUrl="~/Profesor/Profesor.aspx">Menu Profesor</asp:LinkButton>
        <br />
        <br />


    </div>
    </form>
</body>
</html>
