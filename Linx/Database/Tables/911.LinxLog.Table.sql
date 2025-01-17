USE [911Linx]
GO
/****** Object:  Table [911].[LinxLog]    Script Date: 7/3/2024 9:17:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [911].[LinxLog](
	[LinxLogKey] [bigint] IDENTITY(1,1) NOT NULL,
	[Server] [nvarchar](100) NULL,
	[ApplicationID] [int] NOT NULL,
	[SeverityID] [int] NOT NULL,
	[EventID] [uniqueidentifier] NULL,
	[Activity] [nvarchar](100) NULL,
	[Process] [nvarchar](100) NULL,
	[Message] [nvarchar](max) NULL,
	[DataIn] [nvarchar](max) NULL,
	[DataOut] [nvarchar](max) NULL,
	[TimeCreated] [datetimeoffset](3) NOT NULL,
 CONSTRAINT [PK__LinxLog__LinxLogKey] PRIMARY KEY CLUSTERED 
(
	[LinxLogKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [911].[LinxLog] ADD  CONSTRAINT [DF__LinxLog__TimeCreated]  DEFAULT (sysdatetimeoffset()) FOR [TimeCreated]
GO
