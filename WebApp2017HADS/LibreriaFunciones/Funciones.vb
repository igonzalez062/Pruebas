Imports System.Net.Mail

Public Class Funciones
    Public Shared Function insertarUsuario(ByVal email As String, ByVal nombre As String, ByVal apellidos As String, ByVal dni As String, ByVal password As String, ByVal preguntasecreta As String, ByVal respuestasecreta As String) As String
        Dim NumConf As Integer
        Dim resconectar As String
        Dim resultinsertar As Boolean

        Randomize()
        NumConf = CLng(Rnd() * 9000000) + 1000000

        resconectar = LibreriaAccesoDatos.accesodatosSQL.conectar()
        If resconectar = "OK" Then
            resultinsertar = LibreriaAccesoDatos.accesodatosSQL.insertarUsuario(email, nombre, apellidos, dni, password, preguntasecreta, respuestasecreta, NumConf)
            LibreriaAccesoDatos.accesodatosSQL.cerrarconexion()
            If resultinsertar Then
                enviarEmail(email, NumConf)
                Return "OK"
            Else
                Return "ERROR"
            End If
        Else
            Return "ERROR"
        End If

    End Function

    Public Shared Function enviarEmail(ByVal email As String, ByVal NumConf As Integer) As Boolean
        Try
            'Direccion de origen
            Dim from_address As New MailAddress("1617HADS20@gmail.com", "1617HADS20")
            'Direccion de destino
            Dim to_address As New MailAddress(email)
            'Password de la cuenta
            Dim from_pass As String = "Ballena20"
            'Objeto para el cliente smtp 
            Dim smtp As New SmtpClient
            'Host en este caso el servidor de gmail
            smtp.Host = "smtp.gmail.com"
            'Puerto
            smtp.Port = 587
            'SSL activado para que se manden correos de manera segura
            smtp.EnableSsl = True
            'No usar los credenciales por defecto ya que si no no funciona
            smtp.UseDefaultCredentials = False
            'Credenciales
            smtp.Credentials = New System.Net.NetworkCredential(from_address.Address, from_pass)
            'Creamos el mensaje con los parametros de origen y destino
            Dim message As New MailMessage(from_address, to_address)
            'Añadimos el asunto
            message.Subject = "ALTA CUENTA"
            'Concatenamos el cuerpo del mensaje a la plantilla
            Dim link As String
            'LINK PARA LOCAL
            'link = String.Concat("http://localhost:1231/confirmar.aspx?mbr=", email, "&numconf=", CStr(NumConf))
            'LINK PARA AZURE
            link = String.Concat("http://2017hads20f2.azurewebsites.net/confirmar.aspx?mbr=", email, "&numconf=", CStr(NumConf))
            message.Body = "<html><head></head><body>" + "Por favor, activa la cuenta clickando en el link. <br />" + "<a href>" + link + "</a>" + "</body></html>"
            'Definimos el cuerpo como html para poder escojer mejor como lo mandamos
            message.IsBodyHtml = True
            'Se envia el correo
            smtp.Send(message)
        Catch e As Exception
            Return False
        End Try
        Return True
    End Function

    Public Shared Function loginUsuario(ByVal username As String, ByVal password As String) As String
        Dim resconectar, esta3 As String
        Dim esta, esta2 As Boolean

        resconectar = LibreriaAccesoDatos.accesodatosSQL.conectar()
        If resconectar = "OK" Then
            esta = LibreriaAccesoDatos.accesodatosSQL.comprobarSiEstaEmail(username)
            If esta Then
                esta2 = LibreriaAccesoDatos.accesodatosSQL.comprobarUsuario(username, password)
                If esta2 Then
                    esta3 = LibreriaAccesoDatos.accesodatosSQL.tipoUsuarioLogin(username)
                    LibreriaAccesoDatos.accesodatosSQL.cerrarconexion()
                    Return esta3
                Else
                    LibreriaAccesoDatos.accesodatosSQL.cerrarconexion()
                    Return "ERRORDATOSINCORRECTOS"
                End If
            Else
                LibreriaAccesoDatos.accesodatosSQL.cerrarconexion()
                Return "ERRORNOUSER"
            End If
        Else
            Return "ERRORAPERTURADECONEXION"
        End If
    End Function

    Public Shared Function confirmarUsuario(ByVal email As String, ByVal numconf As String) As String
        Dim resconectar As String
        Dim esta As Boolean

        resconectar = LibreriaAccesoDatos.accesodatosSQL.conectar()
        If resconectar = "OK" Then
            esta = LibreriaAccesoDatos.accesodatosSQL.confirmarUsuario(email, numconf)
            LibreriaAccesoDatos.accesodatosSQL.cerrarconexion()
            If esta Then
                Return "OK"
            Else
                Return "ERRORVERIFICACION"
            End If
        Else
            Return "ERRORAPERTURADECONEXION"
        End If
    End Function

    Public Shared Function comprobarUsuario(ByVal username As String) As String
        Dim resconectar As String
        Dim esta As Boolean

        resconectar = LibreriaAccesoDatos.accesodatosSQL.conectar()
        If resconectar = "OK" Then
            esta = LibreriaAccesoDatos.accesodatosSQL.comprobarSiEstaEmail(username)
            LibreriaAccesoDatos.accesodatosSQL.cerrarconexion()
            If esta Then
                Return "OK"
            Else
                Return "ERRORNOUSER"
            End If
        Else
            Return "ERRORAPERTURADECONEXION"
        End If
    End Function

    Public Shared Function comprobarRespuestaCambiarPassword(ByVal username As String) As String
        Dim resconectar, esta2 As String
        Dim esta As Boolean

        resconectar = LibreriaAccesoDatos.accesodatosSQL.conectar()
        If resconectar = "OK" Then
            esta = LibreriaAccesoDatos.accesodatosSQL.comprobarSiEstaEmail(username)
            If esta Then
                esta2 = LibreriaAccesoDatos.accesodatosSQL.obtenerPregunta(username)
                LibreriaAccesoDatos.accesodatosSQL.cerrarconexion()
                Return esta2
            Else
                LibreriaAccesoDatos.accesodatosSQL.cerrarconexion()
                Return "ERRORNOUSER"
            End If
        Else
            LibreriaAccesoDatos.accesodatosSQL.cerrarconexion()
            Return "ERRORAPERTURADECONEXION"
        End If
    End Function

    Public Shared Function cambiarPassword(ByVal username As String, ByVal RespuestaSecreta As String, ByVal NewPassword As String) As String
        Dim resconectar As String
        Dim comprobacionRespuestaSecreta, resultadoCambioPassword As Boolean

        resconectar = LibreriaAccesoDatos.accesodatosSQL.conectar()
        If resconectar = "OK" Then
            comprobacionRespuestaSecreta = LibreriaAccesoDatos.accesodatosSQL.comprobarRespuestaSecreta(username, RespuestaSecreta)
            If comprobacionRespuestaSecreta Then
                resultadoCambioPassword = LibreriaAccesoDatos.accesodatosSQL.cambiarPasswordUsuario(username, NewPassword)
                LibreriaAccesoDatos.accesodatosSQL.cerrarconexion()
                If resultadoCambioPassword Then
                    Return "OK"
                Else
                    Return "ERRORCAMBIO"
                End If
            Else
                LibreriaAccesoDatos.accesodatosSQL.cerrarconexion()
                Return "ERRORRESPUESTAINCORRECTA"
            End If
        Else
            Return "ERRORAPERTURADECONEXION"
        End If
    End Function



End Class
