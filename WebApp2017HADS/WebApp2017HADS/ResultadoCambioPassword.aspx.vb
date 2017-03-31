Public Class CambioPassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim estado As String

        estado = Request.QueryString("state")

        If estado = "ok" Then
            Label1.Text = "Contraseña cambiada correctamente"
        ElseIf estado = "errorcambio" Then
            Label1.Text = "ERROR. No se ha podido cambiar la contraseña!!!"
        ElseIf estado = "errorrespuestaincorrecta" Then
            Label1.Text = "ERROR. La respuesta a la pregunta es incorrecta!!!"
        ElseIf estado = "erroraperturabbdd" Then
            Label1.Text = "ERROR. Ha habido un problema al abrir la BBDD!!!"
        End If
    End Sub

    Protected Sub LinkButtonInicio_Click(sender As Object, e As EventArgs) Handles LinkButtonInicio.Click

    End Sub
End Class