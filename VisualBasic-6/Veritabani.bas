Dim Con As New ADODB.Connection
Const connectionString As String = "Driver=SQL Server;Server=DESKTOP-VXRCE\SQLEXPRESS;Database=benimtest;Trusted_Connection=Yes;"

Sub KayitOku()

	Con.Open connectionString
	Dim Rec As New ADODB.Recordset
	Rec.Open "select * from tablom", Con, adOpenStatic, adLockReadOnly
	 
	If Rec.RecordCount <= 0 Then
	MsgBox "Kayýt yok"
	Exit Sub
	End If

	Do Until Rec.EOF
	Print Rec.Fields("Ad") & " - " & Rec.Fields("Soyad") & " - " & Rec.Fields("Tarih")
	Rec.MoveNext
	Loop

	Rec.Close
	Con.Close
	Set Con = Nothing
	Set Rec = Nothing

End Sub

Sub KayitEkle()

	Con.Open connectionString
	Dim Tarih As Date
	Tarih = Format(Now, "dd.mm.yyyy")

	Dim sql  As String
	sql = "insert into tablom (Ad,Soyad,Tarih) values ('Mehmet','Kara',cast('" & Tarih & "' as smalldatetime))"

	Con.Execute (sql)

	Con.Close
	Set Con = Nothing

End Sub

Sub KayitGuncelle()

	Con.Open connectionString
	Con.Execute ("update Makales set Baslik='yeni deðer' where Id=5")

	Con.Close
	Set Con = Nothing
 
End Sub



