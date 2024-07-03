USE [911Linx]
GO
-- SOLUTION: 911Courts
INSERT [911].[LinxAppUrlMapping] ([ApplicationID], [Activity], [Action], [Method], [Url], [RequestContentType], [ResponseContentType], [TimeCreated]) VALUES (37, N'APIPioneer', N'CitationImport', N'POST', N'https://data.iconsoftware.net/SheriffIntegration/SummitCO/citation/import', N'application/json', N'application/json', SYSDATETIMEOFFSET()))
GO
