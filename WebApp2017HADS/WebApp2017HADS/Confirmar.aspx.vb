Public Class Confirmar
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim email As String
        Dim NumConf As String
        Dim resultado As String

        email = Request.QueryString("mbr")
        NumConf = Request.QueryString("numconf")

        resultado = LibreriaFunciones.Funciones.confirmarUsuario(email, NumConf)
        If resultado = "OK" Then
            Label1.Text = "CUENTA ACTIVADA CORRECTAMENTE"
        ElseIf resultado = "ERRORVERIFICACION" Then
            Label1.Text = "NO SE HA PODIDO ACTIVAR LA CUENTA"
        ElseIf resultado = "ERRORAPERTURADECONEXION" Then
            Label1.Text = "HA HABIDO ALGUN ERROR EN LA APERTURA DE LA CONEXION"
        End If
    End Sub

    Protected Sub LinkButtonInicio_Click(sender As Object, e As EventArgs) Handles LinkButtonInicio.Click

    End Sub
End Class