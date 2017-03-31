Public Class Inicio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub BotonLogin_Click(sender As Object, e As EventArgs) Handles BotonLogin.Click
        Dim resultado As String
        Dim contraseñamod As String

        contraseñamod = getMd5Hash(TextBoxContraseña.Text)
        resultado = LibreriaFunciones.Funciones.loginUsuario(TextBoxEmail.Text, contraseñamod)
        If resultado = "P" Then
            If TextBoxEmail.Text = "vadillo@ehu.es" Then
                System.Web.Security.FormsAuthentication.SetAuthCookie("vadillo", False)
            Else
                System.Web.Security.FormsAuthentication.SetAuthCookie("profesor", False)
            End If
            Session("tipoUser") = "P"
            Session("UserID") = TextBoxEmail.Text
            Response.Redirect("./Profesor/Profesor.aspx")
        ElseIf resultado = "A" Then
            Session("tipoUser") = "A"
            Session("UserID") = TextBoxEmail.Text
            System.Web.Security.FormsAuthentication.SetAuthCookie("alumno", False)
            Response.Redirect("./Alumno/Alumno.aspx")
        ElseIf resultado = "Q" Then
            Session("UserID") = TextBoxEmail.Text
            System.Web.Security.FormsAuthentication.SetAuthCookie("admin", False)
            Response.Redirect("./Admin/Admin.aspx")
        ElseIf resultado = "ERRORDATOSINCORRECTOS" Then
            LabelError.Text = "DATOS INCORRECTOS"
        ElseIf resultado = "ERRORNOUSER" Then
            LabelError.Text = "NO EXISTE ESE USUARIO"
        ElseIf resultado = "ERRORAPERTURADECONEXION" Then
            LabelError.Text = "ERROR EN LA APERTURA DE LA CONEXION"
        End If
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