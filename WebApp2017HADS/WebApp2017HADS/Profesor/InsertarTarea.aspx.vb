﻿Imports System.Data.SqlClient
Public Class InsertarTarea
    Inherits System.Web.UI.Page

    Dim conClsf As SqlConnection = New SqlConnection("Data Source=1617hads20f2.database.windows.net;Initial Catalog=HADS20_F2;User ID=hads20@1617hads20f2;Password=Ballena1")

    Dim dapTareasProfesor As New SqlDataAdapter()
    Dim dstTareasProfesor As New DataSet
    Dim tblTareasProfesor As New DataTable
    Dim rowTareasProfesor As DataRow

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack Then
            dstTareasProfesor = Session("TareasProfesor")
        Else
            dapTareasProfesor = New SqlDataAdapter("SELECT * FROM TareasGenericas WHERE CodAsig='" & DropDownListAsignaturas.SelectedValue & "'", conClsf)
            Dim bldTareasUser As New SqlCommandBuilder(dapTareasProfesor)
            dapTareasProfesor.Fill(dstTareasProfesor, "TareasProfesor")
            tblTareasProfesor = dstTareasProfesor.Tables("TareasProfesor")

            Session("TareasProfesor") = dstTareasProfesor
            Session("AdapterTareasProfesor") = dapTareasProfesor
        End If

        LabelUser.Text = Session("UserID")
    End Sub

    Protected Sub ButtonAñadirTarea_Click(sender As Object, e As EventArgs) Handles ButtonAñadirTarea.Click
        If TextBoxCodigo.Text = "" Or TextBoxDescripcion.Text = "" Or TextBoxHorasEstimadas.Text = "" Then
            LabelError.Text = "Hay algún campo vacio y no puedo rellenar la tabla"
        Else
            Try
                tblTareasProfesor = dstTareasProfesor.Tables("TareasProfesor")
                rowTareasProfesor = tblTareasProfesor.NewRow()

                rowTareasProfesor("Codigo") = TextBoxCodigo.Text
                rowTareasProfesor("Descripcion") = TextBoxDescripcion.Text
                rowTareasProfesor("CodAsig") = DropDownListAsignaturas.SelectedValue
                rowTareasProfesor("HEstimadas") = TextBoxHorasEstimadas.Text
                rowTareasProfesor("Explotacion") = False
                rowTareasProfesor("TipoTarea") = DropDownListTipoTarea.SelectedValue
                tblTareasProfesor.Rows.Add(rowTareasProfesor)

                dapTareasProfesor = Session("AdapterTareasProfesor")
                dapTareasProfesor.Update(dstTareasProfesor, "TareasProfesor")
                dstTareasProfesor.AcceptChanges()

                LabelError.Text = "Tarea Añadida y guardada en la BBDD"
            Catch
                LabelError.Text = "Error al intentar meterla a la base de datos"
            End Try

        End If
    End Sub

    Protected Sub LinkButtonCerrarSesion_Click(sender As Object, e As EventArgs) Handles LinkButtonCerrarSesion.Click
        Session.Abandon()
        System.Web.Security.FormsAuthentication.SignOut()
        Response.Redirect("~/Inicio.aspx")
    End Sub

End Class