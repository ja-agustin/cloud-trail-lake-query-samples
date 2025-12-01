/* 
    This query displays access denied Network Activities events on KMS that were traversing  VPCe Endpoints. 
    The Access Denied events are typically due to VPCe policy failure. This script will provide visibility on the events
    trying to access your Keys. In this example, we filter by eventName IN  ('ListKeys', 'CreateKey', 'DescribeKey') to see who's trying to 
    list, create new key, and descbrive your keys in KMS

    Feel free to remove the commend errorCode to see Denied and Allowed.
    
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
    AND eventSource = 'kms.amazonaws.com' 
    AND errorCode = 'VpceAccessDenied' 
    AND eventName IN ('ListKeys', 'CreateKey', 'DescribeKey')
    AND eventTime >= '${date_filter}'
    AND eventTime <= '${date_filter}'

 

 