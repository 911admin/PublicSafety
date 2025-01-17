USE [911Linx]
GO
/****** Object:  Table [911].[LinxApplication]    Script Date: 7/3/2024 9:17:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [911].[LinxApplication](
	[LinxApplicationKey] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Domain] [nvarchar](100) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [varchar](max) NULL,
	[LogLevel] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[TimeCreated] [datetimeoffset](3) NOT NULL,
	[TimeLastModified] [datetimeoffset](3) NULL,
 CONSTRAINT [PK__LinxAppl__40A8E081815B25C3] PRIMARY KEY CLUSTERED 
(
	[LinxApplicationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [911].[LinxApplication] ADD  CONSTRAINT [DF__LinxAppli__IsAct__41B8C09B]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [911].[LinxApplication] ADD  CONSTRAINT [DF__LinxAppli__TimeC__42ACE4D4]  DEFAULT (sysdatetimeoffset()) FOR [TimeCreated]
GO
