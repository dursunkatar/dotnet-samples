VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cHttpResponse"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Private m_Ok As Boolean
Private m_Error As String
Private m_Body As cHttpResponseData
Public z_jsonStr As String
Public Property Get Ok() As Boolean
    Ok = m_Ok
End Property
Public Property Let z_Ok(ByVal Ok As Boolean)
    m_Ok = Ok
End Property
Public Property Get Error() As String
    Error = m_Error
End Property
Public Property Let z_Error(ByVal Error As String)
    m_Error = Error
End Property
Public Property Get body() As cHttpResponseData
  If m_Body Is Nothing Then
   Set m_Body = New cHttpResponseData
   m_Body.z_jsonStr = z_jsonStr
  End If
  Set body = m_Body
End Property

