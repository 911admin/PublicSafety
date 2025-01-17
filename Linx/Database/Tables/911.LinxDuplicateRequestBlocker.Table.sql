USE [911Linx]
GO
/****** Object:  Table [911].[LinxDuplicateRequestBlocker]    Script Date: 7/3/2024 9:17:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [911].[LinxDuplicateRequestBlocker](
	[MessageHashKey] [nvarchar](128) NOT NULL,
	[Application] [nvarchar](128) NOT NULL,
	[BlockFrequencyInMinutes] [int] NOT NULL,
	[BlockCount] [int] NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[TimeLastBlockRequest] [datetime2](0) NULL,
	[TimeCreated] [datetimeoffset](3) NOT NULL,
 CONSTRAINT [PK_MessageHashKey] PRIMARY KEY CLUSTERED 
(
	[MessageHashKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_MessageHashKey_Application] UNIQUE NONCLUSTERED 
(
	[MessageHashKey] ASC,
	[Application] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [911].[LinxDuplicateRequestBlocker] ADD  CONSTRAINT [DF_LinxDuplicateRequestBlocker_BlockCount]  DEFAULT ((0)) FOR [BlockCount]
GO
ALTER TABLE [911].[LinxDuplicateRequestBlocker] ADD  CONSTRAINT [DF_LinxDuplicateRequestBlocker_TimeLastBlockRequest]  DEFAULT (sysdatetimeoffset()) FOR [TimeLastBlockRequest]
GO
ALTER TABLE [911].[LinxDuplicateRequestBlocker] ADD  CONSTRAINT [DF_LinxDuplicateRequestBlocker_TimeCreated]  DEFAULT (sysdatetimeoffset()) FOR [TimeCreated]
GO
