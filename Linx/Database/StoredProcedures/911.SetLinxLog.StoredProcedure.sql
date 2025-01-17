USE [SC911Linx]
GO
/****** Object:  StoredProcedure [911].[SetLinxLog]    Script Date: 7/3/2024 9:17:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ----------------------------------------------------------------------
-- Author:		R Spencer Levin
-- Create date: 06/10/2022
-- Description:	Set Linx Log via powershell script
-- ----------------------------------------------------------------------

CREATE PROCEDURE [911].[SetLinxLog]
	@Application varchar(64)=null,
	@Server nvarchar(100)=null,
	@Severity varchar(32)=null,
	@EventID uniqueidentifier=null,
	@Activity nvarchar(100)=null,
	@Process nvarchar(100)=null,
	@Message nvarchar(max)=null,
	@DataIn nvarchar(max)=null,
	@DataOut nvarchar(max)=null
AS
BEGIN
	SET NOCOUNT ON;
	
	----------------------------------------------------------------------
	DECLARE @ApplicationID int, @ApplicationLogLevel int,@SeverityLevel int
	IF(ISNULL(@Application,'')='') BEGIN SET @ApplicationID=38 END ELSE BEGIN SET @ApplicationID=(SELECT LinxApplicationKey FROM [911].[LinxApplication] WHERE [Name]=@Application) END
	SET @ApplicationLogLevel=(SELECT [LogLevel] FROM [911].[LinxApplication] WHERE [LinxApplicationKey]=@ApplicationID)
	SET @SeverityLevel=(SELECT [LogLevelKey] FROM [911].[LogLevel] WITH (NOWAIT) WHERE [Name] = @Severity)
	----------------------------------------------------------------------
	IF(@SeverityLevel <= @ApplicationLogLevel)
	BEGIN
		SET LOCK_TIMEOUT 0
		BEGIN TRY
			BEGIN TRANSACTION
			INSERT INTO [911].[LinxLog]
					   ([Server]
					   ,[ApplicationID]
					   ,[SeverityID]
					   ,[EventID]
					   ,[Activity]
					   ,[Process]
					   ,[Message]
					   ,[DataIn]
					   ,[DataOut])
				 VALUES
					   (@Server
					   ,@ApplicationID
					   ,@SeverityLevel
					   ,@EventID
					   ,@Activity
					   ,@Process
					   ,@Message
					   ,@DataIn
					   ,@DataOut)
			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
				ROLLBACK TRANSACTION;
		END CATCH;
		SET LOCK_TIMEOUT -1
	END;
	----------------------------------------------------------------------
END;
GO
