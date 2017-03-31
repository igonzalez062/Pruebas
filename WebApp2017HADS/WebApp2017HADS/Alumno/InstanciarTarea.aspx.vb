﻿Imports System.Data.SqlClient
Public Class InstanciarTarea
    Inherits System.Web.UI.Page

    Dim conClsf As SqlConnection = New SqlConnection("Data Source=1617hads20f2.database.windows.net;Initial Catalog=HADS20_F2;User ID=hads20@1617hads20f2;Password=Ballena1")
    Dim adaptadorTarea As SqlDataAdapter = New SqlDataAdapter()

    Dim dapTareasUser As New SqlDataAdapter()
    Dim dstTareasUser As New DataSet
    Dim tblTareasUser As New DataTable
    Dim rowTareasUser As DataRow

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack Then
            dstTareasUser = Session("TareasUser")
        Else
            'dapAsignaturas = New SqlDataAdapter("select * from Asignaturas", conClsf)
            dapTareasUser = New SqlDataAdapter("SELECT * FROM EstudiantesTareas WHERE EstudiantesTareas.Email = '" & Session("UserID") & "'", conClsf)
            Dim bldTareasUser As New SqlCommandBuilder(dapTareasUser)
            dapTareasUser.Fill(dstTareasUser, "TareasUser")
            tblTareasUser = dstTareasUser.Tables("TareasUser")

            GridViewTareasUser.DataSource = tblTareasUser
            GridViewTareasUser.DataBind()

            Session("TareasUser") = dstTareasUser
            Session("AdapterTareasUser") = dapTareasUser

        End If

        TextBoxUsuario.Text = Session("UserID")
        TextBoxTarea.Text = Request.QueryString("codigo")
        TextBoxHorasEstimadas.Text = Request.QueryString("HEstimadas")
    End Sub

    Protected Sub ButtonCrearTarea_Click(sender As Object, e As EventArgs) Handles ButtonCrearTarea.Click
        If TextBoxHorasReales.Text = "" Then
            LabelError.Text = "El valor de Horas Reales está vacio"
        Else
            Try
                tblTareasUser = dstTareasUser.Tables("TareasUser")
                rowTareasUser = tblTareasUser.NewRow()

                rowTareasUser("Email") = TextBoxUsuario.Text
                rowTareasUser("CodTarea") = TextBoxTarea.Text
                rowTareasUser("HEstimadas") = TextBoxHorasEstimadas.Text
                rowTareasUser("HReales") = TextBoxHorasReales.Text
                tblTareasUser.Rows.Add(rowTareasUser)

                GridViewTareasUser.DataSource = tblTareasUser
                GridViewTareasUser.DataBind()

                dapTareasUser = Session("AdapterTareasUser")
                dapTareasUser.Update(dstTareasUser, "TareasUser")
                dstTareasUser.AcceptChanges()

                LabelError.Text = "Tarea Añadida y guardada en la BBDD"
            Catch
                LabelError.Text = "Error al intentar meterla a la BBDD"
            End Try

        End If
    End Sub

    Protected Sub LinkButtonCerrarSesion_Click(sender As Object, e As EventArgs) Handles LinkButtonCerrarSesion.Click
        Session.Abandon()
        System.Web.Security.FormsAuthentication.SignOut()
        Response.Redirect("~/Inicio.aspx")
    End Sub
End Class