VERSION 5.00
Begin VB.Form FrmMain 
   Caption         =   "Form1"
   ClientHeight    =   3075
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   6225
   LinkTopic       =   "Form1"
   ScaleHeight     =   3075
   ScaleWidth      =   6225
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnPost 
      Caption         =   "Post"
      Height          =   855
      Left            =   3240
      TabIndex        =   1
      Top             =   720
      Width           =   1695
   End
   Begin VB.CommandButton btnRequest 
      Caption         =   "Get"
      Height          =   855
      Left            =   960
      TabIndex        =   0
      Top             =   720
      Width           =   1815
   End
End
Attribute VB_Name = "FrmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnPost_Click()
Dim url As String
Dim res As cHttpResponse
Dim body As String
body = "{""IsSuccess"": true,""Error"": ""falan filan ddd""}"
url = "http://localhost:5049/api/values/Adresler"

Set res = Http.PostReq(url, body)
If res.Ok Then
MsgBox res.body.Json.Item("result").Item("error")
Else
MsgBox res.Error
End If
End Sub

Private Sub btnRequest_Click()
Dim url As String
Dim res As cHttpResponse
url = "https://jsonplaceholder.typicode.com/users"

Set res = Http.GetReq(url)
If res.Ok Then
MsgBox res.body.Json.Item(2).Item("name")
Else
MsgBox res.Error
End If
End Sub
