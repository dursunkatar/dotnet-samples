Attribute VB_Name = "Http"
Private Function DoRequest(ByVal vMetot As String, ByVal vWebUrl As String, ByVal vBody As String) As cHttpResponse
    On Error GoTo err_httpRequest
    Dim oXMLHTTP As Object
    Dim result As New cHttpResponse
    Set DoRequest = result
     
    Set oXMLHTTP = CreateObject("MSXML2.ServerXMLHTTP")
    oXMLHTTP.Open vMetot, vWebUrl, False
    oXMLHTTP.setRequestHeader "Content-Type", "application/json"
    oXMLHTTP.send Utf8BytesOf(vBody)
    
    Do While oXMLHTTP.readyState <> 4
        DoEvents
    Loop
       
    result.z_jsonStr = oXMLHTTP.responseText
    result.z_Ok = True
        
    Set oXMLHTTP = Nothing
      
    On Error GoTo 0
    Exit Function
    
err_httpRequest:
    result.z_Ok = False
    result.z_Error = Err.Description
End Function
Public Function PostReq(ByVal vWebUrl As String, ByVal vBody As String) As cHttpResponse
  Set PostReq = DoRequest("POST", vWebUrl, vBody)
End Function
Public Function GetReq(ByVal vWebUrl As String) As cHttpResponse
  Set GetReq = DoRequest("GET", vWebUrl, "")
End Function
Private Function Utf8BytesOf(text)
    With CreateObject("Adodb.Stream")
        .Charset = "UTF-8"
        .Open
        .WriteText text
        .Position = 0
        .Type = 1 'adTypeBinary
        .Read 3 'skip UTF-8 BOM
        Utf8BytesOf = .Read 'read rest
        .Close
    End With
End Function


