VERSION 5.00
Begin VB.Form MainFrm 
   Caption         =   "Listbox"
   ClientHeight    =   2880
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   4215
   LinkTopic       =   "Form1"
   ScaleHeight     =   2880
   ScaleWidth      =   4215
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnSelected 
      Caption         =   "Seçilenler"
      Height          =   1095
      Left            =   2280
      TabIndex        =   1
      Top             =   840
      Width           =   1455
   End
   Begin VB.ListBox List1 
      Height          =   2310
      Left            =   360
      Style           =   1  'Checkbox
      TabIndex        =   0
      Top             =   240
      Width           =   1455
   End
End
Attribute VB_Name = "MainFrm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnSelected_Click()
  Dim lngIdx As Long
                If List1.SelCount > 0 Then
            For lngIdx = 0 To List1.ListCount - 1
                If List1.Selected(lngIdx) Then
                    Debug.Print List1.List(lngIdx); " is Checked"
                End If
            Next
        End If
End Sub

Private Sub Form_Load()
List1.AddItem "Dursun"
List1.AddItem "Mehmet"
List1.AddItem "Ramazan"
End Sub
