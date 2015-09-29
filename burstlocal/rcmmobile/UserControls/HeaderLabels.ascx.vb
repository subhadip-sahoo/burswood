Imports mRCMAPI
Partial Class HeaderLabels
  Inherits System.Web.UI.UserControl
  Public Property LabelImage() As String
    Get
      Return formheadertext.ImageUrl
    End Get
    Set(ByVal value As String)
      formheadertext.ImageUrl = value
    End Set
  End Property

  Public Property labelLeftText() As String
    Get
      Return lblLeft.Text
    End Get
    Set(ByVal value As String)
      lblLeft.Text = value
    End Set
  End Property
  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    'Dim oSessioncl As New Sessioncl
    'StepTitle.Style.Value = oSessioncl.bgThemeColor
    If LabelImage = "" Then
      formheadertext.Visible = False
    End If
  End Sub
End Class
