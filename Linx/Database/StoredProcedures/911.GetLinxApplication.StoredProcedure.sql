USE [SC911Linx]
GO
/****** Object:  StoredProcedure [911].[GetLinxApplication]    Script Date: 7/3/2024 9:17:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ----------------------------------------------------------------------
-- Author:		R Spencer Levin
-- Create date: 06/10/2017
-- Description:	Adhoc query to fetch application data
-- ----------------------------------------------------------------------

CREATE PROCEDURE [911].[GetLinxApplication]
	@application nvarchar(32) = null
AS
BEGIN
	SET NOCOUNT ON;
	----------------------------------------------------------------------
	SET @application = CONCAT('%',@application,'%')
	----------------------------------------------------------------------
	SELECT 
	   [PK]
      ,[Name]
      ,[Description]
      ,[Domain]
      ,[Username]
      ,[LogLevel]
      ,[LogLevelName]
      ,[IsActive]
      ,[TimeCreated]
      ,[LastRun]
	FROM [SC911Linx].[dbo].[vwLinxApplication]
	WHERE [IsActive] = 1
	  AND [Name] LIKE @application
	ORDER BY [Name]
	----------------------------------------------------------------------
END;
GO
