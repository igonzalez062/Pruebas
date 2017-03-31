Imports System.Data.SqlClient

Public Class accesodatosSQL
    Private Shared conexion As New SqlConnection
    Private Shared comando As New SqlCommand

    Public Shared Function conectar() As String
        Try
            'Conexion a la base de Datos de la Facultad
            'conexion.ConnectionString = "Data Source=158.227.106.20;Initial Catalog=HADS20_Usuarios;User ID=HADS20;Password=ballena"

            'Conexion a la base de Datos de Azure (Fase 2 - Usuarios + Tareas)
            conexion.ConnectionString = "Server=tcp:1617hads20f2.database.windows.net,1433;Initial Catalog=HADS20_F2;Persist Security Info=False;User ID=hads20@1617hads20f2;Password=Ballena1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30"

            conexion.Open()
        Catch ex As Exception
            Return "ERROR"
        End Try
        Return "OK"
    End Function

    Public Shared Sub cerrarconexion()
        conexion.Close()
    End Sub

    Public Shared Function insertarUsuario(ByVal email As String, ByVal nombre As String, ByVal apellidos As String, ByVal dni As String, ByVal password As String, ByVal preguntasecreta As String, ByVal respuestasecreta As String, ByVal NumConf As Integer) As Boolean
        Dim st = "insert into Usuarios (email,nombre,pregunta,respuesta,dni,numconfir,confirmado,pass) values ('" & email & "','" & nombre & "','" & preguntasecreta & "','" & respuestasecreta & "','" & dni & "','" & NumConf & "','" & False & "','" & password & "')"
        Dim numregs As Integer
        comando = New SqlCommand(st, conexion)
        Try
            numregs = comando.ExecuteNonQuery()
            If numregs = -1 Then
                Return False
            Else
                Return True
            End If
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Shared Function comprobarSiEstaEmail(ByVal email As String) As Boolean
        Dim st = "select count(*) from Usuarios where email='" & email & "'"

        comando = New SqlCommand(st, conexion)

        If comando.ExecuteScalar() = 1 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Shared Function comprobarUsuario(ByVal email As String, ByVal password As String) As Boolean
        Dim st = "select count(*) from Usuarios where email='" & email & "' AND pass='" & password & "'AND confirmado='" & True & "'"

        comando = New SqlCommand(st, conexion)

        If comando.ExecuteScalar() = 1 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Shared Function tipoUsuarioLogin(ByVal email As String) As String
        Dim reader As SqlDataReader
        Dim st = "select tipo from Usuarios where email='" & email & "'"

        comando = New SqlCommand(st, conexion)
        reader = comando.ExecuteReader()

        If reader.Read Then
            Return reader("tipo")
        Else
            Return False
        End If

    End Function

    Public Shared Function confirmarUsuario(ByVal email As String, ByVal numconf As String) As Boolean
        Try
            Dim st As String
            Dim num As Integer
            Dim numregs As Integer

            num = CInt(numconf)
            st = "UPDATE Usuarios SET confirmado=1 WHERE email='" & email & "' AND numconfir=" & num & " AND confirmado=0"

            comando = New SqlCommand(st, conexion)
            numregs = comando.ExecuteNonQuery()
            If numregs = 0 Then
                Return False
            Else
                Return True
            End If
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Shared Function obtenerPregunta(ByVal email As String) As String
        Dim reader As SqlDataReader
        Dim st = "select pregunta from Usuarios where email='" & email & "'"

        comando = New SqlCommand(st, conexion)
        reader = comando.ExecuteReader()

        If reader.Read Then
            Return reader("pregunta")
        Else
            Return False
        End If
    End Function

    Public Shared Function comprobarRespuestaSecreta(ByVal email As String, ByVal respuesta As String) As Boolean
        Dim st = "select count(*) from Usuarios where email='" & email & "' AND respuesta='" & respuesta & "'"

        comando = New SqlCommand(st, conexion)

        If comando.ExecuteScalar() = 1 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Shared Function cambiarPasswordUsuario(ByVal email As String, ByVal newpassword As String) As Boolean
        Try
            Dim st As String
            Dim numregs As Integer

            st = "UPDATE Usuarios SET pass='" & newpassword & "' WHERE email='" & email & "'"

            comando = New SqlCommand(st, conexion)
            numregs = comando.ExecuteNonQuery()
            If numregs = 0 Then
                Return False
            Else
                Return True
            End If
        Catch ex As Exception
            Return False
        End Try
    End Function

End Class
