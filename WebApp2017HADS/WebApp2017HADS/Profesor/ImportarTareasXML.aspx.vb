Imports System.Xml
Imports System.Data.SqlClient

Public Class ImportarTareasXML
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
            ButtonImportarXMLD.Enabled = True
            Xml1.DocumentSource = Server.MapPath("~/App_Data/" & DropDownList1.SelectedValue & ".xml")
            Xml1.TransformSource = Server.MapPath("~/App_Data/XSLTFile.xsl")
        Else
            ButtonImportarXMLD.Enabled = False
            LabelError.Text = "El fichero no existe"
        End If
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        Dim exists As Boolean

        exists = System.IO.File.Exists(Server.MapPath("~/App_Data/" & DropDownList1.SelectedValue & ".xml"))
        LabelBBDD.Text = ""
        LabelError.Text = ""
        If exists Then
            ButtonImportarXMLD.Enabled = True
            Xml1.DocumentSource = Server.MapPath("~/App_Data/" & DropDownList1.SelectedValue & ".xml")
            Xml1.TransformSource = Server.MapPath("~/App_Data/XSLTFile.xsl")
        Else
            ButtonImportarXMLD.Enabled = False
            LabelError.Text = "El fichero no existe"
        End If

    End Sub

    Protected Sub ButtonImportarXMLD_Click(sender As Object, e As EventArgs) Handles ButtonImportarXMLD.Click
        dapTareas = New SqlDataAdapter("SELECT * FROM TareasGenericas WHERE TareasGenericas.CodAsig='" & DropDownList1.SelectedValue & "'", conClsf)
        Dim bldTareas As New SqlCommandBuilder(dapTareas)

        dstTareas.Clear()
        dapTareas.Fill(dstTareas, "Tareas")
        tblTareas = dstTareas.Tables("Tareas")

        Dim xd As New XmlDocument
        xd.Load(Server.MapPath("~/App_Data/" & DropDownList1.SelectedValue & ".xml"))
        Dim LasTareasDelXML As XmlNodeList
        LasTareasDelXML = xd.GetElementsByTagName("tarea")
        Dim i As Integer
        Dim j As Integer
        Dim encontrado As Boolean
        Dim row As DataRow
        For i = 0 To LasTareasDelXML.Count - 1
            encontrado = False
            For j = 0 To tblTareas.Rows.Count - 1
                row = tblTareas.Rows(j)
                If StrComp(CStr(row("Codigo")), LasTareasDelXML(i).ChildNodes(0).ChildNodes(0).Value) = 0 Then
                    encontrado = True
                    Exit For
                End If
            Next

            If encontrado = False Then
                rowTareas = tblTareas.NewRow()

                rowTareas("Codigo") = LasTareasDelXML(i).ChildNodes(0).ChildNodes(0).Value
                rowTareas("Descripcion") = LasTareasDelXML(i).ChildNodes(1).ChildNodes(0).Value
                rowTareas("CodAsig") = DropDownList1.SelectedValue
                rowTareas("HEstimadas") = LasTareasDelXML(i).ChildNodes(2).ChildNodes(0).Value
                rowTareas("Explotacion") = LasTareasDelXML(i).ChildNodes(3).ChildNodes(0).Value
                rowTareas("TipoTarea") = LasTareasDelXML(i).ChildNodes(4).ChildNodes(0).Value

                tblTareas.Rows.Add(rowTareas)
            End If
        Next

        dapTareas.Update(dstTareas, "Tareas")
        dstTareas.AcceptChanges()

        Xml1.DocumentSource = Server.MapPath("~/App_Data/" & DropDownList1.SelectedValue & ".xml")
        Xml1.TransformSource = Server.MapPath("~/App_Data/XSLTFile.xsl")

        LabelBBDD.Text = "Guardado el XML en la BBDD"

    End Sub

    Protected Sub ButtonOrdenarPorCodigo_Click(sender As Object, e As EventArgs) Handles ButtonOrdenarPorCodigo.Click
        Xml1.DocumentSource = Server.MapPath("~/App_Data/" & DropDownList1.SelectedValue & ".xml")
        Xml1.TransformSource = Server.MapPath("~/App_Data/XSLTFileCodigo.xslt")
    End Sub

    Protected Sub ButtonOrdenarPorDescripcion_Click(sender As Object, e As EventArgs) Handles ButtonOrdenarPorDescripcion.Click
        Xml1.DocumentSource = Server.MapPath("~/App_Data/" & DropDownList1.SelectedValue & ".xml")
        Xml1.TransformSource = Server.MapPath("~/App_Data/XSLTFileDescripcion.xslt")
    End Sub

    Protected Sub ButtonOrdenarPorHEstimadas_Click(sender As Object, e As EventArgs) Handles ButtonOrdenarPorHEstimadas.Click
        Xml1.DocumentSource = Server.MapPath("~/App_Data/" & DropDownList1.SelectedValue & ".xml")
        Xml1.TransformSource = Server.MapPath("~/App_Data/XSLTFileHEstimadas.xslt")
    End Sub
End Class