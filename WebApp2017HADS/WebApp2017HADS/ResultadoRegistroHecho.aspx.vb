Public Class RegistroHecho
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim estado As String

        estado = Request.QueryString("state")

        If estado = "ok" Then
            Label1.Text = "Se ha enviado un correo electronico con un link para activar tu cuenta. Verificalo"
        ElseIf estado = "error" Then
            Label1.Text = "ERROR. No se ha podido dar de alta el usuario, esta cuenta ya existe!!!"
        End If
    End Sub

    Protected Sub LinkButtonInicio_Click(sender As Object, e As EventArgs) Handles LinkButtonInicio.Click

    End Sub
End Class