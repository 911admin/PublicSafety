USE [SC911Linx]
GO
/****** Object:  StoredProcedure [linx].[SetLastRunDateTime]    Script Date: 7/3/2024 9:17:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ----------------------------------------------------------------------
-- Author:		R Spencer Levin
-- Create date: 12/02/2021
-- ----------------------------------------------------------------------

CREATE PROCEDURE [linx].[SetLastRunDateTime]
	@last_run_datetime datetime,
	@application_name varchar(128)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [911].[LinxApplication] SET [TimeLastModified] = @last_run_datetime WHERE [Name] = @application_name
END;
GO
