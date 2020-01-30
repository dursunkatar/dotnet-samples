Sub Diziler()

	'4 elemanlý bir dizi
	Dim Numaralar(3) As Integer

	Numaralar(0) = 10
	MsgBox Numaralar(0)
	'-----------------------
	'dinamik dizi
	Dim Isimler() As String

	ReDim Isimler(0)
	Isimler(0) = "dursun"
	MsgBox Isimler(0)

End Sub

Sub DosyaOlustur()

	Open App.Path & "\dosya.txt" For Output As #1

	Print #1, "Dursun Katar was here =)"

	Close #1

End Sub

Sub DosyaOku()

	Dim Data As String

	Open App.Path & "\dosya.txt" For Input As #1

	Input #1, Data

	Close #1

	MsgBox Data

End Sub

Sub DosyadanTumDatayiOku()

    Dim Data As String
    
    Open App.Path & "\dosya.txt" For Input As #1
    
    Do
    
    Input #1, Data
    MsgBox Data
    
    Loop Until EOF(1)
    
    Close #1

End Sub

Sub hataMesajlari()

    'vbCritical, vbQuestion, vbExclamation, vbInformation
    Dim mesaj1 As Integer
    mesaj1 = MsgBox("Click to Test", vbOKCancel + vbExclamation, "Baþlýk")
    MsgBox mesaj1
    
End Sub

Sub Convert()

    Dim str As String
    Dim num As Integer
    str = "123"
    
    'string to int
    num = CInt(str)
    MsgBox num
    
    Dim str2 As String
    
    'int to str
    str2 = CStr(num)
    MsgBox str2

End Sub

Sub ExcelWriteRead()
    On Error GoTo hata
    Dim MyExcel As Object
    Set MyExcel = CreateObject("Excel.Application")
    MyExcel.Visible = True ' Excelin açılıp açılmadığını görmek için true yapabilirsiniz
    MyExcel.Workbooks.Open ("file.xlsx")
    
    
    MyExcel.Cells(1, 1).Value = "Dursun"
    'Cells yerine Range özelliğini de kullanabiliriz.
    MyExcel.range("B1").Value = "Katar"
    
    
    Dim deger As String
    ' Değer okuma
    deger = MyExcel.Cells(1, 1).Value
    MsgBox deger
    
    MyExcel.Workbooks(1).Close (True)
    MyExcel.Application.Quit
    Set MyExcel = Nothing
    
hata:
    MsgBox "Hata verdi", vbCritical, "Ben"
End Sub
		
Sub CollectionUsage()
    Dim Liste  As New Collection
    Liste.Add "value", "key"
    Liste.Add "value2", "key2"
    
    'MsgBox Liste.Item("key")
    
    For Each Item In Liste
      MsgBox Item
    Next
    Set Liste = Nothing
End Sub

Public Function ClearAllTextBoxes(frmTarget As Form)
Dim i As Long
Dim ctrltarget
For i = 0 To (frmTarget.Controls.count - 1)
    Set ctrltarget = frmTarget.Controls(i)
    If TypeOf ctrltarget Is TextBox Then ctrltarget.Text = ""
Next i
End Function

Private Sub ERROR_HANDLE()
	On Error GoTo err

	Dim str As Integer
	str = ""

	err:
	If err.Number <> 0 Then
		MsgBox err.Description
		Debug.Print "[" & Me.Name & ".ERROR_HANDLE]: " & err.Description
	End If
		  
End Sub

Private Sub lvwArama_ItemCheck(ByVal Item As MSComctlLib.ListItem)
    On Error GoTo Err_Proc
    Dim i As Long
    If Item Is Nothing Then Exit Sub
    If Item.checked Then
        If PROJECT_NAME <> "NORM" Then
        For i = 1 To lvwArama.ListItems.count
            If i <> Item.Index Then lvwArama.ListItems(i).checked = False
        Next i
        End If
        FiyatID = Item.SubItems(7)
        Kayit_Bul
    Else
        updatemode = False
        cmdKaydet.Caption = "&Kaydet"
    End If
Exit_Proc:
    On Error Resume Next
    If cnn.State <> adStateClosed Then cnn.Close
    Exit Sub
Err_Proc:
    HataMesaji
    Resume Exit_Proc
End Sub
						
 For Each ch In lvw.ColumnHeaders
        If ch.Tag = colTag Then colIdx = ch.SubItemIndex: Exit For
 Next
