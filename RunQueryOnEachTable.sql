DECLARE @name VARCHAR(100) -- database name  
declare @i int --counter for while loop
declare @maxIdid int  --for while loop
declare @sql nvarchar(200) --for dynamic sql
DECLARE @Return INT  --for error handling

set nocount on

create table #tempTableName
(idid int not null identity(1,1)
, TableName varchar(100))

insert into #tempTableName
(TableName)
SELECT s.name + '.' + t.name
FROM sys.tables t
JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE s.name = 'dw'
ORDER BY s.name + '.' + t.name


select @maxIdid = MAX(idid) from #tempTableName

set @i = 1

WHILE @i <= @maxIdid   
BEGIN   
	select @name = TableName from #tempTableName where idid = @i
	--print @name
		set @sql = N'drop table ' + @Name
		print @sql
		--EXEC @Return = sp_executesql @sql
	set @i = @i + 1
END   

drop table #tempTableName



-----------



drop table dw.DimApplication
drop table dw.DimCatalog
drop table dw.DimDate
drop table dw.DimDimension
drop table dw.DimGeoLocation
drop table dw.DimProduct
drop table dw.DimProgress
drop table dw.DimRecLocation
drop table dw.DimSegment
drop table dw.DimSession
drop table dw.DimStore
drop table dw.DimSubject
drop table dw.DimTime
drop table dw.DimTransaction
drop table dw.DimUrl
drop table dw.DimVisit
drop table dw.FactInteractiveSession --done
drop table dw.FactInteractiveSessionObject --done
drop table dw.FactInteractiveSessionRec --done
drop table dw.FactTargetSession --done
drop table dw.FactTargetSessionObject --done
drop table dw.FactTargetSessionRec --done
drop table dw.FIS_Progress_ETL_helper
drop table dw.FIS_Visit
drop table dw.FISStagingVisitUpdate
drop table dw.FTS_Progress_ETL_helper
drop table dw.FTS_Visit
drop table dw.FTSStagingVisitProgressUpdate
drop table dw.validation_fis_olap1
drop table dw.validation_fis_olap2
drop table dw.validation_fis_olap3
drop table dw.validation_fis_olap4
drop table dw.validation_fis_oltp1
drop table dw.validation_fis_oltp2
drop table dw.validation_fis_oltp3
drop table dw.validation_fis_oltp4
drop table dw.validation_fisobj_ol
drop table dw.validation_fisobj_olap_staples
drop table dw.validation_fisobj_olap1
drop table dw.validation_fisobj_olap2
drop table dw.validation_fisobj_oltp_staples
drop table dw.validation_fisobj_oltp1
drop table dw.validation_fisobj_oltp2
drop table dw.validation_fisobj_sis
drop table dw.validation_fisobj_siso
drop table dw.validation_fisobj_staples_ii
drop table dw.validation_fisrec_ol
drop table dw.validation_fisrec_olap_staples
drop table dw.validation_fisrec_olap1
drop table dw.validation_fisrec_olap2
drop table dw.validation_fisrec_olap3
drop table dw.validation_fisrec_oltp_staples
drop table dw.validation_fisrec_oltp1
drop table dw.validation_fisrec_oltp2
drop table dw.validation_fisrec_oltp3
drop table dw.validation_fisrec_sis
drop table dw.validation_fisrec_sisr
drop table dw.validation_fisrec_sisr_t
drop table dw.validation_fisrec_staples_ii
drop table dw.validation_fisvisit_olap
drop table dw.validation_fisvisit_oltp
drop table dw.validation_fisvisit_s1
drop table dw.validation_fisvisit_s2
drop table dw.validation_fisvisit_sis
drop table dw.validation_fisvisit_sis_t
drop table dw.validation_fts_olap1
drop table dw.validation_fts_olap2
drop table dw.validation_fts_olap3
drop table dw.validation_fts_olap4
drop table dw.validation_fts_oltp1
drop table dw.validation_fts_oltp2
drop table dw.validation_fts_oltp3
drop table dw.validation_fts_oltp4
drop table dw.validation_ftsobj_ol
drop table dw.validation_ftsobj_olap_staples
drop table dw.validation_ftsobj_olap1
drop table dw.validation_ftsobj_olap2
drop table dw.validation_ftsobj_oltp_staples
drop table dw.validation_ftsobj_oltp1
drop table dw.validation_ftsobj_oltp2
drop table dw.validation_ftsobj_staples_ii
drop table dw.validation_ftsobj_sts
drop table dw.validation_ftsobj_stso
drop table dw.validation_ftsrec_ol
drop table dw.validation_ftsrec_olap_staples
drop table dw.validation_ftsrec_olap1
drop table dw.validation_ftsrec_olap2
drop table dw.validation_ftsrec_olap3
drop table dw.validation_ftsrec_oltp_staples
drop table dw.validation_ftsrec_oltp1
drop table dw.validation_ftsrec_oltp2
drop table dw.validation_ftsrec_oltp3
drop table dw.validation_ftsrec_staples_ii
drop table dw.validation_ftsrec_sts
drop table dw.validation_ftsrec_stsr
drop table dw.validation_ftsrec_stsr_t
drop table dw.validation_ftsvisit_olap
drop table dw.validation_ftsvisit_oltp
drop table dw.validation_ftsvisit_s1
drop table dw.validation_ftsvisit_s2
drop table dw.validation_ftsvisit_sts
drop table dw.validation_ftsvisit_sts_t
drop table dw.validation_progress
