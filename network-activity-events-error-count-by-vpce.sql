/* 
    This query displays the error count per day of CloudTrail Network Activity events. It also include the VPCe ARN and Owner.

    Note: Add filter Criteria in the where clause to filter the result set. Without a filter criteria, this query will scann all 
    the data and will result to very slow query.
*/

SELECT vpcEndpointId,
    vpcEndpointAccountId,
    DATE(eventTime) as eventDate,
    errorCode,
    COUNT(*)    
FROM <Event data store Id>
WHERE eventCategory = 'NetworkActivity' 
    AND vpcEndpointId = '${vpcEndpointId}'
    AND eventTime >= '${date_filter}'
    AND eventTime <= '${date_filter}'
GROUP BY vpcEndpointId,
    vpcEndpointAccountId,
    DATE(eventTime),
    errorCode