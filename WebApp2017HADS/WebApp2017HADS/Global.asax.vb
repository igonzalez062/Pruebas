Imports System.Web.SessionState

Public Class Global_asax
    Inherits System.Web.HttpApplication

    Public Class Alumno
        Public Property email As String

        Public Sub New()

        End Sub

        Public Sub New(ByVal email As String)
            email = email
        End Sub
    End Class

    Public Class Profesor
        Public Property email As String

        Public Sub New()

        End Sub

        Public Sub New(ByVal email As String)
            email = email
        End Sub
    End Class

    Dim Alumnos As New List(Of Alumno)
    Dim Profesores As New List(Of Profesor)

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al iniciar la aplicación
        Application("numeroAlumnos") = 0
        Application("numeroProfesores") = 0
        Alumnos.Clear()
        Profesores.Clear()
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al iniciar la sesión
        'If Session("tipoUser") = "P" Then
        Application("numeroProfesores") = Application("numeroProfesores") + 1
        'ElseIf Session("tipoUser") = "A" Then
        Application("numeroAlumnos") = Application("numeroAlumnos") + 1
        'End If
    End Sub

    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al comienzo de cada solicitud
    End Sub

    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al intentar autenticar el uso
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena cuando se produce un error
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena cuando finaliza la sesión
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena cuando finaliza la aplicación
    End Sub

End Class