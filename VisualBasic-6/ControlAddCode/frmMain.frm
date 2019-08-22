VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Form1"
   ClientHeight    =   4005
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   7410
   LinkTopic       =   "Form1"
   ScaleHeight     =   4005
   ScaleWidth      =   7410
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Caption         =   "Frame1"
      Height          =   1815
      Left            =   1440
      TabIndex        =   0
      Top             =   960
      Width           =   3735
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim WithEvents chkSecenek As CheckBox
Attribute chkSecenek.VB_VarHelpID = -1

Sub ControlAdd()
    Set chkSecenek = Controls.Add("vb.checkbox", "chkSecenek", Frame1)
    chkSecenek.Left = 50
    chkSecenek.Top = 50
    chkSecenek.Visible = True
End Sub

Private Sub Form_Load()
ControlAdd
End Sub
