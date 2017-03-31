<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ModificarUsers.aspx.vb" Inherits="WebApp2017HADS.ModificarUsers" %>

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
        ADMIN - MODIFICAR USUARIOS
        <br /><br />
    </p>
                </td>
            </tr>
        </table>
    </div>


    <br />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS20_F2ConnectionString %>" SelectCommand="SELECT [email], [nombre], [pregunta], [respuesta], [dni], [grupo], [tipo], [pass] FROM [Usuarios] WHERE ([email] != 'admin@admin.es') " UpdateCommand="UPDATE Usuarios
            SET tipo=@Tipo
            WHERE email=@Email">
            <UpdateParameters>
                <asp:Parameter Name="Tipo" />
                <asp:Parameter Name="Email" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="email" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="email" HeaderText="email" ReadOnly="True" SortExpression="email" />
                <asp:BoundField DataField="nombre" HeaderText="nombre" ReadOnly="True" SortExpression="nombre" />
                <asp:BoundField DataField="pregunta" HeaderText="pregunta" ReadOnly="True" SortExpression="pregunta" />
                <asp:BoundField DataField="respuesta" HeaderText="respuesta" ReadOnly="True" SortExpression="respuesta" />
                <asp:BoundField DataField="dni" HeaderText="dni" ReadOnly="True" SortExpression="dni" />
                <asp:BoundField DataField="grupo" HeaderText="grupo" ReadOnly="True" SortExpression="grupo" />
                <asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
                <asp:BoundField DataField="pass" HeaderText="pass" ReadOnly="True" SortExpression="pass" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Admin/Admin.aspx">Volver al Menu</asp:LinkButton>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />

    </form>
</body>
</html>
