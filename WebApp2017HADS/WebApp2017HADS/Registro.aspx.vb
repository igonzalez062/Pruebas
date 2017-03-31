Public Class Registro
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ButtonRegistrar_Click(sender As Object, e As EventArgs) Handles ButtonRegistrar.Click
        Dim resultado As String
        Dim contraseñamod As String

        contraseñamod = getMd5Hash(TextBoxContraseña.Text)
        resultado = LibreriaFunciones.Funciones.insertarUsuario(TextBoxEmail.Text, TextBoxNombre.Text, TextBoxApellidos.Text, TextBoxDNI.Text, contraseñamod, TextBoxPreguntaSecreta.Text, TextBoxRespuestaSecreta.Text)

        If resultado = "OK" Then
            Response.Redirect("./ResultadoRegistroHecho.aspx?state=ok")
        Else
            Response.Redirect("./ResultadoRegistroHecho.aspx?state=error")
        End If
    End Sub

    Protected Sub ButtonVolver_Click(sender As Object, e As EventArgs) Handles ButtonVolver.Click
        Response.Redirect("./Inicio.aspx")
    End Sub

    'Hash an input string and return the hash as a 32 character hexadecimal string.
    Function getMd5Hash(ByVal input As String) As String
        ' Create a new instance of the MD5CryptoServiceProvider object.
        Dim md5Hasher As New System.Security.Cryptography.MD5CryptoServiceProvider()

        ' Convert the input string to a byte array and compute the hash.
        Dim data As Byte() = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input))

        ' Create a new Stringbuilder to collect the bytes and create a string.
        Dim sBuilder As New StringBuilder()

        ' Loop through each byte of the hashed data and format each one as a hexadecimal string.
        Dim i As Integer
        For i = 0 To data.Length - 1
            sBuilder.Append(data(i).ToString("x2"))
        Next i

        ' Return the hexadecimal string.
        Return sBuilder.ToString()
    End Function

End Class