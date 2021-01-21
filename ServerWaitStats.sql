SELECT TOP 10 wait_type, wait_time_ms
FROM sys.dm_os_wait_stats
ORDER BY wait_time_ms DESC

SELECT *
FROM sys.dm_os_tasks

--DBCC SQLPERF ('sys.dm_os_wait_stats', CLEAR);

--Raider5\i1
wait_type                                                    wait_time_ms
------------------------------------------------------------ --------------------
PAGEIOLATCH_SH                                               8325612352
WRITELOG                                                     5039512776
FT_IFTS_SCHEDULER_IDLE_WAIT                                  3805059980
PAGEIOLATCH_EX                                               3302836516
LAZYWRITER_SLEEP                                             2571355479
DISPATCHER_QUEUE_SEMAPHORE                                   2225808633
XE_TIMER_EVENT                                               1288978405
SQLTRACE_INCREMENTAL_FLUSH_SLEEP                             1288939078
REQUEST_FOR_DEADLOCK_SEARCH                                  1288929248
XE_DISPATCHER_WAIT                                           1286787212


--Raider6\i1
wait_type                                                    wait_time_ms
------------------------------------------------------------ --------------------
PAGEIOLATCH_SH                                               28244396241
WRITELOG                                                     13834023692
PAGELATCH_EX                                                 11468657781
PAGEIOLATCH_EX                                               8708406202
SOS_SCHEDULER_YIELD                                          8517722978
PAGELATCH_SH                                                 4527160624
DISPATCHER_QUEUE_SEMAPHORE                                   2761539748
ASYNC_NETWORK_IO                                             1892484282
LAZYWRITER_SLEEP                                             1700380473
LATCH_EX                                                     1191647472


--Raider7\i1
wait_type                                                    wait_time_ms
------------------------------------------------------------ --------------------
WRITELOG                                                     46,922,189,674
PAGEIOLATCH_SH                                               42080738662
PAGELATCH_EX                                                 16880327777
SOS_SCHEDULER_YIELD                                          16577852979
LAZYWRITER_SLEEP                                             14938481463
PAGEIOLATCH_EX                                               11949698287
PAGELATCH_SH                                                 8371535773
DISPATCHER_QUEUE_SEMAPHORE                                   7042605789
ASYNC_NETWORK_IO                                             5485784895
CMEMTHREAD                                                   4127704189



--Raider7b\i1
wait_type                                                    wait_time_ms
------------------------------------------------------------ --------------------
PAGEIOLATCH_SH                                               4,976,573,293
DISPATCHER_QUEUE_SEMAPHORE                                   1280121441
REQUEST_FOR_DEADLOCK_SEARCH                                  971830599
SQLTRACE_INCREMENTAL_FLUSH_SLEEP                             971827746
XE_TIMER_EVENT                                               971813869
LAZYWRITER_SLEEP                                             971458869
FT_IFTS_SCHEDULER_IDLE_WAIT                                  963794750
LOGMGR_QUEUE                                                 958742949
XE_DISPATCHER_WAIT                                           958133542
WRITELOG                                                     917577874

--Raider8\i1
wait_type                                                    wait_time_ms
------------------------------------------------------------ --------------------
PAGEIOLATCH_SH                                               42077827707
WRITELOG                                                     20830154454
PAGELATCH_EX                                                 17000739213
PAGEIOLATCH_EX                                               14696249057
PAGELATCH_SH                                                 10191127505
LAZYWRITER_SLEEP                                             10156702628
SOS_SCHEDULER_YIELD                                          9150579358
DISPATCHER_QUEUE_SEMAPHORE                                   4225647628
ASYNC_NETWORK_IO                                             2601939422
BROKER_EVENTHANDLER                                          2567015328


--Reporting3
wait_type                                                    wait_time_ms
------------------------------------------------------------ --------------------
CXPACKET                                                     12226968916
PAGEIOLATCH_SH                                               2663468345
WRITELOG                                                     2485092679
OLEDB                                                        2421331778
ASYNC_NETWORK_IO                                             2217477120
PAGEIOLATCH_EX                                               1505040830
CLR_AUTO_EVENT                                               1198161511
LAZYWRITER_SLEEP                                             1195295237
DISPATCHER_QUEUE_SEMAPHORE                                   882128846
XE_TIMER_EVENT                                               600076331


Reporting4
wait_type                                                    wait_time_ms
------------------------------------------------------------ --------------------
CXPACKET                                                     2122470373
LATCH_EX                                                     1446694532
LAZYWRITER_SLEEP                                             1199759088
DISPATCHER_QUEUE_SEMAPHORE                                   627137583
XE_DISPATCHER_WAIT                                           606226654
XE_TIMER_EVENT                                               600133607
LOGMGR_QUEUE                                                 600132204
SQLTRACE_INCREMENTAL_FLUSH_SLEEP                             600115706
REQUEST_FOR_DEADLOCK_SEARCH                                  600105008
CHECKPOINT_QUEUE                                             597360112

--Reporting4\DataWarehouse1
wait_type                                                    wait_time_ms
------------------------------------------------------------ --------------------
CXPACKET                                                     3765949430
PAGEIOLATCH_EX                                               3516495568
CLR_AUTO_EVENT                                               2433043214
LAZYWRITER_SLEEP                                             2408768194
ASYNC_NETWORK_IO                                             2354854228
DISPATCHER_QUEUE_SEMAPHORE                                   1795671505
BROKER_EVENTHANDLER                                          1283216109
XE_DISPATCHER_WAIT                                           1208941636
XE_TIMER_EVENT                                               1208611215
SQLTRACE_INCREMENTAL_FLUSH_SLEEP                             1208604376

--Colo1-VM-Admin1
wait_type                                                    wait_time_ms
------------------------------------------------------------ --------------------
REQUEST_FOR_DEADLOCK_SEARCH                                  4371533579
XE_TIMER_EVENT                                               4371518115
LOGMGR_QUEUE                                                 4371492572
LAZYWRITER_SLEEP                                             4371336541
SQLTRACE_INCREMENTAL_FLUSH_SLEEP                             4371276813
CHECKPOINT_QUEUE                                             4351257922
FT_IFTS_SCHEDULER_IDLE_WAIT                                  4335303402
XE_DISPATCHER_WAIT                                           4332224609
DISPATCHER_QUEUE_SEMAPHORE                                   2546356395
SLEEP_TASK                                                   2187690394