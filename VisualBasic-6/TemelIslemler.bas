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

