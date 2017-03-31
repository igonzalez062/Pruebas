Public Class CambiarPassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ButtonMostrarPreguntaSecreta_Click(sender As Object, e As EventArgs) Handles ButtonMostrarPreguntaSecreta.Click
        Dim resultado As String
        Dim pregunta As String

        resultado = LibreriaFunciones.Funciones.comprobarUsuario(TextBoxCorreo.Text)

        If resultado = "OK" Then
            LabelResul1.Text = ""
            TextBoxCorreo.Enabled = False
            ButtonMostrarPreguntaSecreta.Enabled = False
            pregunta = LibreriaFunciones.Funciones.comprobarRespuestaCambiarPassword(TextBoxCorreo.Text)
            LabelPreguntaSecreta.Text = pregunta
            TextBoxRespuestaSecreta.Enabled = True
            TextBoxNuevaContraseña.Enabled = True
            TextBoxNuevaContraseña2.Enabled = True
            ButtonConfirmarCambioContraseña.Enabled = True
        ElseIf resultado = "ERRORNOUSER" Then
            LabelResul1.Text = "No existe ese usuario"
        ElseIf resultado = "ERRORAPERTURADECONEXION" Then
            LabelResul1.Text = "Error en la apertura de la BBDD"
        End If
    End Sub

    Protected Sub ButtonConfirmarCambioContraseña_Click(sender As Object, e As EventArgs) Handles ButtonConfirmarCambioContraseña.Click
        Dim resultado As String

        resultado = LibreriaFunciones.Funciones.cambiarPassword(TextBoxCorreo.Text, TextBoxRespuestaSecreta.Text, TextBoxNuevaContraseña.Text)
        If resultado = "OK" Then
            Response.Redirect("./ResultadoCambioPassword.aspx?state=ok")
        Else
            If resultado = "ERRORCAMBIO" Then
                Response.Redirect("./ResultadoCambioPassword.aspx?state=errorcambio")
            ElseIf resultado = "ERRORRESPUESTAINCORRECTA" Then
                Response.Redirect("./ResultadoCambioPassword.aspx?state=errorrespuestaincorrecta")
            ElseIf resultado = "ERRORAPERTURADECONEXION" Then
                Response.Redirect("./ResultadoCambioPassword.aspx?state=erroraperturabbdd")
            End If
        End If

    End Sub
End Class