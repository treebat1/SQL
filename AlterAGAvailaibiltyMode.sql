ALTER AVAILABILITY GROUP [car-rad-ag2] MODIFY REPLICA ON 'CHDC-SQL-PCCH2A\I1'  
   WITH (AVAILABILITY_MODE = SYNCHRONOUS_COMMIT);  
ALTER AVAILABILITY GROUP [car-rad-ag2] MODIFY REPLICA ON 'CHDC-SQL-PCCH2A\I1'  
   WITH (FAILOVER_MODE = AUTOMATIC);  