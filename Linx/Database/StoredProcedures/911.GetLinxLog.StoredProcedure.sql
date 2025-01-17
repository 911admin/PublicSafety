USE [SC911Linx]
GO
/****** Object:  StoredProcedure [911].[GetLinxLog]    Script Date: 7/3/2024 9:17:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- ----------------------------------------------------------------------
-- Author:		R Spencer Levin
-- Create date: 06/10/2017
-- Description:	Adhoc query to fetch log data
-- ----------------------------------------------------------------------

CREATE PROCEDURE [911].[GetLinxLog]
	@skip int = null,
	@take int = null,
	@hours int = null,
	@severity_level int = null,
	@application nvarchar(32) = null
AS
BEGIN
	SET NOCOUNT ON;
	
	----------------------------------------------------------------------
	IF(@skip IS NULL OR @skip='') BEGIN SET @skip = 0 END;
	IF(@take IS NULL OR @take='') BEGIN SET @take = 5000 END;
	IF(@hours IS NULL OR @hours=0) BEGIN SET @hours = 24 END;
	IF(@severity_level IS NULL) BEGIN SET @severity_level = 4 END;
	SET @application = CONCAT('%',@application,'%')
	----------------------------------------------------------------------
	SELECT 
		   [DateCreated]
		  ,[TimeCreated]
		  ,[Server]
		  ,[Application]
		  ,[Severity]
		  ,[Activity]
		  ,[Process]
		  ,[Message]
		  ,[DataIn]
		  ,[DataOut]
	FROM [dbo].[vwLinxLog]
	WHERE CAST([DateTimeStamp] AS DATETIME) BETWEEN DATEADD(HOUR,-(@hours),GETDATE()) AND GETDATE()
	  AND [SeverityID] <= @severity_level
	  AND [Application] LIKE @application
	ORDER BY [DateTimeStamp] DESC
	OFFSET @skip ROWS
	FETCH NEXT @take ROWS ONLY;
	----------------------------------------------------------------------
END;
GO
