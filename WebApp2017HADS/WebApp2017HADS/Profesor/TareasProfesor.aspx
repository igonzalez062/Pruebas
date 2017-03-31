<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TareasProfesor.aspx.vb" Inherits="WebApp2017HADS.TareasProfesor" %>

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
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Label ID="Label1" runat="server" Text="Seleccionar Asignatura:"></asp:Label>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="codigo">
                </asp:DropDownList>
                &nbsp;&nbsp;<br />
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
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Codigo" DataSourceID="SqlDataSource2" EmptyDataText="No hay tareas que mostrar">
                    <AlternatingRowStyle BackColor="#66FF66" />
                    <Columns>
                        <asp:CommandField CancelText="Cancelar" DeleteText="Borrar" EditText="Editar" InsertText="Insertar" NewText="Nueva" SelectText="Seleccionar" ShowEditButton="True" UpdateText="Actualizar" />
                        <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                        <asp:BoundField DataField="CodAsig" HeaderText="CodAsig" SortExpression="CodAsig" />
                        <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" SortExpression="HEstimadas" />
                        <asp:CheckBoxField DataField="Explotacion" HeaderText="Explotacion" SortExpression="Explotacion" />
                        <asp:BoundField DataField="TipoTarea" HeaderText="TipoTarea" SortExpression="TipoTarea" />
                    </Columns>
                    <HeaderStyle BackColor="#006600" />
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HADS20_F2ConnectionString %>" SelectCommand="SELECT TareasGenericas.*
            FROM TareasGenericas 
            INNER JOIN GruposClase ON TareasGenericas.CodAsig = GruposClase.codigoasig
            INNER JOIN ProfesoresGrupo ON GruposClase.codigo = ProfesoresGrupo.codigogrupo
            WHERE TareasGenericas.CodAsig= @codasig
            AND ProfesoresGrupo.email = @email" UpdateCommand="UPDATE TareasGenericas
            SET Descripcion=@Descripcion, HEstimadas=@HEstimadas, Explotacion=@Explotacion, TipoTarea=@TipoTarea
            WHERE Codigo=@Codigo">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="codasig" PropertyName="SelectedValue" />
                        <asp:SessionParameter Name="email" SessionField="UserID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <br />
        <asp:Button ID="ButtonInsertarNuevaTarea" runat="server" Text="INSERTAR NUEVA TAREA" Height="42px" Width="187px" />
        <br />
    
    </div>
    </form>
</body>
</html>
