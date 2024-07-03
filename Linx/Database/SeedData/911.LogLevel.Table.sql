USE [911Linx]
GO
SET IDENTITY_INSERT [911].[LogLevel] ON 

INSERT [911].[LogLevel] ([LogLevelKey], [Name]) VALUES (1, N'Critical')
INSERT [911].[LogLevel] ([LogLevelKey], [Name]) VALUES (2, N'Error')
INSERT [911].[LogLevel] ([LogLevelKey], [Name]) VALUES (3, N'Warning')
INSERT [911].[LogLevel] ([LogLevelKey], [Name]) VALUES (4, N'Information')
INSERT [911].[LogLevel] ([LogLevelKey], [Name]) VALUES (5, N'Verbose')
INSERT [911].[LogLevel] ([LogLevelKey], [Name]) VALUES (6, N'Test')
SET IDENTITY_INSERT [911].[LogLevel] OFF
GO
