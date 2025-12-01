 /* 
    This query displays CloudTrail Network Activity that traversed a specific VPCe. To do that, supply the VPCe ARN in the below filter. 
    
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
    sourceIPAddress
FROM <Event data store Id>
WHERE eventCategory = 'NetworkActivity' 
    AND vpcEndpointId = '${vpcEndpointId}'
    AND eventTime >= '${date_filter}'
    AND eventTime <= '${date_filter}'

 

 

 