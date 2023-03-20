SELECT id,project_id,account_id,parent_id,0 AS ismale, 
0 AS isfemale, 1 AS persona, level_id,STATUS
,cost,created_at,userAssigned_id,creatorUser_id
,TYPE,factorNatural,d,i,s,c 
FROM evaluation_instance 
WHERE TYPE ='discjovenes' 
AND cache_evaluation_type_main = 'discpersonal' 
AND factorNatural IS NOT NULL AND d > 0
