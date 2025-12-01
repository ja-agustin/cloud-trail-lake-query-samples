/* 
    This query displays Network Activities events that were write operation. 
    
    This is helpful to see who's trying to do write operations (which could be new keys, deleting keys of performing and update).
        
    Note: Add filter Criteria in the where clause to filter the result set. Without a filter criteria, this query will scann all 
    the data and will result to very slow query.
*/

SELECT userIdentity.username,
    userIdentity.accountid,
    eventType,
    eventCategory,
    eventName,
    errorCode,
    errorMessage,
    vpcEndpointId,
    vpcEndpointAccountId,
    sourceIPAddress,
    readOnly
FROM <Event data store Id>
WHERE eventCategory = 'NetworkActivity'
    AND eventSource = 'kms.amazonaws.com' 
    AND readOnly = false    
    AND eventTime >= '${date_filter}'
    AND eventTime <= '${date_filter}'

 

 