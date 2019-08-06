VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form MainFrm 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Listview sample"
   ClientHeight    =   2025
   ClientLeft      =   45
   ClientTop       =   690
   ClientWidth     =   6810
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   2025
   ScaleWidth      =   6810
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton btnAddItem 
      Caption         =   "Add Item"
      Height          =   375
      Left            =   5160
      TabIndex        =   4
      Top             =   1560
      Width           =   1575
   End
   Begin VB.CommandButton btnGetSelectedItem 
      Caption         =   "Get Selected Item"
      Height          =   375
      Left            =   1800
      TabIndex        =   3
      Top             =   1560
      Width           =   1575
   End
   Begin VB.CommandButton btnDeleteItem 
      Caption         =   "Delete Item"
      Height          =   375
      Left            =   3480
      TabIndex        =   2
      Top             =   1560
      Width           =   1575
   End
   Begin VB.CommandButton btnGetItem 
      Caption         =   "Get Item (Index)"
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   1560
      Width           =   1575
   End
   Begin MSComctlLib.ListView ListView1 
      Height          =   1335
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   6615
      _ExtentX        =   11668
      _ExtentY        =   2355
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.Menu mBen 
      Caption         =   "&Ben"
      Begin VB.Menu mHakkimda 
         Caption         =   "&Hakkımda"
      End
   End
End
Attribute VB_Name = "MainFrm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub btnAddItem_Click()

  With ListView1.ListItems.Add(, , "Ayşe")
            .SubItems(1) = "dur"
            .SubItems(2) = "0565"
  End With
End Sub

Private Sub btnDeleteItem_Click()
ListView1.ListItems.Remove (1)
End Sub

Private Sub btnGetItem_Click()
MsgBox ListView1.ListItems.Item(2).Text
MsgBox ListView1.ListItems.Item(2).ListSubItems.Item(1)
End Sub

Private Sub btnGetSelectedItem_Click()
MsgBox ListView1.SelectedItem.Text
MsgBox ListView1.SelectedItem.ListSubItems.Item(1).Text
End Sub





Private Sub Form_Load()
With ListView1

    .View = lvwReport

    .ColumnHeaders.Add , , "Ad"
    .ColumnHeaders.Add , , "Soyad"
    .ColumnHeaders.Add , , "Tel"
    
    
        With .ListItems.Add(, , "Dursun")
            .SubItems(1) = "Katar"
            .SubItems(2) = "0552"
        End With
        
          With .ListItems.Add(, , "Mehmet")
            .SubItems(1) = "Kara"
            .SubItems(2) = "0536"
        End With
    
End With
End Sub

Private Sub mHakkimda_Click()
MsgBox "o çılgın bir coder", vbInformation, "Dursun Katar"
End Sub
