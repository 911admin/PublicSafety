USE [911Linx]
GO
/****** Object:  Table [911].[LinxFileExportState]    Script Date: 7/3/2024 9:17:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [911].[LinxFileExportState](
	[LinxFileExportStateKey] [bigint] IDENTITY(1,1) NOT NULL,
	[FileId] [nvarchar](256) NOT NULL,
	[Server] [char](64) NOT NULL,
	[Application] [nvarchar](64) NOT NULL,
	[Directory] [nvarchar](128) NOT NULL,
	[Filename] [nvarchar](256) NOT NULL,
	[ExportStatus] [nvarchar](max) NULL,
	[ExportAttempts] [int] NOT NULL,
	[TimeLastExportAttempt] [datetimeoffset](3) NULL,
	[TimeCreated] [datetimeoffset](3) NOT NULL,
 CONSTRAINT [PK_LinxFileExportStateKey] PRIMARY KEY CLUSTERED 
(
	[LinxFileExportStateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_Fileid_TimeCreated] UNIQUE NONCLUSTERED 
(
	[FileId] ASC,
	[TimeCreated] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [911].[LinxFileExportState] ADD  CONSTRAINT [DF_LinxFileExportState_ExportStatus]  DEFAULT ('Pending') FOR [ExportStatus]
GO
ALTER TABLE [911].[LinxFileExportState] ADD  CONSTRAINT [DF__LinxFileE__Expor__0371755F]  DEFAULT ((1)) FOR [ExportAttempts]
GO
ALTER TABLE [911].[LinxFileExportState] ADD  CONSTRAINT [DF_LinxFileExportState_TimeCreated]  DEFAULT (sysdatetimeoffset()) FOR [TimeCreated]
GO
