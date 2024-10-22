USE [911Linx]
GO
/****** Object:  Table [911].[LinxApplicationHeader]    Script Date: 7/3/2024 9:17:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [911].[LinxApplicationHeader](
	[LinxApplicationHeaderKey] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[Pragma] [nvarchar](100) NULL,
	[CacheControl] [nvarchar](100) NULL,
	[Cookie] [nvarchar](max) NULL,
	[Server] [nvarchar](100) NULL,
	[XAspNetVersion] [nvarchar](100) NULL,
	[XPoweredBy] [nvarchar](100) NULL,
	[Date] [nvarchar](50) NULL,
	[ContentLength] [int] NULL,
	[ContentType] [nvarchar](100) NULL,
	[Expires] [datetimeoffset](3) NULL,
	[TimeCreated] [datetimeoffset](3) NOT NULL,
	[TimeLastModified] [datetimeoffset](3) NULL,
 CONSTRAINT [PK__LinxAppl__D5D298E65CDA42C3] PRIMARY KEY CLUSTERED 
(
	[LinxApplicationHeaderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [911].[LinxApplicationHeader] ADD  CONSTRAINT [DF__LinxAppli__TimeC__53D770D6]  DEFAULT (sysdatetimeoffset()) FOR [TimeCreated]
GO
