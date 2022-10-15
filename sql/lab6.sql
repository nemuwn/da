1
SELECT registration.branchNo, branch.city, branch.postcode, staff.fName, staff.staffNo, staff.position1, registration.clientNo, client1.fName, client1.telNo, client1.preftype 
FROM (((registration
     INNER JOIN branch ON registration.branchNo=branch.branchNo)
     INNER JOIN staff ON registration.staffNo=staff.staffNo)
     INNER JOIN client1 ON registration.clientNo=client1.clientNo)
           
2
SELECT r.staffNo, b.*
FROM registration r, branch b
WHERE r.branchNo=b.branchNo AND r.dateJoined="2004-01-02"



3
SELECT v.viewDate, c.*
FROM viewing v, client1 c
WHERE v.clientNo=c.clientNo AND viewDate LIKE "2004-05%"

4
SELECT fName
FROM staff
GROUP BY fName
UNION ALL
SELECT fName
FROM client1
GROUP BY fName
UNION ALL
SELECT fName 
FROM privateowner
GROUP BY fName

5
SELECT fName, lName, telNo
FROM client1
WHERE telNo LIKE "%22%"
UNION ALL
SELECT fName, lName, telNo
FROM privateowner
WHERE telNo LIKE "%22%"

6
SELECT pr.*, s.fName, s.staffNo, s.position1, b.city, s.branchNo
FROM propertyforrent p, privateowner pr, staff s, branch b
WHERE p.ownerNo=pr.ownerNo AND b.branchNo=s.branchNo AND p.staffNo=s.staffNo AND p.rooms=3

7
CREATE TABLE backup1 AS
SELECT *
FROM propertyforrent

8
SELECT branchNo, city, COUNT(propertyNo)
FROM propertyforrent
GROUP BY branchNo
HAVING COUNT(propertyNo)>2
ORDER BY branchNo

9
CREATE TABLE StaffPropCount AS
SELECT s.staffNo, s.fName, s.lName, COUNT(p.propertyNo) AS proCount
FROM staff s, propertyforrent p
WHERE s.staffNo=p.staffNo
GROUP BY p.staffNo

10
CREATE TABLE BranchInf AS
SELECT b.branchNo, b.city , COUNT(s.staffNo) AS staffCount
FROM branch b, staff s
WHERE b.branchNo=s.branchNo
GROUP BY b.branchNo

11
SELECT s.*, b.*
FROM privateowner pr, propertyforrent p, staff s, branch b
WHERE pr.ownerNo=p.ownerNo AND p.staffNo=s.staffNo AND s.branchNo=b.branchNo AND pr.fName LIKE "C%"

12
SELECT s.staffNo, COUNT(p.propertyNo), s.branchNo
FROM propertyforrent p, staff s
WHERE s.staffNo=p.staffNo AND s.branchNo="B005"
GROUP BY s.staffNo

13
SELECT pr.fName, pr.address, pr.telNo, p.rent, p.city, p.rooms, s.fName
FROM viewing v, propertyforrent p, privateowner	pr, staff s
WHERE v.propertyNo=p.propertyNo AND pr.ownerNo=p.ownerNo AND p.staffNo=s.staffNo AND v.comment1="no dining room"

14
SELECT b.city, b.branchNo, s.position1, COUNT(staffNo) AS count1
FROM branch b, staff s
WHERE b.branchNo=s.branchNo 
GROUP BY s.position1, b.city, b.branchNo

15
UPDATE staff
SET position1="Manager", salary=25000
WHERE branchNo="B007" AND sex="F"


