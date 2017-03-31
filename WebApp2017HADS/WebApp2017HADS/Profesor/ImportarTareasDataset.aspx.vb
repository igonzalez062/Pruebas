Imports System.Xml
Imports System.Data.SqlClient

Public Class ImportarTareasDataset
    Inherits System.Web.UI.Page

    Dim conClsf As SqlConnection = New SqlConnection("Data Source=1617hads20f2.database.windows.net;Initial Catalog=HADS20_F2;User ID=hads20@1617hads20f2;Password=Ballena1")

    Dim dapTareas As New SqlDataAdapter()
    Dim dstTareas As New DataSet
    Dim tblTareas As New DataTable
    Dim rowTareas As DataRow

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LabelUser.Text = Session("UserID")
    End Sub

    Protected Sub LinkButtonCerrarSesion_Click(sender As Object, e As EventArgs) Handles LinkButtonCerrarSesion.Click
        Session.Abandon()
        System.Web.Security.FormsAuthentication.SignOut()
        Response.Redirect("~/Inicio.aspx")
    End Sub

    Private Sub DropDownList1_DataBound(sender As Object, e As EventArgs) Handles DropDownList1.DataBound
        Dim exists As Boolean

        exists = System.IO.File.Exists(Server.MapPath("~/App_Data/" & DropDownList1.SelectedValue & ".xml"))
        LabelBBDD.Text = ""
        LabelError.Text = ""
        If exists Then
            ButtonImportarDataset.Enabled = True
            dstTareas.ReadXml(Server.MapPath("~/App_Data/" & DropDownList1.SelectedValue & ".xml"))
            GridView1.DataSource = dstTareas
            GridView1.DataBind()
            Session("dset") = dstTareas
        Else
            ButtonImportarDataset.Enabled = False
            LabelError.Text = "El fichero no existe"
        End If
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        Dim exists As Boolean

        exists = System.IO.File.Exists(Server.MapPath("~/App_Data/" & DropDownList1.SelectedValue & ".xml"))
        LabelBBDD.Text = ""
        LabelError.Text = ""
        If exists Then
            ButtonImportarDataset.Enabled = True
            dstTareas.ReadXml(Server.MapPath("~/App_Data/" & DropDownList1.SelectedValue & ".xml"))
            GridView1.DataSource = dstTareas
            GridView1.DataBind()
            Session("dset") = dstTareas
        Else
            ButtonImportarDataset.Enabled = False
            LabelError.Text = "El fichero no existe"
        End If
    End Sub

    Protected Sub ButtonImportarDataset_Click(sender As Object, e As EventArgs) Handles ButtonImportarDataset.Click
        dapTareas = New SqlDataAdapter("SELECT * FROM TareasGenericas WHERE TareasGenericas.CodAsig='" & DropDownList1.SelectedValue & "'", conClsf)
        Dim bldTareas As New SqlCommandBuilder(dapTareas)
        Dim row As DataRow
        Dim j As Integer
        Dim table As DataTable

        dstTareas = Session("dset")
        table = dstTareas.Tables("tarea")

        If table.Columns.Contains("CodAsig") Then

        Else
            table.Columns.Add("CodAsig")
        End If
        
        For j = 0 To table.Rows.Count - 1
            row = table.Rows(j)
            row("CodAsig") = DropDownList1.SelectedValue
        Next

        Try
            dapTareas.Update(dstTareas, "tarea")
            dstTareas.AcceptChanges()
            LabelBBDD.Text = "Guardado el XML en la BBDD"
        Catch ex As Exception
            LabelBBDD.Text = "Error al guardar. Ya habra algun dato guardado"
        End Try
    End Sub


End Class