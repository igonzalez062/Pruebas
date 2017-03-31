<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TareasAlumno.aspx.vb" Inherits="WebApp2017HADS.TareasAlumno" %>

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
                                <asp:Label ID="LabelUser" runat="server"></asp:Label><br />                            
                                <asp:LinkButton ID="LinkButton1" runat="server">Cerrar Sesion</asp:LinkButton>
                            </td>
                        </tr>
                     </table>                   
                </td>
                <td style="width:80%;">
    <p style="text-align: center; font-size: x-large; font-style: normal; font-variant: small-caps; color: #FF0000; background-color: #C0C0C0; font-weight: bold;"> 
        <br />
        ALUMNOS - GESTION DE TAREAS GENÉRICAS
        <br /><br />
    </p>
                </td>
            </tr>
        </table>
    
    </div>
    <p style="text-align: center"> 
        Seleccionar asignatura (solo se muestran aquellas en las está matriculado)</p>
        <p style="text-align: center"> 
            <asp:DropDownList ID="DropDownListAsignaturas" runat="server" AutoPostBack="True">
            </asp:DropDownList>
        </p>
        <p style="text-align: center"> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:GridView ID="GridViewTareas" runat="server" HorizontalAlign="Center" EmptyDataText="No tienes tareas para instanciar">
                <AlternatingRowStyle BackColor="#FF9933" />
                <Columns>
                    <asp:CommandField ButtonType="Button" SelectText="Instanciar" ShowCancelButton="False" ShowSelectButton="True" />
                </Columns>
                <HeaderStyle BackColor="#FF66CC" />
            </asp:GridView>
        </p>
    </form>
    

</body>
</html>
