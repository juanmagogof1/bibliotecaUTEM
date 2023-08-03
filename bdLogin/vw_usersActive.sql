CREATE VIEW usersActive as
SELECT userId AS uId,cveUser AS userCode,userPass AS Pass FROM catusers
WHERE bActive = 1;
