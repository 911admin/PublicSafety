USE [911Linx]
GO
/****** Object:  Table [911].[LinxAppUrlMapping]    Script Date: 7/3/2024 9:17:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [911].[LinxAppUrlMapping](
	[ApplicationID] [int] NOT NULL,
	[Activity] [nvarchar](64) NOT NULL,
	[Action] [nvarchar](64) NOT NULL,
	[Method] [nvarchar](16) NOT NULL,
	[Url] [nvarchar](256) NOT NULL,
	[RequestContentType] [nvarchar](32) NULL,
	[ResponseContentType] [nvarchar](32) NULL,
	[TimeCreated] [datetimeoffset](3) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [911].[LinxAppUrlMapping] ADD  CONSTRAINT [DF__LinxUrlMa__TimeC__5B78929E]  DEFAULT (sysdatetimeoffset()) FOR [TimeCreated]
GO
ALTER TABLE [911].[LinxAppUrlMapping]  WITH CHECK ADD  CONSTRAINT [FK_LinxAppUrlMapping_Application] FOREIGN KEY([ApplicationID])
REFERENCES [911].[LinxApplication] ([LinxApplicationKey])
GO
ALTER TABLE [911].[LinxAppUrlMapping] CHECK CONSTRAINT [FK_LinxAppUrlMapping_Application]
GO
