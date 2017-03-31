﻿Imports System.Data.SqlClient
Public Class TareasAlumno
    Inherits System.Web.UI.Page

    'Conexion
    Dim conClsf As SqlConnection = New SqlConnection("Data Source=1617hads20f2.database.windows.net;Initial Catalog=HADS20_F2;User ID=hads20@1617hads20f2;Password=Ballena1")

    Dim dapAsignaturas As New SqlDataAdapter()
    Dim dstAsignaturas As New DataSet
    Dim tblAsignaturas As New DataTable
    Dim rowAsignaturas As DataRow

    Dim dapTareas As New SqlDataAdapter()
    Dim dstTareas As New DataSet
    Dim tblTareas As New DataTable
    Dim rowTareas As DataRow

    Dim dvTareas As DataView

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack Then
            dstAsignaturas = Session("Asignaturas")
            dstTareas = Session("Tareas")


        Else
            'dapAsignaturas = New SqlDataAdapter("select * from Asignaturas", conClsf)
            dapAsignaturas = New SqlDataAdapter("SELECT * FROM Asignaturas INNER JOIN GruposClase ON GruposClase.codigoasig = Asignaturas.codigo INNER JOIN EstudiantesGrupo ON EstudiantesGrupo.Grupo = GruposClase.codigo WHERE EstudiantesGrupo.Email = '" & Session("UserID") & "'", conClsf)
            Dim bldAsignaturas As New SqlCommandBuilder(dapAsignaturas)
            dapAsignaturas.Fill(dstAsignaturas, "Asignaturas")
            tblAsignaturas = dstAsignaturas.Tables("Asignaturas")

            DropDownListAsignaturas.DataSource = tblAsignaturas
            DropDownListAsignaturas.DataValueField = "codigo"
            DropDownListAsignaturas.DataTextField = "codigo"
            DropDownListAsignaturas.DataBind()

            Session("Asignaturas") = dstAsignaturas
            Session("AdapterAsignaturas") = dapAsignaturas

            'dapAsignaturas = New SqlDataAdapter("select * from Asignaturas", conClsf)
            dapTareas = New SqlDataAdapter("SELECT TareasGenericas.Codigo,TareasGenericas.Descripcion,TareasGenericas.HEstimadas,TareasGenericas.TipoTarea FROM TareasGenericas WHERE TareasGenericas.CodAsig='" & DropDownListAsignaturas.SelectedValue & "' AND TareasGenericas.Explotacion='True' AND TareasGenericas.Codigo NOT IN (SELECT EstudiantesTareas.CodTarea FROM EstudiantesTareas INNER JOIN TareasGenericas ON EstudiantesTareas.CodTarea = TareasGenericas.Codigo WHERE EstudiantesTareas.Email='" & Session("UserID") & "' AND TareasGenericas.CodAsig='" & DropDownListAsignaturas.SelectedValue & "')", conClsf)
            Dim bldTareas As New SqlCommandBuilder(dapTareas)

            dstTareas.Clear()
            dapTareas.Fill(dstTareas, "Tareas")
            tblTareas = dstTareas.Tables("Tareas")

            dvTareas = dstTareas.Tables(0).DefaultView

            GridViewTareas.DataSource = dvTareas
            GridViewTareas.DataBind()

            Session("Tareas") = dstTareas
            Session("AdapterTareas") = dapTareas
        End If

        LabelUser.Text = Session("UserID")
    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Session.Abandon()
        System.Web.Security.FormsAuthentication.SignOut()
        Response.Redirect("~/Inicio.aspx")
    End Sub

    Protected Sub DropDownListAsignaturas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownListAsignaturas.SelectedIndexChanged
        tblTareas.Rows.Clear()

        dapTareas = New SqlDataAdapter("SELECT TareasGenericas.Codigo,TareasGenericas.Descripcion,TareasGenericas.HEstimadas,TareasGenericas.TipoTarea FROM TareasGenericas WHERE TareasGenericas.CodAsig='" & DropDownListAsignaturas.SelectedValue & "' AND TareasGenericas.Explotacion='True' AND TareasGenericas.Codigo NOT IN (SELECT EstudiantesTareas.CodTarea FROM EstudiantesTareas INNER JOIN TareasGenericas ON EstudiantesTareas.CodTarea = TareasGenericas.Codigo WHERE EstudiantesTareas.Email='" & Session("UserID") & "' AND TareasGenericas.CodAsig='" & DropDownListAsignaturas.SelectedValue & "')", conClsf)
        Dim bldTareas As New SqlCommandBuilder(dapTareas)

        dstTareas.Clear()
        dapTareas.Fill(dstTareas, "Tareas")
        tblTareas = dstTareas.Tables("Tareas")

        dvTareas = dstTareas.Tables(0).DefaultView

        GridViewTareas.DataSource = dvTareas
        GridViewTareas.DataBind()

        Session("AdapterTareas") = dapTareas
    End Sub

    Protected Sub GridViewTareas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewTareas.SelectedIndexChanged
        Response.Redirect("./InstanciarTarea.aspx?codigo=" & GridViewTareas.SelectedRow.Cells(1).Text & "&HEstimadas=" & GridViewTareas.SelectedRow.Cells(3).Text)
    End Sub
End Class