alter procedure foo (
	 @UserId UNIQUEIDENTIFIER
	,@ResultCode INT OUTPUT
	,@ReturnMessage NVARCHAR(30) OUTPUT
	)
AS
BEGIN
	BEGIN TRAN

	BEGIN TRY
	   
	   select 
		[User].FirstName,
		[User].LastName,
		[User].CreatedAt,
		Custom_MemberAbout.TCNumber,
		Custom_MemberAbout.Gsm,
		TotalCount = Count([User].Id) Over()
		from [User]
		inner join Custom_MemberAbout on [User].Id=Custom_MemberAbout.UserId
		where [User].IsDeleted=0 and [User].IsActive=1

		SET @ResultCode = 10000 --Başarılı.
		SET @ReturnMessage = 'başarılı'

		COMMIT TRAN

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN

		SET @ResultCode = 10001;--SP hata.
		SET @ReturnMessage = ERROR_MESSAGE() + ' [Line: ' + ERROR_LINE() + '] (' + ERROR_NUMBER() + ')';

		RETURN (@ResultCode)
	END CATCH
END
