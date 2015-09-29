Imports System.Data
Imports System.Configuration
Imports System.IO
Imports System.IO.Compression
Imports System.Net
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Xml
Namespace mRCMAPI

  Public Class IOcl
    Public sContents As String = ""

    Public Sub New()
    End Sub

    '! \brief 
    '     *  Method ReadFileContents() 
    '     * 
    '     *  \details 
    '     *  This method read file contents.
    '     *  \param[string] sFolderPath, has folder path.
    '     *  \param[enum] sFilePath, has file path.
    '     *  \param[ref string] sContents, hold the file contents.
    '    

    Public Function ReadFileContents(ByVal sFolderPath As String, ByVal sFilePath As String) As String
      Dim sPath As String = Path.Combine(sFolderPath, sFilePath)
      Me.ReadFileContents(sPath, sContents)
      Return sContents
    End Function

    '! \brief 
    '     *  \overload [(ReadFileContents())] 
    '     * 
    '     *  \details 
    '     *  This method real all the file contents.
    '     *  \param[string] sFolderPath, has folder path.
    '     *  \param[enum] sFilePath, has file path.
    '     *  \param[ref string] sContents, hold the file contents.
    '     

    Public Function ReadFileContents(ByVal sFilePath As String) As String
      If File.Exists(sFilePath) Then
        sContents = File.ReadAllText(sFilePath).ToString()
        'System.Text.Encoding.ASCII
      End If
      Return sContents
    End Function

    '! \brief 
    '     *  \overload [(ReadFileContents())] 
    '     * 
    '     *  \details 
    '     *  This method real all the file contents.
    '     *  \param[string] sFolderPath, has folder path.
    '     *  \param[enum] sFilePath, has file path.
    '     *  \param[ref string] sContents, hold the file contents.
    '     

    Public Function ReadTextFileContents(ByVal sFilePath As String) As String
      If File.Exists(sFilePath) Then
        sContents = File.OpenText(sFilePath).ToString()
        'System.Text.Encoding.ASCII
      End If
      Return sContents
    End Function

    '! \brief 
    '    *  \Method ReadWebpageResponse()
    '    * 
    '    *  \details 
    '    *  This function read the web page response.
    '    *  \param[string] sUrl,URL of the web page .
    '    *  \param[ref string] sResponse, reference of the response.
    '    

    Public Shared Sub ReadWebpageResponse(ByVal sUrl As String, ByRef sResponse As String)
      sResponse = ""
      Try
        Dim oWebRequest As HttpWebRequest = DirectCast(WebRequest.Create(sUrl), HttpWebRequest)
        Dim oWebResponse As HttpWebResponse = DirectCast(oWebRequest.GetResponse(), HttpWebResponse)
        Dim WebStream As New StreamReader(oWebResponse.GetResponseStream(), System.Text.Encoding.ASCII)
        sResponse = WebStream.ReadToEnd()
        WebStream.Close()
      Catch ex As WebException
        Throw ex
      End Try
    End Sub

    '! \brief 
    '     *  \Method ReadWebpageResponsePost()
    '     * 
    '     *  \details 
    '     *  This function read the web page response.
    '     *  \param[string] sUrl,URL of the web page .
    '     *  \param[ref string] sResponse, reference of the response.
    '     

    Public Shared Sub ReadWebpageResponsePost(ByVal sUrl As String, ByVal sPostData As String, ByRef sResponse As String)
      sResponse = ""
      Try
        Dim oWebRequest As HttpWebRequest = DirectCast(WebRequest.Create(sUrl), HttpWebRequest)
        oWebRequest.Method = "POST"
        'oWebRequest.ContentType = "text/xml";
        oWebRequest.ContentType = "application/x-www-form-urlencoded"

        Dim oStreamWriter As New StreamWriter(oWebRequest.GetRequestStream())
        oStreamWriter.Write(sPostData)
        oStreamWriter.Close()

        Dim oWebResponse As HttpWebResponse = DirectCast(oWebRequest.GetResponse(), HttpWebResponse)
        Dim WebStream As New StreamReader(oWebResponse.GetResponseStream(), System.Text.Encoding.ASCII)
        sResponse = WebStream.ReadToEnd()
        WebStream.Close()
      Catch ex As WebException
        Throw ex
      End Try
    End Sub

    '! \brief 
    '     *  \Method ReadWebpageResponseSecure()
    '     * 
    '     *  \details 
    '     *  This function read the web page response.
    '     *  \param[in] sUrl URL of the web page .
    '     *  \param[out] sResponse Reference of the response.
    '     *  \param[in] sUser  Name of the user.
    '     *  \param[in] sPassword  Password of the user.
    '     

    Public Shared Sub ReadWebpageResponseSecure(ByVal sUrl As String, ByRef sResponse As String, ByVal sUser As String, ByVal sPassword As String)
      sResponse = ""
      Try
        Dim oWebRequest As HttpWebRequest = DirectCast(WebRequest.Create(sUrl), HttpWebRequest)
        oWebRequest.Credentials = New NetworkCredential(sUser, sPassword)
        Dim oWebResponse As HttpWebResponse = DirectCast(oWebRequest.GetResponse(), HttpWebResponse)
        Dim WebStream As New StreamReader(oWebResponse.GetResponseStream(), System.Text.Encoding.ASCII)
        sResponse = WebStream.ReadToEnd()
        WebStream.Close()
      Catch ex As WebException
        Throw ex
      End Try
    End Sub

    '! \brief 
    '     *  \Method WriteContentsToFile()
    '     * 
    '     *  \details 
    '     *  This method write contents on to the file.
    '     *  \param[string] sFilePath,path of the file.
    '     *  \param[ref string] sContents, contents of the file.
    '     

    Public Shared Function WriteContentsToFile(ByVal sFilePath As String, ByVal sContents As String) As String
      File.WriteAllText(sFilePath, sContents)
      Return sContents
    End Function

    '! \brief 
    '     *  Delete file
    '     * 
    '     *  \details 
    '     *  This method checks if file exists then delete it
    '     *
    '     *  \param[string] sFilePath Absolute / Full path of the file.
    '     

    Public Shared Sub DeleteFile(ByVal sFilePath As String)
      Dim sAppPath As String = HttpContext.Current.Request.ApplicationPath
      Dim sPhysicalPath As String = HttpContext.Current.Request.MapPath(sAppPath)
      sPhysicalPath = sPhysicalPath & "\db\" & System.Web.HttpContext.Current.Session("companycode") & "\" & sFilePath
      Dim oFileInfo As New FileInfo(sPhysicalPath)
      If oFileInfo.Exists Then
        oFileInfo.Delete()
      End If
      oFileInfo = Nothing
    End Sub

    '! \brief 
    '     *  \Method FileExist
    '     * 
    '     *  \details 
    '     *  This method to check existence of file on server
    '     *  \param[string] sFilePath,path of the file.
    '     *  
    '     

    Public Shared Function FileExist(ByVal sFilePath As String) As Boolean
      Return File.Exists(HttpContext.Current.Server.MapPath(sFilePath))
    End Function


    '! \brief 
    '     *  \Method AddFilePathPhysically
    '     * 
    '     *  \details 
    '     *  This method to add file path on server 
    '     *  \param[string] sFilePath,path of the file.
    '     *  
    '     

    Public Shared Function AddFilePathPhysically(ByVal sFilePath As String) As String
      Dim sAppPath As String = HttpContext.Current.Request.ApplicationPath
      Dim sPhysicalPath As String = HttpContext.Current.Request.MapPath(sAppPath)
      sPhysicalPath = sPhysicalPath & "\db\" & System.Web.HttpContext.Current.Session("companycode") & "\" & sFilePath
      Return sPhysicalPath
    End Function

    '! \brief 
    '     *  \Method FileExistPhysically
    '     * 
    '     *  \details 
    '     *  This method to check existence of file on server 
    '     *  \param[string] sFilePath,path of the file.
    '     *  
    '     

    Public Shared Function FileExistPhysically(ByVal sFilePath As String) As Boolean
      Dim sAppPath As String = HttpContext.Current.Request.ApplicationPath
      Dim sPhysicalPath As String = HttpContext.Current.Request.MapPath(sAppPath)
      Return File.Exists((sPhysicalPath & "\db\" & System.Web.HttpContext.Current.Session("companycode") & "\" & sFilePath))
    End Function


    '! 
    '     * \brief 
    '     *  Function Compress File
    '     * 
    '     *  \details 
    '     *  This method to compresses a given File
    '     *  
    '     *  \param[ref string] sPath, path of the file.to be compressed [Refers to Compressed File after compression]
    '     *  
    '     

    Public Shared Function CompressFile(ByVal sPath As String) As String
      Dim sOutputFile As String = sPath
      Dim oFileInfo As New FileInfo(sPath)
      If oFileInfo.Exists Then
        sOutputFile = Path.Combine(oFileInfo.Directory.FullName, oFileInfo.Name & ".zip")
        Dim oCompressedFile As New GZipStream(New FileStream(sOutputFile, FileMode.Create), CompressionMode.Compress)
        Dim oInputFile As New FileStream(sPath, FileMode.Open)
        Dim btarriFileData As Byte() = New Byte(oInputFile.Length - 1) {}
        oInputFile.Read(btarriFileData, 0, btarriFileData.Length)
        oCompressedFile.Write(btarriFileData, 0, btarriFileData.Length)
        oInputFile.Close()
        oCompressedFile.Flush()
        oCompressedFile.Close()
        oCompressedFile.Dispose()
      End If
      Return sOutputFile
    End Function

    Private Sub Copy(ByVal from As Stream, ByVal [to] As Stream)
      Dim reader As TextReader = New StreamReader(from)
      Dim writer As TextWriter = New StreamWriter([to])
      writer.WriteLine(reader.ReadToEnd())

      writer.Flush()
    End Sub
    Public Shared Function GetXMLasStringFromDataSet(ByVal dsData As DataSet) As String
      Dim objStream As New MemoryStream
      dsData.WriteXml(objStream)
      Dim objXmlWriter As New XmlTextWriter(objStream, Encoding.UTF8)
      objStream = DirectCast(objXmlWriter.BaseStream, MemoryStream)
      Dim objEncoding As New UTF8Encoding()
      Return objEncoding.GetString(objStream.ToArray())
    End Function
    Public Shared Sub ReadXML(ByVal sFile As String, ByRef xDocResponse As XmlDocument)
      Dim ds As New DataSet()
      ds.ReadXml(HttpContext.Current.Request.MapPath(sFile))
      xDocResponse.LoadXml(ds.GetXml)
    End Sub
    'AndAlso IOcl.FileExistPhysically(Stringcl.GetValue(DataBinder.Eval(e.Row.DataItem, "BrandLogo"))) 
    Public Shared Function GetContextHelpLink(ByVal sFileName As String, ByVal sPageName As String,
                                              ByVal sNodeName As String, ByRef sHelp_icon As String, ByRef blhelp_visible As Boolean, ByRef blIconNotExist As Boolean) As String
      sFileName = "ContextHelp.xml"
      sNodeName = "/ContextHelp/pages"
      Dim sPage_name As String = ""
      Dim sHelp_url As String = ""
      'Dim sHelp_icon As String = ""
      Dim NavigateUrl As String = ""
      'Dim blhelp_visible As Boolean = False
      Dim xDocResponse = New XmlDocument()
      IOcl.ReadXML(sFileName, xDocResponse)
      Dim m_nodelist As XmlNodeList
      Dim m_node As XmlNode
      m_nodelist = xDocResponse.SelectNodes(sNodeName)
      'Loop through the nodes
      For Each m_node In m_nodelist
        sPage_name = m_node.ChildNodes.Item(1).InnerText
        sHelp_url = m_node.ChildNodes.Item(3).InnerText
        sHelp_icon = m_node.ChildNodes.Item(4).InnerText
        Dim sAppPath As String = HttpContext.Current.Request.ApplicationPath
        Dim sPhysicalPath As String = HttpContext.Current.Request.MapPath(sAppPath)
        If Not FileExist(sHelp_icon) Then
          'If Not IOcl.FileExistPhysically(Stringcl.GetValue(sHelp_icon)) Then
          sHelp_icon = m_node.ChildNodes.Item(5).InnerText
          blIconNotExist = True
        End If
        blhelp_visible = m_node.ChildNodes.Item(6).InnerText
        If sPage_name = sPageName And sHelp_url <> "" And blhelp_visible Then
          NavigateUrl = sHelp_url
          Exit For
        End If
      Next
      m_nodelist = Nothing
      m_node = Nothing
      Return NavigateUrl
    End Function
    Public Shared Function GetContextHelpLink(ByVal iType As Integer, ByVal sFileName As String, ByVal sNodeName As String) As String
      sFileName = "ContextHelp.xml"
      sNodeName = "/ContextHelp/pages/" & sNodeName
      Dim sValue As String = ""
      Dim xDocResponse = New XmlDocument()
      IOcl.ReadXML(sFileName, xDocResponse)
      Dim m_nodelist As XmlNodeList
      Dim m_node As XmlNode
      m_nodelist = xDocResponse.SelectNodes(sNodeName)
      If iType = 1 Then 'get the page_ID
        'Loop through the nodes
        'For Each m_node In m_nodelist
        '  If Not m_node.ChildNodes.Item(0).InnerText Is Nothing Then
        '    sValue = m_node.ChildNodes.Item(0).InnerText
        '  End If
        '  Exit For
        'Next
        sValue = m_nodelist.Count
      End If
      m_nodelist = Nothing
      m_node = Nothing
      Return sValue
    End Function
    'Public Function readXMLValue(ByVal filePath As String, ByVal key As String) As String
    '  filePath = "ContextHelp.xml"
    '  Dim sNodekey As String = "/ContextHelp/pages/page/"
    '  Dim sAppPath As String = HttpContext.Current.Request.ApplicationPath
    '  Dim sPhysicalPath As String = HttpContext.Current.Request.MapPath(sAppPath)
    '  Dim sPath As String = (sPhysicalPath & "\" & filePath)
    '  Dim xd As New XmlDocument()
    '  'load the xml file
    '  xd.Load(sPath)
    '  'query for a value
    '  Dim Node As XmlNode = xd.DocumentElement.SelectSingleNode(sNodekey & key)
    '  'return the value or nothing if it doesn't exist
    '  If Not Node Is Nothing Then
    '    Return Node.Attributes.GetNamedItem("value").Value
    '  Else
    '    Return ""
    '  End If
    'End Function
    Public Shared Sub AddCompleteNode(ByVal sNewPageNode As String)
      Dim sFileName As String = "ContextHelp.xml"
      Dim xmlDoc = New XmlDocument()
      Dim sAppPath As String = HttpContext.Current.Request.ApplicationPath
      Dim sPhysicalPath As String = HttpContext.Current.Request.MapPath(sAppPath)
      Dim sPath As String = (sPhysicalPath & "\" & sFileName)
      If File.Exists(sPath) Then
        ' Load the XmlDocument.
        Dim xd As New XmlDocument()
        xd.Load(sPath)
        ' Create our string that holds our new Person information.
        'Dim cr As String = Environment.NewLine
        'Dim newPerson As String = _
        '    "<pages>" & cr & _
        '    "    <page_id>3</page_id>" & cr & _
        '    "    <page_name>Tommy</page_name>" & cr & _
        '    "    <help_id>3</help_id>" & cr & _
        '    "    <help_url>http://rentalcarmanager.host4kb.com/article/AA-00378/14/User-Manuals/System-Setup/The-Company-Info-Screen.html#The-Company-Info-Tab</help_url>" & cr & _
        '    "    <help_icon>~/images/help.png</help_icon>" & cr & _
        '    "    <help_text>Help TRY</help_text>" & cr & _
        '    "    <help_visible>Tommy</help_visible>" & cr & _
        '    "  </pages>"

        ' Create a new XmlDocumentFragment for our document.
        Dim docFrag As XmlDocumentFragment = xd.CreateDocumentFragment()

        ' The Xml for this fragment is our newPerson string.
        docFrag.InnerXml = sNewPageNode
        ' The root element of our file is found using
        ' the DocumentElement property of the XmlDocument.
        Dim root As XmlNode = xd.DocumentElement
        ' Append our new Person to the root element.
        root.AppendChild(docFrag)
        ' Save the Xml.
        xd.Save(sPath)
      End If
    End Sub
  End Class
End Namespace