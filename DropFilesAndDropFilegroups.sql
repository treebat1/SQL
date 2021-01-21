--drop files and filegroups

sp_helpdb 'Staples'


ALTER DATABASE Staples  REMOVE FILE FactTargetSession_2010

ALTER DATABASE Staples  REMOVE FILE FactTargetSession_2011

ALTER DATABASE Staples  REMOVE FILE FactTargetSession_2012

ALTER DATABASE Staples  REMOVE FILE FactTargetSession_2013

ALTER DATABASE Staples  REMOVE FILE FactTargetSession_2014


ALTER DATABASE Staples  REMOVE FILE FactTargetSessionObject_2010

ALTER DATABASE Staples  REMOVE FILE FactTargetSessionObject_2011

ALTER DATABASE Staples  REMOVE FILE FactTargetSessionObject_2012

ALTER DATABASE Staples  REMOVE FILE FactTargetSessionObject_2013

ALTER DATABASE Staples  REMOVE FILE FactTargetSessionObject_2014



ALTER DATABASE Staples  REMOVE FILE FactTargetSessionRec_2010

ALTER DATABASE Staples  REMOVE FILE FactTargetSessionRec_2011

ALTER DATABASE Staples  REMOVE FILE FactTargetSessionRec_2012

ALTER DATABASE Staples  REMOVE FILE FactTargetSessionRec_2013

ALTER DATABASE Staples  REMOVE FILE FactTargetSessionRec_2014



ALTER DATABASE Staples  REMOVE FILE FactInteractiveSession_2010

ALTER DATABASE Staples  REMOVE FILE FactInteractiveSession_2011

ALTER DATABASE Staples  REMOVE FILE FactInteractiveSession_2012

ALTER DATABASE Staples  REMOVE FILE FactInteractiveSession_2013

ALTER DATABASE Staples  REMOVE FILE FactInteractiveSession_2014


ALTER DATABASE Staples  REMOVE FILE FactInteractiveSessionObject_2010

ALTER DATABASE Staples  REMOVE FILE FactInteractiveSessionObject_2011

ALTER DATABASE Staples  REMOVE FILE FactInteractiveSessionObject_2012

ALTER DATABASE Staples  REMOVE FILE FactInteractiveSessionObject_2013

ALTER DATABASE Staples  REMOVE FILE FactInteractiveSessionObject_2014


ALTER DATABASE Staples  REMOVE FILE FactInteractiveSessionRec_2010

ALTER DATABASE Staples  REMOVE FILE FactInteractiveSessionRec_2011

ALTER DATABASE Staples  REMOVE FILE FactInteractiveSessionRec_2012

ALTER DATABASE Staples  REMOVE FILE FactInteractiveSessionRec_2013

ALTER DATABASE Staples  REMOVE FILE FactInteractiveSessionRec_2014



-----
SELECT *
FROM SYS.DATA_spaces
WHERE type = 'ps'



DROP PARTITION scheme psh_FIS_DateEndKey
DROP PARTITION scheme psh_FISO_DateEndKey
DROP PARTITION scheme psh_FISR_DateEndKey
DROP PARTITION scheme psh_FTS_DateEndKey
DROP PARTITION scheme psh_FTSO_DateEndKey
DROP PARTITION scheme psh_FTSR_DateEndKey



ALTER DATABASE Staples  REMOVE FILEGROUP FactTargetSession_2010

ALTER DATABASE Staples  REMOVE FILEGROUP FactTargetSession_2011

ALTER DATABASE Staples  REMOVE FILEGROUP FactTargetSession_2012

ALTER DATABASE Staples  REMOVE FILEGROUP FactTargetSession_2013

ALTER DATABASE Staples  REMOVE FILEGROUP FactTargetSession_2014


ALTER DATABASE Staples  REMOVE FILEGROUP FactTargetSessionObject_2010

ALTER DATABASE Staples  REMOVE FILEGROUP FactTargetSessionObject_2011

ALTER DATABASE Staples  REMOVE FILEGROUP FactTargetSessionObject_2012

ALTER DATABASE Staples  REMOVE FILEGROUP FactTargetSessionObject_2013

ALTER DATABASE Staples  REMOVE FILEGROUP FactTargetSessionObject_2014



ALTER DATABASE Staples  REMOVE FILEGROUP FactTargetSessionRec_2010

ALTER DATABASE Staples  REMOVE FILEGROUP FactTargetSessionRec_2011

ALTER DATABASE Staples  REMOVE FILEGROUP FactTargetSessionRec_2012

ALTER DATABASE Staples  REMOVE FILEGROUP FactTargetSessionRec_2013

ALTER DATABASE Staples  REMOVE FILEGROUP FactTargetSessionRec_2014



ALTER DATABASE Staples  REMOVE FILEGROUP FactInteractiveSession_2010

ALTER DATABASE Staples  REMOVE FILEGROUP FactInteractiveSession_2011

ALTER DATABASE Staples  REMOVE FILEGROUP FactInteractiveSession_2012

ALTER DATABASE Staples  REMOVE FILEGROUP FactInteractiveSession_2013

ALTER DATABASE Staples  REMOVE FILEGROUP FactInteractiveSession_2014


ALTER DATABASE Staples  REMOVE FILEGROUP FactInteractiveSessionObject_2010

ALTER DATABASE Staples  REMOVE FILEGROUP FactInteractiveSessionObject_2011

ALTER DATABASE Staples  REMOVE FILEGROUP FactInteractiveSessionObject_2012

ALTER DATABASE Staples  REMOVE FILEGROUP FactInteractiveSessionObject_2013

ALTER DATABASE Staples  REMOVE FILEGROUP FactInteractiveSessionObject_2014


ALTER DATABASE Staples  REMOVE FILEGROUP FactInteractiveSessionRec_2010

ALTER DATABASE Staples  REMOVE FILEGROUP FactInteractiveSessionRec_2011

ALTER DATABASE Staples  REMOVE FILEGROUP FactInteractiveSessionRec_2012

ALTER DATABASE Staples  REMOVE FILEGROUP FactInteractiveSessionRec_2013

ALTER DATABASE Staples  REMOVE FILEGROUP FactInteractiveSessionRec_2014



