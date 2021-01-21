DROP SYNONYM [syn].[strategy_trend_data]
DROP SYNONYM [syn].[strategy_detail_data]
DROP SYNONYM [syn].[Session_Recommendation_Variant_Summary]
DROP SYNONYM [syn].[session_recommendation_scheme_summary]
DROP SYNONYM [syn].[Session_Recommendation_Package_Summary]
DROP SYNONYM [syn].[Session_Recommendation_Experience_Summary]
DROP SYNONYM [syn].[Session_Recommendation_Audience_Summary]
DROP SYNONYM [syn].[Session_Recommendation_Audience_Experience_Summary]
DROP SYNONYM [syn].[recommendation_detail_data]
go

---------------------------------------------------------------------------------------------------------------
/*
CREATE SYNONYM [syn].[recommendation_detail_data] FOR [Reporting3].BuySeasons.[dbo].[recommendation_detail_data]
CREATE SYNONYM [syn].[Session_Recommendation_Audience_Experience_Summary] FOR [Reporting3].BuySeasons.[dbo].[Session_Recommendation_Audience_Experience_Summary]
CREATE SYNONYM [syn].[Session_Recommendation_Audience_Summary] FOR [Reporting3].BuySeasons.[dbo].[Session_Recommendation_Audience_Summary]
CREATE SYNONYM [syn].[Session_Recommendation_Experience_Summary] FOR [Reporting3].BuySeasons.[dbo].[Session_Recommendation_Experience_Summary]
CREATE SYNONYM [syn].[Session_Recommendation_Package_Summary] FOR [Reporting3].BuySeasons.[dbo].[Session_Recommendation_Package_Summary]
CREATE SYNONYM [syn].[session_recommendation_scheme_summary] FOR [Reporting3].BuySeasons.[dbo].[session_recommendation_scheme_summary]
CREATE SYNONYM [syn].[Session_Recommendation_Variant_Summary] FOR [Reporting3].BuySeasons.[dbo].[Session_Recommendation_Variant_Summary]
CREATE SYNONYM [syn].[strategy_detail_data] FOR [Reporting3].BuySeasons.[dbo].[strategy_detail_data]
CREATE SYNONYM [syn].[strategy_trend_data] FOR [Reporting3].BuySeasons.[dbo].[strategy_trend_data]
go
*/


--------------------------------------------------------------

DECLARE @name VARCHAR(100) -- database name  
declare @sql nvarchar(4000) --for dynamic sql
DECLARE @Return INT  --for error handling
declare @DBName varchar(100)

set nocount on

--set @DBName = db_name()
set @DBName = 'Template_Reporting'

set @sql = N'CREATE SYNONYM [syn].[recommendation_detail_data] FOR [Reporting3].' + @DBName + '.[dbo].[recommendation_detail_data];' + nchar(10)
set @sql = @sql + 'CREATE SYNONYM [syn].[Session_Recommendation_Audience_Experience_Summary] FOR [Reporting3].' + @DBName + '.[dbo].[Session_Recommendation_Audience_Experience_Summary];' + nchar(10)
set @sql = @sql + 'CREATE SYNONYM [syn].[Session_Recommendation_Audience_Summary] FOR [Reporting3].' + @DBName + '.[dbo].[Session_Recommendation_Audience_Summary];' + nchar(10)
set @sql = @sql + 'CREATE SYNONYM [syn].[Session_Recommendation_Experience_Summary] FOR [Reporting3].' + @DBName + '.[dbo].[Session_Recommendation_Experience_Summary];' + nchar(10)
set @sql = @sql + 'CREATE SYNONYM [syn].[Session_Recommendation_Package_Summary] FOR [Reporting3].' + @DBName + '.[dbo].[Session_Recommendation_Package_Summary];' + nchar(10)
set @sql = @sql + 'CREATE SYNONYM [syn].[Session_Recommendation_Scheme_Summary] FOR [Reporting3].' + @DBName + '.[dbo].[Session_Recommendation_Scheme_Summary];' + nchar(10)
set @sql = @sql + 'CREATE SYNONYM [syn].[Session_Recommendation_Variant_Summary] FOR [Reporting3].' + @DBName + '.[dbo].[Session_Recommendation_Variant_Summary];' + nchar(10)
set @sql = @sql + 'CREATE SYNONYM [syn].[strategy_detail_data] FOR [Reporting3].' + @DBName + '.[dbo].[strategy_detail_data];' + nchar(10)
set @sql = @sql + 'CREATE SYNONYM [syn].[strategy_trend_data] FOR [Reporting3].' + @DBName + '.[dbo].[strategy_trend_data];' + nchar(10)
--print @sql
EXEC @Return = sp_executesql @sql
