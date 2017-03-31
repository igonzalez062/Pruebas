Public Class Profesor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LabelUser.Text = Session("UserID")
        If Session("UserID") = "vadillo@ehu.es" Then
            LinkButtonExportar.Enabled = True
        Else
            LinkButtonExportar.Enabled = False
        End If
    End Sub

    
    Protected Sub LinkButtonCerrarSesion_Click(sender As Object, e As EventArgs) Handles LinkButtonCerrarSesion.Click
        Session.Abandon()
        System.Web.Security.FormsAuthentication.SignOut()
        Response.Redirect("~/Inicio.aspx")
    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        Label1.Text = Application("numeroProfesores")
        Label2.Text = Application("numeroAlumnos")
    End Sub
End Class