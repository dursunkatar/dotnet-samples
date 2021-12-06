VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cHttpResponseData"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Public z_jsonStr As String
Private m_json As Object
Public Property Get Text() As String
   toString = z_jsonStr
End Property
Public Property Get Json() As Object
    If m_json Is Nothing Then
     Set m_json = mJSON.parse(z_jsonStr)
    End If
    Set Json = m_json
End Property
