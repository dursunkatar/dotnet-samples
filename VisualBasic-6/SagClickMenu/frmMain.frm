VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Form1"
   ClientHeight    =   3585
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   5355
   LinkTopic       =   "Form1"
   ScaleHeight     =   3585
   ScaleWidth      =   5355
   StartUpPosition =   3  'Windows Default
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "sað týkla"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   30
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   690
      Left            =   1560
      TabIndex        =   0
      Top             =   1320
      Width           =   2190
   End
   Begin VB.Menu amenu 
      Caption         =   "a menüsü"
      Visible         =   0   'False
      Begin VB.Menu metota 
         Caption         =   "metot 1 "
      End
      Begin VB.Menu metotb 
         Caption         =   "metot 2"
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = vbRightButton Then PopupMenu amenu
End Sub
