USE [911Linx]
GO
/****** Object:  Table [911].[LinxAPISubmissionState]    Script Date: 7/3/2024 9:17:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [911].[LinxAPISubmissionState](
	[LinxAPISubmissionStateKey] [bigint] IDENTITY(1,1) NOT NULL,
	[SubmissionId] [nvarchar](32) NOT NULL,
	[Server] [nvarchar](64) NOT NULL,
	[Application] [nvarchar](128) NOT NULL,
	[CallMethod] [nvarchar](64) NOT NULL,
	[ReceiveMethod] [nvarchar](64) NULL,
	[Directory] [nvarchar](128) NULL,
	[Filename] [nvarchar](64) NULL,
	[Status] [nvarchar](max) NULL,
	[Submissions] [int] NOT NULL,
	[TimeLastSubmission] [datetimeoffset](3) NULL,
	[TimeCreated] [datetimeoffset](3) NOT NULL,
 CONSTRAINT [PK_APISubmissionStateKey] PRIMARY KEY CLUSTERED 
(
	[LinxAPISubmissionStateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_SubmissionId_Application_CallMethod] UNIQUE NONCLUSTERED 
(
	[SubmissionId] ASC,
	[Application] ASC,
	[CallMethod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [911].[LinxAPISubmissionState] ADD  CONSTRAINT [DF_LinxAPISubmissionState_Status]  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [911].[LinxAPISubmissionState] ADD  CONSTRAINT [DF_LinxAPISubmissionState_Submissions]  DEFAULT ((1)) FOR [Submissions]
GO
ALTER TABLE [911].[LinxAPISubmissionState] ADD  CONSTRAINT [DF_LinxAPISubmissionState_TimeCreated]  DEFAULT (sysdatetimeoffset()) FOR [TimeCreated]
GO
