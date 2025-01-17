USE [911Linx]
GO
/****** Object:  Table [911].[CodeREDState]    Script Date: 7/3/2024 9:17:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [911].[CodeREDState](
	[CodeREDStateKey] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [char](2) NULL,
	[Action] [nvarchar](25) NULL,
	[LaunchCode] [nvarchar](25) NULL,
	[LaunchID] [int] NULL,
	[ScenarioID] [int] NULL,
	[AudienceID] [int] NULL,
	[MessageID] [int] NULL,
	[SendStatus] [nvarchar](8) NULL,
	[SendAttempts] [int] NOT NULL,
	[TimeLastSendAttempt] [datetimeoffset](3) NULL,
	[TimeCreated] [datetimeoffset](3) NOT NULL,
 CONSTRAINT [PK_CodeREDState] PRIMARY KEY CLUSTERED 
(
	[CodeREDStateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_Scenario] UNIQUE NONCLUSTERED 
(
	[ScenarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [911].[CodeREDState] ADD  CONSTRAINT [DF_CodeREDState_SendStatus]  DEFAULT ('Pending') FOR [SendStatus]
GO
ALTER TABLE [911].[CodeREDState] ADD  DEFAULT ((0)) FOR [SendAttempts]
GO
ALTER TABLE [911].[CodeREDState] ADD  CONSTRAINT [DF_CodeREDState_TimeCreated]  DEFAULT (sysdatetimeoffset()) FOR [TimeCreated]
GO
