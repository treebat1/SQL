USE HomeDepot;  
GO  


ALTER FULLTEXT INDEX ON DBO.Item_Info_homedepotC01   
   set change_tracking = manual;  

alter fulltext index on dbo.Item_Info_homedepotC02
 set change_tracking = manual; 

 ALTER FULLTEXT INDEX ON DBO.Item_Info_homedepotc01_userlists   
   set change_tracking = manual;

ALTER FULLTEXT INDEX ON DBO.Item_Info_HomeDepotC01_Categories   
   set change_tracking =  manual;
 


ALTER FULLTEXT INDEX ON DBO.Item_Info_homedepotC01   
   set change_tracking = auto;  

alter fulltext index on dbo.Item_Info_homedepotC02
 set change_tracking = auto; 

ALTER FULLTEXT INDEX ON DBO.Item_Info_homedepotc01_userlists   
   set change_tracking = auto;

ALTER FULLTEXT INDEX ON DBO.Item_Info_HomeDepotC01_Categories   
   set change_tracking =  auto;







