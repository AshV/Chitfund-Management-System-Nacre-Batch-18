-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.25a - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2014-07-04 16:41:18
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for dotnet_chitfunddb
DROP DATABASE IF EXISTS `dotnet_chitfunddb`;
CREATE DATABASE IF NOT EXISTS `dotnet_chitfunddb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dotnet_chitfunddb`;


-- Dumping structure for procedure dotnet_chitfunddb.deepak_AdminImp
DROP PROCEDURE IF EXISTS `deepak_AdminImp`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `deepak_AdminImp`(Name varchar(15))
BEGIN


select firstname,userId from tbl_user join tbl_usertype
on tbl_usertype.userTypeId=tbl_user.userTypeId
where tbl_usertype.typename=Name;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.GetAreaAgentChit
DROP PROCEDURE IF EXISTS `GetAreaAgentChit`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAreaAgentChit`()
SELECT DISTINCT tbl_address.addressId,tbl_chit.chitId,tbl_user.userId,tbl_user.firstName, tbl_chit.chitName, tbl_address.area
FROM tbl_address, tbl_chit, tbl_user INNER JOIN tbl_usertype ON tbl_user.userTypeId = tbl_usertype.userTypeId
WHERE (((tbl_usertype.typeName)='Agent'))//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.GetChitsForCustomer
DROP PROCEDURE IF EXISTS `GetChitsForCustomer`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetChitsForCustomer`(in _customerId int)
BEGIN
SELECT a.chitId,a.chitName,a.chitValue Total_Amount from tbl_chit a
join tbl_customerdocument b on a.chitId=b.chitId where customerId=_customerId;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.GetCustomersRemove
DROP PROCEDURE IF EXISTS `GetCustomersRemove`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCustomersRemove`(_chitId int)
BEGIN
select c.customerId,cn.customerName,c.subscriberDocId from tbl_customerdocument c,tbl_customer cn where c.chitId in(select chitId from tbl_chit 
where chitId=_chitId) and c.customerId=cn.customerId;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.getid1
DROP PROCEDURE IF EXISTS `getid1`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `getid1`(out f11 int)
BEGIN
insert into tbl_address values('dsfs','dsf5','fdfd',1,123);
select last_insert_addressId() into f11;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.GetNewNomineeIdName
DROP PROCEDURE IF EXISTS `GetNewNomineeIdName`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNewNomineeIdName`()
BEGIN
SELECT nomineeId,nomineeName FROM tbl_nominee where nomineeId=(select max(nomineeId) from tbl_nominee);
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.jo_chitActive
DROP PROCEDURE IF EXISTS `jo_chitActive`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `jo_chitActive`()
BEGIN
select chitName,chitValue,noOfCustomer,(month(curdate())-month(chitGroupStartDate)) as noOfMonthsCompleted,
( month(chitGroupEndDate)+month(curdate())) as noOfMonthsRemaining 
from tbl_chit where status=1;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.new_procedure
DROP PROCEDURE IF EXISTS `new_procedure`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedure`(in _cname varchar(50))
BEGIN
select chitId from chit where chitName=_cname;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.new_procedurek
DROP PROCEDURE IF EXISTS `new_procedurek`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedurek`(in yr Year)
BEGIN
select cht.chitId,  count(cosDoc.customerId) ,cht.chitName, cht.userId,usr.firstName 
as Agent_Name ,adr.area,col.amountCollected, col.dateOfPayment
from tbl_chit cht, tbl_user usr,
tbl_address adr, tbl_collection col,tbl_customerdocument cosDoc where cht.userId=usr.userId
and usr.addressId=adr.addressId and(cht.userId=col.userId 
and EXTRACT(YEAR FROM col.dateOfPayment)=yr) and cht.chitId=cosDoc.chitId group by(chitId);
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.prc_admin6
DROP PROCEDURE IF EXISTS `prc_admin6`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_admin6`()
Begin
Select tbl_user.userId,tbl_user.firstName From tbl_user Where userTypeId=(Select userTypeId From tbl_usertype Where tbl_usertype.typeName='Admin');
End//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.prc_chit2
DROP PROCEDURE IF EXISTS `prc_chit2`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_chit2`(In chitid int(10))
Begin
Select * From tbl_chit Where tbl_chit.chitId=chitid;
End//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.prc_chitactive2
DROP PROCEDURE IF EXISTS `prc_chitactive2`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_chitactive2`()
Begin
Select a.chitName,a.chitValue,a.noOfMonths,b.customerId From tbl_chit a inner join tbl_subscriber b Where b.customerId=(Select customerId From tbl_subscriber Where userId=(Select userId From tbl_chit a Where status=1 limit 1));
end//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.prc_chitactive4
DROP PROCEDURE IF EXISTS `prc_chitactive4`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_chitactive4`()
BEGIN
Select a.chitName,a.chitValue,a.noOfMonths,b.customerId From tbl_chit a inner join tbl_subscriber b Where b.customerId=(Select customerId From tbl_subscriber Where userId=(Select userId From tbl_chit a Where status=1));
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.prc_chitinactive2
DROP PROCEDURE IF EXISTS `prc_chitinactive2`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_chitinactive2`()
BEGIN
Select a.chitName,a.noOfCustomer,b.firstName as AgentName From tbl_chit a inner join tbl_user b Where b.userId=(Select tbl_user.userId From tbl_user Where tbl_user.userTypeId=102 limit 1);
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.proc1
DROP PROCEDURE IF EXISTS `proc1`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc1`()
select a.chitId,a.chitName,date_format(b.date,'%M') as month,installmentAmount,b.paidAmount,c.dateOfInstallment,c.installmentAmount-b.paidamount as dueamount from tbl_chit a
join tbl_monthlypayment b on a.chitId=b.chitpaymentId
join tbl_monthlypaymentinstallment c on  c.chitpaymentId=a.chitId//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.proc2
DROP PROCEDURE IF EXISTS `proc2`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc2`(in _customerId int)
SELECT a.chitId,a.chitValue from tbl_chit a
join tbl_customerdocument b on a.chitId=b.chitId where customerId=_customerId//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.procjoin
DROP PROCEDURE IF EXISTS `procjoin`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `procjoin`()
BEGIN
select a.chitId,a.chitName,date_format(b.date,'%M') as month,
date_format(c.installmentAmount,'%M'),b.paidAmount,c.dateOfInstallment,c.installmentAmount-b.paidamount as dueamount from tbl_chit a
join tbl_monthlypayment b on a.chitId=b.chitpaymentId
join tbl_monthlypaymentinstallment c on  c.chitpaymentId=a.chitId;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.select_agentName
DROP PROCEDURE IF EXISTS `select_agentName`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_agentName`(userTypeId int)
SELECT tbl_user.firstName
FROM tbl_user INNER JOIN tbl_usertype ON tbl_user.usertypeid = tbl_usertype.usertypeid
WHERE (((tbl_usertype.usertypeid)=userTypeId))//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_7thnoOfChitStartedThisMonth
DROP PROCEDURE IF EXISTS `sp_7thnoOfChitStartedThisMonth`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_7thnoOfChitStartedThisMonth`(in dtmnth date)
BEGIN
select cht.chitName, cht.chitValue as chitAmount, 
usr.FirstName as AgentName,count(cdtbl.customerid) as no_OFSubscribar,
-(((EXTRACT(Year FROM cht.chitGroupStartDate)-EXTRACT(Year FROM cht.chitGroupEndDate))*12)-
EXTRACT(Month FROM cht.chitGroupStartDate)-EXTRACT(Month FROM cht.chitGroupEndDate)) as remaingMonth
from tbl_chit cht, tbl_user usr,
 tbl_customerdocument cdtbl where (cht.userId=usr.userId and cht.chitId=cdtbl.chitId
 and EXTRACT(Month FROM cht.chitGroupStartDate)= EXTRACT(month from dtmnth)) group by(cht.chitId);

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_7thNoOfchitStartedThisYear
DROP PROCEDURE IF EXISTS `sp_7thNoOfchitStartedThisYear`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_7thNoOfchitStartedThisYear`(in yr Year)
BEGIN
select cht.chitName, cht.chitValue as chitAmount, 
usr.FirstName as AgentName,count(cdtbl.customerid) as no_OFSubscribar,
-(((EXTRACT(Year FROM cht.chitGroupStartDate)-EXTRACT(Year FROM cht.chitGroupEndDate))*12)-
EXTRACT(Month FROM cht.chitGroupStartDate)-EXTRACT(Month FROM cht.chitGroupEndDate)) as remaingMonth
from tbl_chit cht, tbl_user usr,
 tbl_customerdocument cdtbl where (cht.userId=usr.userId and cht.chitId=cdtbl.chitId
 and EXTRACT(YEAR FROM cht.chitGroupStartDate)=yr) group by(cht.chitId);
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_ActiveChits
DROP PROCEDURE IF EXISTS `Sp_ActiveChits`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ActiveChits`()
BEGIN
select cht.chitId, cht.chitName,cht.chitValue,cht.chitGroupStartDate from tbl_chit cht where cht.status=1 ;
end//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.SP_AddBranchForBank
DROP PROCEDURE IF EXISTS `SP_AddBranchForBank`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AddBranchForBank`(_branchName varchar(20),_bankId int )
BEGIN

 
insert into tbl_branch(branchName,bankId) values(_branchName,_bankId);
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.SP_AddFirstInstallment
DROP PROCEDURE IF EXISTS `SP_AddFirstInstallment`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AddFirstInstallment`(_chitId int, _customerId int, _date Date, _installment double)
BEGIN
INSERT INTO `dotnet_chitfunddb`.`tbl_monthlypayment`
(`subscriberDocId`,
`installment`,
`date`,
`paidAmount`)
VALUES
(
(Select subscriberDocId from tbl_customerDocument where customerId = _customerId and chitId = _chitId),
_installment,
_date,
0
);

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_AddProofType
DROP PROCEDURE IF EXISTS `sp_AddProofType`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AddProofType`()
SELECT * FROM tbl_addressprooftype//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_AdminDetail
DROP PROCEDURE IF EXISTS `Sp_AdminDetail`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_AdminDetail`(IN uid INT)
BEGIN
select * from tbl_user
where userId =uid;

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_AdminImp
DROP PROCEDURE IF EXISTS `Sp_AdminImp`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_AdminImp`()
BEGIN


select firstname,userId from tbl_user where userTypeId=(select 

userTypeId from tbl_usertype where typeName='Admin');
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_AdminTotalInfo
DROP PROCEDURE IF EXISTS `Sp_AdminTotalInfo`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_AdminTotalInfo`(in uid int )
BEGIN
select c.userId, u.firstName,u.lastName,c.chitName,u.doj,u.mobileNo
 from tbl_user u ,tbl_chit c
where u.userId =uid and c.userId=uid;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_Agent
DROP PROCEDURE IF EXISTS `Sp_Agent`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Agent`()
BEGIN


select userId,firstname from tbl_user where userTypeId=(select 

userTypeId from tbl_usertype where typeName='Agent');
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_allAdmin
DROP PROCEDURE IF EXISTS `sp_allAdmin`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_allAdmin`()
BEGIN
select u.firstName,u.lastName,u.mobileNo,u.doj,c.chitName,c.chitgroupStartDate from tbl_user u,tbl_chit c where u.userId=c.userId;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_Alladmindetl
DROP PROCEDURE IF EXISTS `Sp_Alladmindetl`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Alladmindetl`()
BEGIN
select firstname from tbl_user join tbl_usertype
on tbl_usertype.userTypeId=tbl_user.userTypeId
where tbl_usertype.typename='Agent';
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_Alladmindt
DROP PROCEDURE IF EXISTS `Sp_Alladmindt`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Alladmindt`()
BEGIN
SELECT  tbl_user.firstName, tbl_user.doj,tbl_user.mobileNo,tbl_chit.chitName, tbl_chit.noOfMonths, tbl_chit.noOfCustomer
FROM tbl_chit RIGHT OUTER JOIN tbl_user ON tbl_chit.userId = tbl_user.userId
left outer join tbl_usertype on
tbl_usertype.userTypeId=tbl_user.userTypeId
where tbl_usertype.typeName='Admin';
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_AllAdmnDetls
DROP PROCEDURE IF EXISTS `Sp_AllAdmnDetls`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_AllAdmnDetls`()
BEGIN
select u.firstName,u.middleName,u.lastName,u.mobileNo,c.chitName,u.doj,c.chitGroupStartDate,u.mobileNo
 from tbl_user u ,tbl_chit c,tbl_usertype ut
where  ut.typeName='Admin'  and u.userTypeId=ut.userTypeId and u.userId =c.userId;


 


END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.SP_allagentdt
DROP PROCEDURE IF EXISTS `SP_allagentdt`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_allagentdt`()
BEGIN
SELECT  tbl_user.firstName, tbl_user.doj,tbl_user.mobileNo,tbl_chit.chitName, tbl_chit.noOfMonths, tbl_chit.noOfCustomer
FROM tbl_chit RIGHT OUTER JOIN tbl_user ON tbl_chit.userId = tbl_user.userId
left outer join tbl_usertype on
tbl_usertype.userTypeId=tbl_user.userTypeId
where tbl_usertype.typeName='Agent';
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_allsubscriber
DROP PROCEDURE IF EXISTS `Sp_allsubscriber`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_allsubscriber`()
BEGIN
select cut.customerName, cut.mobileNo,count(c.chitName)totalchits,
m.balanceRemaining,c.chitValue,m.amountCollected,m.balanceRemaining,a.houseNo,a.street,st.state,ci.city,cut.customerName
 from  tbl_user u, tbl_chit c, tbl_address a,
tbl_collection m ,tbl_state st,tbl_city ci,tbl_customer cut
where c.userId = u.userId and c.userId =m.userId and u.addressId =a.addressId 
and a.cityId=ci.cityId and ci.stateId =st.stateId and cut.addressId=a.addressId
group by c.userId;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_AllSubscriberDetails
DROP PROCEDURE IF EXISTS `Sp_AllSubscriberDetails`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_AllSubscriberDetails`()
BEGIN
select u.firstName,u.mobileNo,count(c.chitName)totalchits,
m.balanceRemaining,c.chitValue,m.amountCollected,m.balanceRemaining,a.area,a.houseNo,a.street,st.state,ci.city
 from  tbl_user u, tbl_chit c, tbl_address a,tbl_collection m ,tbl_state st,tbl_city ci
where c.userId = u.userId and c.userId =m.userId and u.addressId =a.addressId 
and a.cityId=ci.cityId and ci.stateId =st.stateId
group by c.userId;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_allsubscriberdue
DROP PROCEDURE IF EXISTS `Sp_allsubscriberdue`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_allsubscriberdue`()
BEGIN
select u.mobileNo,count(c.chitName)totalchits,
m.balanceRemaining,c.chitValue,m.amountCollected,m.balanceRemaining,a.houseNo,a.street,st.state,ci.city,cut.customerName
 from  tbl_user u, tbl_chit c, tbl_address a,tbl_collection m ,tbl_state st,tbl_city ci,tbl_customer cut
where c.userId = u.userId and c.userId =m.userId and u.addressId =a.addressId 
and a.cityId=ci.cityId and ci.stateId =st.stateId and cut.addressId=a.addressId and m.balanceRemaining is not null
group by c.userId;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_area
DROP PROCEDURE IF EXISTS `Sp_area`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_area`(in _Areaid int )
BEGIN
select u.mobileNo,count(c.chitName)totalchits,
m.balanceRemaining,c.chitValue,m.amountCollected,m.balanceRemaining,a.houseNo,a.street,st.state,a.area,ci.city,cut.customerName
 from  tbl_user u, tbl_chit c, tbl_address a,tbl_collection m ,tbl_state st,tbl_city ci,tbl_customer cut
where c.userId = u.userId and c.userId =m.userId and u.addressId =a.addressId 
and a.cityId=ci.cityId and ci.stateId =st.stateId  and a.addressId=_Areaid and cut.addressId=a.addressId
group by c.userId;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_areaddl
DROP PROCEDURE IF EXISTS `Sp_areaddl`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_areaddl`()
BEGIN
select addressId,area from tbl_address;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_arr
DROP PROCEDURE IF EXISTS `Sp_arr`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_arr`(in _Area varchar(12) )
BEGIN
select u.mobileNo,count(c.chitName)totalchits,
m.balanceRemaining,c.chitValue,m.amountCollected,m.balanceRemaining,a.houseNo,a.street,st.state,a.area,ci.city,cut.customerName
 from  tbl_user u, tbl_chit c, tbl_address a,tbl_collection m ,tbl_state st,tbl_city ci,tbl_customer cut
where c.userId = u.userId and c.userId =m.userId and u.addressId =a.addressId 
and a.cityId=ci.cityId and ci.stateId =st.stateId  and a.area=_Area and cut.addressId=a.addressId
group by c.userId;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_auctionNo
DROP PROCEDURE IF EXISTS `sp_auctionNo`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_auctionNo`(in _chitid int)
BEGIN
Declare count int;
 select count(*) into count from tbl_auction where chitId = _chitid;
if count <1 then
select 1;
else 
select max(auctionNo)+1 from tbl_auction group by chitId having chitId=_chitid;
end if;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_authentication
DROP PROCEDURE IF EXISTS `sp_authentication`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_authentication`(IN `_PloginId` VARCHAR(25),In `_Ppassword` VARCHAR(25))
Begin
declare `_ProleId` int;
declare `_PuserName` varchar(50);
declare `_ProleName` varchar(50);
declare `_PuserId` int;
set `_PuserName`= (select firstName from tbl_user where loginId=`_PloginId` and password=`_Ppassword`);

set `_ProleId`=(select userTypeId from tbl_user where loginId=`_PloginId` and password=`_Ppassword`);
if(`_PuserName` is not null) then
set _ProleName=(select typeName from tbl_usertype where userTypeId=_ProleId);
set `_PuserId` = (select userId from tbl_user where loginId=`_PloginId` and password=`_Ppassword`);
select _PuserName,_ProleName, _PuserId;
else
select 0,0,0;
end if;
End//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_autocomplate
DROP PROCEDURE IF EXISTS `sp_autocomplate`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_autocomplate`(_str varchar(15))
select customerName, customerId from tbl_customer where customerName like concat(_str, '%')//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_ChangePassword
DROP PROCEDURE IF EXISTS `sp_ChangePassword`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ChangePassword`(In _PloginId VARCHAR(25),In _PoldPasword VARCHAR(25),In _PnewPasword VARCHAR(25))
Begin
declare _Pdpassword VARCHAR(25);
set _Pdpassword=(select password from tbl_user where loginid=_PloginId);
if _Pdpassword = _PoldPasword then
update tbl_user set password=_PNewPasword where loginId=_PloginId;
select 1;
else
select 2;
end if;
End//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_chit
DROP PROCEDURE IF EXISTS `sp_chit`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_chit`()
BEGIN
select * from tbl_chit;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_chitAmount
DROP PROCEDURE IF EXISTS `Sp_chitAmount`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_chitAmount`(in amount double)
BEGIN
select c.chitName,
       c.noOfMonths,
       c.chitGroupStartDate,
	   c.chitGroupEndDate,
       c.status
       from tbl_chit c
       left outer join tbl_user u on
       c.userId=u.userId
      left outer join tbl_subscriber sb on
	   u.userId=sb.userId
      left outer join tbl_customer cut on
       sb.customerId=cut.customerId
      where c.chitValue=amount 
      group by chitName;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_chitInfo
DROP PROCEDURE IF EXISTS `sp_chitInfo`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_chitInfo`(_chitID int)
BEGIN
SELECT distinct tbl_chit.chitName, tbl_chit.noOfMonths, tbl_chit.chitValue,tbl_chit.chitValue / tbl_chit.noOfCustomer as monthlyInstallment, tbl_chit.chitGroupStartDate,  tbl_chit.noOfCustomer - (select count(*) from  tbl_customerdocument where  tbl_customerdocument.chitId = _chitId ) as availableSlots
FROM tbl_chit LEFT OUTER JOIN tbl_customerdocument ON tbl_chit.chitId = tbl_customerdocument.chitId where  tbl_chit.chitId = _chitId;

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.SP_ChitInstallments
DROP PROCEDURE IF EXISTS `SP_ChitInstallments`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ChitInstallments`(in _customerId int, _chitId int)
BEGIN

select Date, DATE_FORMAT (date,'%M') as Months, DATE_FORMAT (date,'%Y') as Years, installment, Paidamount,   installment-Paidamount as dueamount from tbl_monthlypayment where subscriberDocId = (select subscriberDocId from tbl_customerdocument where customerId = _customerId and chitId = _chitId) order By `Date`;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_chitUpdate
DROP PROCEDURE IF EXISTS `sp_chitUpdate`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_chitUpdate`(
_chitId int(11),
_chitName varchar(50),
_noOfMonths int(11),
_noOfCustomer int(11),
_chitValue double,
_chitGroupStartDate date,
_chitGroupEndDate date,
_chitGroupAuctionDay varchar(50),
_previousSanctionNumber varchar(15),
_previousSanctionDate date,
_CCBNumber varchar(15),
_CCBDate date,
_summary varchar(50),
_registrationNumber varchar(50),
_status bit(1))
BEGIN

update tbl_chit
set

chitName=_chitName,
noOfMonths=_noOfMonths,
noOfCustomer=_noOfCustomer,
chitValue=_chitValue,
chitGroupStartDate=_chitGroupStartDate,
chitGroupEndDate=_chitGroupEndDate,
chitGroupAuctionDay=_chitGroupAuctionDay,
previousSanctionNumber=_previousSanctionNumber,
previousSanctionDate=_previousSanctionDate,
CCBNumber=_CCBNumber,
CCBDate=_CCBDate,
summary=_summary,
registrationNumber=_registrationNumber,
status=_status
where chitId=_chitId;

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_chitValue
DROP PROCEDURE IF EXISTS `sp_chitValue`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_chitValue`(in _chitId int)
BEGIN
select chitValue,noOfCustomer from tbl_chit where chitId=_chitId;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_ChitYear
DROP PROCEDURE IF EXISTS `Sp_ChitYear`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ChitYear`(in yr Year)
BEGIN
declare Monthlyamount int; 
select cht.chitName, usr.firstName 
as Agent_Name ,adr.area,col.amountCollected
from tbl_chit cht, tbl_user usr,
tbl_address adr, tbl_collection col where cht.userId=usr.userId
and usr.addressId=adr.addressId and(cht.userId=col.userId and EXTRACT(YEAR FROM col.dateOfPayment)=yr);
select Monthlyamount=cht.chitValue/ cht.noOfCustomer;

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_CreateChit
DROP PROCEDURE IF EXISTS `sp_CreateChit`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CreateChit`(_chitName varchar(50),
in _noOfMonths int(11),
in _noOfCustomer int(11),
in _chitValue double,
in _chitGroupStartDate date,
in _chitGroupEndDate date,
in _chitGroupAuctionDay varchar(50),
in _previousSanctionNumber varchar(15),
in _previousSanctionDate date,
in _CCBNumber varchar(15),
in _CCBDate date,
in _summary varchar(50),
in _registrationNumber varchar(50),
in _status bit(1),
in _userId int(11))
Begin

Declare _chitId int;
set _chitId=(select Max(chitId)+1 from tbl_chit);

insert into tbl_chit values(_chitId,
_chitName,
_noOfMonths,
_noOfCustomer,
_chitValue ,
_chitGroupStartDate ,
_chitGroupEndDate ,
_chitGroupAuctionDay ,
_previousSanctionNumber ,
_previousSanctionDate ,
_CCBNumber ,
_CCBDate ,
_summary ,
_registrationNumber,
_status ,_userId);

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_customer
DROP PROCEDURE IF EXISTS `sp_customer`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_customer`(_custId int)
BEGIN
  select c1.customerName,c1.dob,c1.mobileNo,c1.doj,c1.addressId,
    a1.area,a1.houseNo,a1.street
   from tbl_customer as c1,tbl_address as a1 where 
   c1.addressId=a1.addressId and customerID=_custId;

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.SP_CustomerAddress
DROP PROCEDURE IF EXISTS `SP_CustomerAddress`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CustomerAddress`(_area varchar(50),
_houseNo varchar(50),
_street varchar(50),
_cityId int,
_zip int)
BEGIN
INSERT INTO `tbl_address`
(`area`,
`houseNo`,
`street`,
`cityId`,
`zip`)
VALUES
(
_area,
_houseNo,
_street,
_cityId,
_zip);

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_customerFromChit
DROP PROCEDURE IF EXISTS `sp_customerFromChit`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_customerFromChit`(_chitId int)
BEGIN
SELECT DISTINCT tbl_chit.chitId, tbl_customer.customerId, tbl_customer.customerName, tbl_subscriberguaranter.guaranterId, tbl_customer.mobileNo, tbl_customerdocument.subscriberDocId
FROM tbl_chit INNER JOIN ((tbl_customer LEFT OUTER JOIN tbl_customerdocument ON (tbl_customer.customerId = tbl_customerdocument.customerId) AND (tbl_customer.customerId = tbl_customerdocument.customerId)) LEFT OUTER JOIN tbl_subscriberguaranter ON tbl_customerdocument.subscriberDocId = tbl_subscriberguaranter.subscriberDocId) ON tbl_chit.chitId = tbl_customerdocument.chitId where tbl_chit.chitId=_chitId;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_DeleteInactiveSUbscriber
DROP PROCEDURE IF EXISTS `Sp_DeleteInactiveSUbscriber`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_DeleteInactiveSUbscriber`(in _subscriberId int, _chitId int)
BEGIN
delete  tbl_customerdocument from 
 
tbl_subscriberguaranter ,
tbl_subscribernominee , tbl_subscriber,tbl_customerdocument

where 
  tbl_customerdocument.chitId=_chitId 
and
 tbl_subscriberguaranter.subscriberDocId=tbl_customerdocument.subscriberDocId
and
tbl_subscriber.customerSubscriptionId=_subscriberId
and
 tbl_customerdocument.subscriberDocId=tbl_subscribernominee.subscriberDocId;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_DeleteInactive_Subscriber
DROP PROCEDURE IF EXISTS `Sp_DeleteInactive_Subscriber`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_DeleteInactive_Subscriber`(in _customerId int ,in _chitId int)
BEGIN
delete  from tbl_customerdocument
 using
tbl_subscriberguaranter ,
tbl_subscribernominee ,tbl_customerdocument

where 
  tbl_customerdocument.chitId=_chitId 
and
 tbl_subscriberguaranter.subscriberDocId=tbl_customerdocument.subscriberDocId
and
tbl_subscriber.customerId=_customerId
and
 tbl_customerdocument.subscriberDocId=tbl_subscribernominee.subscriberDocId;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.SP_DeleteRecords
DROP PROCEDURE IF EXISTS `SP_DeleteRecords`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DeleteRecords`(_chitId varchar(10),_customerId varchar(10))
BEGIN
delete from tbl_subscribernominee where subscriberDocId in(select subscriberDocId from tbl_customerdocument where find_in_set(chitId,_chitId) and find_in_set(customerId,_customerId));

delete from tbl_subscriberguaranter where subscriberDocId in(select subscriberDocId from tbl_customerdocument where find_in_set(chitId,_chitId) and find_in_set(customerId,_customerId));
delete from tbl_customerdocument where subscriberDocId in(select subscriberDocId from tbl_customerdocument where find_in_set(chitId,_chitId) and find_in_set(customerId,_customerId));
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_display
DROP PROCEDURE IF EXISTS `sp_display`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_display`(id int)
select * from tbl_customer where customerid =id//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.SP_DisplayCust
DROP PROCEDURE IF EXISTS `SP_DisplayCust`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DisplayCust`(in cname varchar(50),in cid int(11))
BEGIN

select * from tbl_customer where customerName = cname or customerId =cid;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_DisplayCustInfo
DROP PROCEDURE IF EXISTS `sp_DisplayCustInfo`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DisplayCustInfo`(id int)
SELECT tbl_customer.*, tbl_address.*, tbl_city.*, tbl_state.*
FROM ((tbl_address INNER JOIN tbl_customer ON tbl_address.addressId = tbl_customer.addressId) INNER JOIN tbl_city ON tbl_address.cityId = tbl_city.cityId) INNER JOIN tbl_state ON tbl_city.stateId = tbl_state.stateId
WHERE (((tbl_customer.customerid)=id))//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_Duesubscriber
DROP PROCEDURE IF EXISTS `Sp_Duesubscriber`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Duesubscriber`()
BEGIN

SELECT tbl_customer.customerName, tbl_customer.alternateNo,
 tbl_customer.emailId, tbl_customer.contactPerson, tbl_chit.chitName, tbl_chit.chitId, 
tbl_monthlypayment.Installment - tbl_monthlypayment.paidAmount as Due
FROM ((tbl_customer INNER JOIN tbl_customerdocument ON 
tbl_customer.customerId = tbl_customerdocument.customerId)Inner Join tbl_chit on tbl_customerdocument.chitId = tbl_chit.chitId) 
INNER JOIN tbl_monthlypayment ON tbl_customerdocument.subscriberDocId
 = tbl_monthlypayment.subscriberDocId where 
tbl_monthlypayment.Installment != tbl_monthlypayment.paidAmount ;

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_ForgetPassword
DROP PROCEDURE IF EXISTS `sp_ForgetPassword`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ForgetPassword`(In _PloginId VARCHAR(25),In _PsecurityQuestionId INT(11),In _PsecurityAnswer VARCHAR(100))
Begin
declare _Ppassword VARCHAR(25);
set _Ppassword= (select password from tbl_user where loginId=_PloginId and securityQuestionId=_PsecurityQuestionId and securityAnswer=_PsecurityAnswer);
if _Ppassword is not null then
select _Ppassword;
else
select 1;
end if;
End//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_GetAddProof
DROP PROCEDURE IF EXISTS `sp_GetAddProof`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetAddProof`(cid int)
SELECT tbl_customeraddressproof.*,  tbl_addressprooftype.*
FROM tbl_addressprooftype INNER JOIN tbl_customeraddressproof ON tbl_addressprooftype.addressProofId = tbl_customeraddressproof.addressProofId 
where tbl_customeraddressproof.customerId=cid//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_GetAddProofType
DROP PROCEDURE IF EXISTS `sp_GetAddProofType`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetAddProofType`()
SELECT * FROM dotnet_chitfunddb.tbl_addressprooftype//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_GetAddressProofIdName
DROP PROCEDURE IF EXISTS `sp_GetAddressProofIdName`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetAddressProofIdName`()
BEGIN
SELECT addressProofId,addressProofName FROM dotnet_chitfunddb.tbl_addressprooftype;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_getAgentName
DROP PROCEDURE IF EXISTS `sp_getAgentName`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAgentName`()
BEGIN
select tbl_user.userId,tbl_user.firstName from tbl_user,tbl_userType where tbl_user.userTypeId=tbl_userType.userTypeId and tbl_userType.typeName='Agent';
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_getAreaName
DROP PROCEDURE IF EXISTS `sp_getAreaName`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAreaName`()
BEGIN
select addressId,area from tbl_address;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_GetBalance
DROP PROCEDURE IF EXISTS `sp_GetBalance`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetBalance`(in _customerId int)
BEGIN
select  balanceAmount from tbl_subscriber where customerId = _customerId ;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.SP_GetBankName
DROP PROCEDURE IF EXISTS `SP_GetBankName`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetBankName`()
BEGIN
select bankId,bankName from tbl_bank; 
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.SP_GetBranchesForBank
DROP PROCEDURE IF EXISTS `SP_GetBranchesForBank`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetBranchesForBank`(in _bankId int)
BEGIN
select a.branchId, a.branchName from tbl_branch a join tbl_bank b on a.bankId=b.bankId where b.bankId=_bankId ;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_GetChitDetails
DROP PROCEDURE IF EXISTS `sp_GetChitDetails`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetChitDetails`(_status int)
BEGIN
select * from tbl_chit where status = _status;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_GetChitId
DROP PROCEDURE IF EXISTS `sp_GetChitId`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetChitId`()
BEGIN

select chitId from tbl_chit where chitId=(select Max(chitId) from tbl_chit) ;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_GetChitIdName
DROP PROCEDURE IF EXISTS `sp_GetChitIdName`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetChitIdName`()
BEGIN
select chitId, chitName from tbl_chit;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_getChitList
DROP PROCEDURE IF EXISTS `sp_getChitList`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getChitList`()
BEGIN
   select * from tbl_chit;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.SP_GetChitMembers
DROP PROCEDURE IF EXISTS `SP_GetChitMembers`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetChitMembers`(_chitId int)
BEGIN
select count(subscriberDocId) from tbl_customerdocument where chitId = _chitId;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_GetChitName_statuszero
DROP PROCEDURE IF EXISTS `sp_GetChitName_statuszero`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetChitName_statuszero`()
Begin
select chitId, chitName from tbl_chit where status=0;
end//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_GetCity
DROP PROCEDURE IF EXISTS `sp_GetCity`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetCity`(_sid varchar(10))
select * from tbl_city where stateId=_sid//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_GetCmbData
DROP PROCEDURE IF EXISTS `sp_GetCmbData`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetCmbData`()
SELECT tbl_city.*, tbl_state.*, tbl_idprooftype.*, tbl_addressprooftype.*
FROM tbl_city, tbl_state, tbl_idprooftype, tbl_addressprooftype//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_getCustomer
DROP PROCEDURE IF EXISTS `sp_getCustomer`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getCustomer`(_str varchar(30))
BEGIN

SELECT tbl_customer.customerId, tbl_customer.customerName
FROM tbl_customer where customerId not in (select customerId from tbl_subscriber) and tbl_customer.customerName like concat(_str,'%');
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_getCustomerId
DROP PROCEDURE IF EXISTS `sp_getCustomerId`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getCustomerId`(in _chitId int)
BEGIN
select cd.customerId, c.customerName from tbl_customerdocument cd join tbl_customer c on c.customerId=cd.customerId and chitId=_chitId;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_GetCustomerIdName
DROP PROCEDURE IF EXISTS `sp_GetCustomerIdName`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetCustomerIdName`(_chitId int,_str varchar(20))
BEGIN

SELECT tbl_customer.customerId, tbl_customer.customerName
FROM tbl_customer where customerId not in (select customerId from tbl_customerdocument where chitId = _chitId) and tbl_customer.customerName like concat(_str,'%');
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_getdocumentproof
DROP PROCEDURE IF EXISTS `sp_getdocumentproof`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getdocumentproof`()
BEGIN
select * from tbl_documentproof;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_GetDocumentType
DROP PROCEDURE IF EXISTS `sp_GetDocumentType`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetDocumentType`()
BEGIN


select documentProofId,documentName from tbl_documentproof;

 
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_GetFirstName
DROP PROCEDURE IF EXISTS `sp_GetFirstName`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetFirstName`(in _PloginId varchar(25))
begin
select firstName from tbl_user where loginId=_PloginId;
end//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_GetGuarantorIdName
DROP PROCEDURE IF EXISTS `sp_GetGuarantorIdName`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetGuarantorIdName`(_customerId int)
BEGIN
SELECT tbl_guaranter.guaranterId, tbl_guaranter.guaranterName
FROM tbl_guaranter INNER JOIN (tbl_customerdocument INNER JOIN tbl_subscriberguaranter ON tbl_customerdocument.subscriberDocId = tbl_subscriberguaranter.subscriberDocId) ON tbl_guaranter.guaranterId = tbl_subscriberguaranter.guaranterId where tbl_customerdocument.customerId=_customerId;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_GetIdProof
DROP PROCEDURE IF EXISTS `sp_GetIdProof`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetIdProof`(cid int)
SELECT tbl_idprooftype.*, tbl_customeridproof.*
FROM tbl_idprooftype INNER JOIN tbl_customeridproof ON tbl_idprooftype.idProofId = tbl_customeridproof.idProofId
where tbl_customeridproof.customerId=cid//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_getIdProofData
DROP PROCEDURE IF EXISTS `sp_getIdProofData`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getIdProofData`()
BEGIN
SELECT tbl_idprooftype.idProofId, tbl_idprooftype.idProofName
FROM tbl_idprooftype;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_GetIdProofType
DROP PROCEDURE IF EXISTS `sp_GetIdProofType`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetIdProofType`()
SELECT * FROM dotnet_chitfunddb.tbl_idprooftype//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_GetNewGuarantorIdName
DROP PROCEDURE IF EXISTS `sp_GetNewGuarantorIdName`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetNewGuarantorIdName`()
BEGIN
SELECT guaranterId,guaranterName FROM tbl_guaranter where guaranterId=(select max(guaranterId) from tbl_guaranter);
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_GetNomineeIdName
DROP PROCEDURE IF EXISTS `sp_GetNomineeIdName`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetNomineeIdName`(_customerId int)
BEGIN
SELECT tbl_nominee.nomineeId, tbl_nominee.nomineeName
FROM (tbl_customerdocument INNER JOIN tbl_subscribernominee ON tbl_customerdocument.subscriberDocId = tbl_subscribernominee.subscriberDocId) INNER JOIN tbl_nominee ON tbl_subscribernominee.nomineeId = tbl_nominee.nomineeId where tbl_customerdocument.customerId=_customerId;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.SP_GetOperatorName
DROP PROCEDURE IF EXISTS `SP_GetOperatorName`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetOperatorName`()
BEGIN


Select tbl_user.userId,tbl_user.firstName From tbl_user Where userTypeId=(Select userTypeId From tbl_usertype Where tbl_usertype.typeName='Operator');

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_GetOperators
DROP PROCEDURE IF EXISTS `Sp_GetOperators`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_GetOperators`()
BEGIN

select firstName ,middleName,lastName,doj,mobileNo,image from tbl_user
 where userTypeId = (select userTypeId from tbl_usertype where typeName='Operator');
 
 

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_getProfile
DROP PROCEDURE IF EXISTS `sp_getProfile`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getProfile`(
In _PfirstName VARCHAR(50),
In _PmiddleName VARCHAR(50),
In _PlastName VARCHAR(50),
In _PmobileNo VARCHAR(15),
In _PaddressId INT(11),
In _Pimage BLOB
)
BEGIN

Declare _PuserId int;
set _PuserId=(select Max(userId)+1 from tbl_user);

insert into tbl_user values(_PuserId,_PfirstName,_PmiddleName,_PlastName,_PmobileNo,_Pimage);
End//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_GetQuestions
DROP PROCEDURE IF EXISTS `sp_GetQuestions`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetQuestions`()
Begin
select questionId,question from tbl_questions;
End//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.SP_GetRole
DROP PROCEDURE IF EXISTS `SP_GetRole`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetRole`()
BEGIN
select userTypeId,typeName from tbl_usertype;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_getStateName
DROP PROCEDURE IF EXISTS `sp_getStateName`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getStateName`()
select * from tbl_state//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_getSubDocId
DROP PROCEDURE IF EXISTS `sp_getSubDocId`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getSubDocId`(in _customerid int, in _chitid int)
BEGIN
select subscriberDocId from tbl_customerdocument where customerId=_customerid and chitId=_chitid;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_GetSubscriber
DROP PROCEDURE IF EXISTS `sp_GetSubscriber`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetSubscriber`(cid int)
SELECT * FROM dotnet_chitfunddb.tbl_subscriber  where customerId=cid//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_GetSubscriberRecords
DROP PROCEDURE IF EXISTS `Sp_GetSubscriberRecords`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_GetSubscriberRecords`(in _chitId int )
BEGIN
select  cu.customerId ,cu.customerName 
 from  tbl_customer cu, tbl_chit c,
tbl_customerdocument cd ,tbl_subscriber su
where cu.customerId =cd.customerId and su.customerId=cu.customerId 
and
c.chitId =cd.chitId and 
c.status=0 
and c.chitId =_chitId ;

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_GetUserDetails
DROP PROCEDURE IF EXISTS `sp_GetUserDetails`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetUserDetails`(in _userId int)
Begin
#select firstName,middleName,lastName,mobileNo,addressId,image from tbl_user where loginId=_PloginId;
select u.image,u.firstName,u.middleName,u.lastName,u.mobileNo
,a.houseNo,a.area,a.street,a.zip,
c.city,s.state,u.securityQuestionId,u.securityAnswer
from tbl_user u 
left outer join tbl_address a on a.addressId = u.addressId 
left outer join tbl_city c on a.cityid=c.cityid
left outer join tbl_state s  on c.stateId=s.stateId
 where u.userId=_userId;
End//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_IdProofType
DROP PROCEDURE IF EXISTS `sp_IdProofType`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_IdProofType`()
SELECT * FROM tbl_idprooftype//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_InactiveChit
DROP PROCEDURE IF EXISTS `Sp_InactiveChit`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_InactiveChit`()
BEGIN
select  cht.chitName,cht.chitValue from tbl_chit cht where cht.status=0 ;
end//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_insertAddress
DROP PROCEDURE IF EXISTS `sp_insertAddress`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertAddress`(areaName varchar(30),house varchar(30),st varchar(30),cId int,zipCode int)
BEGIN
insert into tbl_address(area,houseNo,street,cityId,zip) values(areaName,house,st,cId,zipCode);
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_insertAuction
DROP PROCEDURE IF EXISTS `sp_insertAuction`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertAuction`(in _paidAmount double, in _divident double, in _auctionDate date,in _companyProfit double, in _auctionNo int, in _chitId int,in _customerId int)
BEGIN
Declare count int;
Declare _auctionId int;
Declare _subscriberDocId int;
 select count(*) into count from tbl_auction;
if count <1 then
select 1 into _auctionId;
else 
select max(auctionId)+1 into _auctionId from tbl_auction;
end if;
select subscriberDocId into _subscriberDocId from tbl_customerdocument where customerId=_customerId and chitId=_chitId;
 insert into tbl_auction values(_auctionId,_subscriberDocId,_paidAmount,_divident,_auctionDate,_companyProfit,_auctionNo,_chitId);
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_InsertChitProof
DROP PROCEDURE IF EXISTS `sp_InsertChitProof`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsertChitProof`(
in _chitName varchar(50),
in _noOfMonths int(11),
in _noOfCustomer int(11),
in _chitValue double,
in _chitGroupStartDate date,
in _chitGroupEndDate date,
in _chitGroupAuctionDay varchar(50),
in _previousSanctionNumber varchar(15),
in _previousSanctionDate date,
in _CCBNumber varchar(15),
in _CCBDate date,
in _summary varchar(50),
in _registrationNumber varchar(50),
in _status int,
in _userId int(11)
)
BEGIN

insert into tbl_chit(chitName,
_noOfMonths,
_noOfCustomer,
_chitValue ,
_chitGroupStartDate ,
_chitGroupEndDate ,
_chitGroupAuctionDay ,
_previousSanctionNumber ,
_previousSanctionDate ,
_CCBNumber ,
_CCBDate ,
_summary ,
_registrationNumber,
_status ,
_userId)values(

`_chitName`,
`_noOfMonths`,
_noOfCustomer,
_chitValue ,
`_chitGroupStartDate` ,
`_chitGroupEndDate` ,
`_chitGroupAuctionDay` ,
_previousSanctionNumber ,
`_previousSanctionDate` ,
_CCBNumber ,
`_CCBDate` ,
`_summary` ,
_registrationNumber,
_status ,
_userId);




END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.SP_insertCollectionByCash
DROP PROCEDURE IF EXISTS `SP_insertCollectionByCash`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertCollectionByCash`(_customerNo int, _receiptNumber varchar(20), _dateOfPayment date, _userID int, _amountCollected double, _dateOfEntry date)
BEGIN
INSERT INTO `dotnet_chitfunddb`.`tbl_collection`
(
`customerId`,
`receiptNumber`,
`dateOfPayment`,
`userId`,
`amountCollected`,
`balanceRemaining`,
`checkId`,
`dateOfEntry`)
VALUES
(
_customerNo , _receiptNumber , _dateOfPayment , _userID , _amountCollected , _amountCollected, null, _dateOfEntry
);
UPDATE `dotnet_chitfunddb`.`tbl_subscriber`
SET
`balanceAmount` = balanceAmount + _amountCollected
WHERE customerId = _customerNo;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.SP_insertCollectionByCheck
DROP PROCEDURE IF EXISTS `SP_insertCollectionByCheck`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertCollectionByCheck`(_customerNo int, _receiptNumber varchar(20), _dateOfPayment date, _amountCollected double, _dateOfEntry date, _userID int, _checkNumber varchar(50), _branchId int, _DOIssue date, validUpTo date)
BEGIN
INSERT INTO `dotnet_chitfunddb`.`tbl_cheque`
(
`checkNumber`,
`branchId`,
`DOIssue`,
`validUpTo`,
`checkStatus`)
VALUES
(_checkNumber , _branchId , _DOIssue , validUpTo, 1 );


INSERT INTO `dotnet_chitfunddb`.`tbl_collection`
(
`customerId`,
`receiptNumber`,
`dateOfPayment`,
`userId`,
`amountCollected`,
`balanceRemaining`,
`checkId`,
`dateOfEntry`)
VALUES
(
_customerNo , _receiptNumber , _dateOfPayment , _userID , _amountCollected , _amountCollected, (select max(checkId) from tbl_cheque), _dateOfEntry
);
UPDATE `dotnet_chitfunddb`.`tbl_subscriber`
SET
`balanceAmount` = balanceAmount + _amountCollected
WHERE customerId = _customerNo;

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_insertCustomer
DROP PROCEDURE IF EXISTS `sp_insertCustomer`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertCustomer`(areaName varchar(30),house varchar(30),st varchar(30),cId int,zipCode int,name varchar(30),dateOfBirth Date,dateOfJoin Date,mobNo varchar(15),alterNo varchar(30),spou Varchar(30),email varchar(30),contPerson varchar(30))
BEGIN
insert into tbl_address(area,houseNo,street,cityId,zip) values(areaName,house,st,cId,zipCode);

insert into tbl_customer(customerName,dob,doj,mobileNo,alternateNo,spouse,emailId,contactPerson,addressId) values(name,dateOfBirth,dateOfJoin,mobNo,alterNo,spou,email,contPerson,(select max(addressId) from tbl_address));

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_insertCustomerToChit
DROP PROCEDURE IF EXISTS `sp_insertCustomerToChit`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertCustomerToChit`(_customerId int,_chitId int,_applicationDoc blob,_bidOfferDoc blob,_authorizationDoc blob,_agreementDoc blob,_nomineeId int,_guarantorId int)
BEGIN
insert into tbl_customerdocument(customerId,chitId,applicationDoc,bidOfferDoc,authorizationDoc,agreementDoc) values(_customerId,_chitId,_applicationDoc,_bidOfferDoc,_authorizationDoc,_agreementDoc);
insert into tbl_subscriberguaranter(subscriberDocId,guaranterId) values((select max(subscriberDocId) from tbl_customerdocument),_guarantorId);
insert into tbl_subscribernominee(subscriberDocId,nomineeId) values((select max(subscriberDocId) from tbl_customerdocument),_nomineeId);
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_insertGuarantor
DROP PROCEDURE IF EXISTS `sp_insertGuarantor`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertGuarantor`(_guarantorName varchar(50),_dob date,_age int,_relation varchar(20),_contactNumber varchar(20),_idProofId int,_idProofDoc blob,_addressProofId int,_addressProofDoc blob,_occupation varchar(50),_company varchar(30),_annualIncome double)
BEGIN
insert into tbl_guaranter(guaranterName,DOB,age,relation,contactNumber,idProofId,idProofDoc,addressProofId,addressProofDoc,occupation,company,anualIncome) values(_guarantorName,_dob,_age,_relation,_contactNumber,_idProofId,_idProofDoc,_addressProofId,_addressProofDoc,_occupation,_company,_annualIncome);
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.SP_insertingChit
DROP PROCEDURE IF EXISTS `SP_insertingChit`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insertingChit`(
in _chitName varchar(50),
in _noOfMonths int(11),
in _noOfCustomer int(11),
in _chitValue double,
in _chitGroupStartDate date,
in _chitGroupEndDate date,
in _chitGroupAuctionDay varchar(50),
in _previousSanctionNumber varchar(50),
in _previousSanctionDate date,
in _CCBNumber varchar(50),
in _CCBDate date,
in _summary varchar(30),
in _registrationNumber varchar(50),
in _status bit,
in _userId int
)
BEGIN
INSERT INTO `tbl_chit`
(
`chitName`,
`noOfMonths`,
`noOfCustomer`,
`chitValue`,
`chitGroupStartDate`,
`chitGroupEndDate`,
`chitGroupAuctionDay`,
`previousSanctionNumber`,
`previousSanctionDate`,
`CCBNumber`,
`CCBDate`,
`summary`,
`registrationNumber`,
`status`,
`userId`)

VALUES
(

_chitName,
_noOfMonths,
_noOfCustomer,
_chitValue,
_chitGroupStartDate,
_chitGroupEndDate ,
_chitGroupAuctionDay,
_previousSanctionNumber,
_previousSanctionDate,
_CCBNumber,
_CCBDate,
_summary,
_registrationNumber,
_status,
_userId
);




END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_insertmonthlyPaymemt
DROP PROCEDURE IF EXISTS `sp_insertmonthlyPaymemt`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertmonthlyPaymemt`(in _subscriberDocId int,in _installment double,in _date date)
BEGIN
insert into tbl_monthlypayment(subscriberDocId,installment,date) values ( _subscriberDocId,_installment,_date);
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_insertNewCustomer
DROP PROCEDURE IF EXISTS `sp_insertNewCustomer`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertNewCustomer`(_areaName varchar(30),_house varchar(30),_st varchar(30),_cId int,_zipCode int,_name varchar(30),_dateOfBirth Date,_dateOfJoin Date,_mobNo varchar(15),_alterNo varchar(30),_spou Varchar(30),_email varchar(30),_contPerson varchar(30),_userId int,_idProofId int,_idProofDoc blob,_addressProofId int,_addressProofDoc blob,_image blob)
BEGIN
insert into tbl_address(area,houseNo,street,cityId,zip) values(_areaName,_house,_st,_cId,_zipCode);

insert into tbl_customer(customerName,dob,doj,mobileNo,alternateNo,spouse,emailId,contactPerson,addressId) values(_name,_dateOfBirth,_dateOfJoin,_mobNo,_alterNo,_spou,_email,_contPerson,(select max(addressId) from tbl_address));

insert into tbl_customeridproof(idProofId,customerId,idProofDoc) values(_idProofId,(select max(customerId) from tbl_customer),_idProofDoc);
insert into tbl_customeraddressproof(customerId,addressProofId,addressProofDoc) values((select max(customerId) from tbl_customer),_addressProofId,_addressProofDoc);
insert into tbl_subscriber(customerId,contactPerson,userId,image,balanceAmount) values((select max(customerId) from tbl_customer),_contPerson,_userId,_image,0);
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_InsertNominee
DROP PROCEDURE IF EXISTS `sp_InsertNominee`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsertNominee`(_name varchar(30),_relation varchar(30),_dob date,_age int,_contactNumber varchar(20))
BEGIN
insert into tbl_nominee(nomineeName,relation,DOB,age,contactNumber) values(_name,_relation,_dob,_age,_contactNumber);
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_insertregd
DROP PROCEDURE IF EXISTS `sp_insertregd`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertregd`(
IN _userID INT(11),_firstName VARCHAR(50),_middleName VARCHAR(50),
_lastName VARCHAR(50),_mobileNo VARCHAR(15),_loginId VARCHAR(25),
_password VARCHAR(25),_gender BINARY(1),_doj DATE,_dob DATE,
_userTypeId VARCHAR(11),_addressId INT(11),_securityQuestionId INT(11),
_securityAnswer VARCHAR(100),_image BLOB)
BEGIN
INSERT INTO tbl_user(userID,firstName,middleName,
lastName,mobileNo,loginId,password,gender,doj,dob,userTypeId,
addressId,securityQuestionId,securityAnswer,image) 

VALUES(_userID,_firstName,_middleName,_lastName,_mobileNo,_loginId,
_password,_gender,_doj,_dob,_userTypeId,
_addressId,_securityQuestionId,_securityAnswer,_image);

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_MonthlyAmountCollection
DROP PROCEDURE IF EXISTS `sp_MonthlyAmountCollection`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_MonthlyAmountCollection`(in month date)
BEGIN
select cht.chitId,  count(cosDoc.customerId) ,cht.chitName, cht.userId,usr.firstName 
as Agent_Name ,adr.area,count(col.amountCollected), col.dateOfPayment
from tbl_chit cht, tbl_user usr,
tbl_address adr, tbl_collection col,tbl_customerdocument cosDoc where cht.userId=usr.userId
and usr.addressId=adr.addressId and(cht.userId=col.userId 
and EXTRACT(month FROM col.dateOfPayment)=yr) and cht.chitId=cosDoc.chitId group by(chitId);


END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_monthlyInstallmentforchit
DROP PROCEDURE IF EXISTS `Sp_monthlyInstallmentforchit`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_monthlyInstallmentforchit`(_date date)
BEGIN
select ch.chitId,ch.chitName,doc.subscriberDocId,ch.chitGroupStartDate,sum(m.installment)as TotalInstallment,sum(m.paidamount) as `Collected Money`, Extract(month from _date) as `Month`,Extract(year from _date) as `Year` from tbl_chit ch
 join  tbl_customerdocument doc on ch.chitId=doc.chitId join tbl_monthlypayment m on
doc.subscriberDocId=m.subscriberDocId where m.date = _date group by ch.chitId;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_mychitinsert
DROP PROCEDURE IF EXISTS `sp_mychitinsert`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mychitinsert`(_chitName varchar(50),
in _noOfMonths int(11),
in _noOfCustomer int(11),
in _chitValue double,
in _chitGroupStartDate date,
in _chitGroupEndDate date,
in _chitGroupAuctionDay varchar(50),
in _previousSanctionNumber varchar(15),
in _previousSanctionDate date,
in _CCBNumber varchar(15),
in _CCBDate date,
in _summary varchar(50),
in _registrationNumber varchar(50),
in _status bit(1),
in _userId int(11),
in _documentProofId int(11),
in _document BLOB,
in _description varchar(500))
BEGIN
declare _chitId int;

insert into tbl_chit values(_chitId,
_chitName,
_noOfMonths,
_noOfCustomer,
_chitValue ,
_chitGroupStartDate ,
_chitGroupEndDate ,
_chitGroupAuctionDay ,
_previousSanctionNumber ,
_previousSanctionDate ,
_CCBNumber ,
_CCBDate ,
_summary ,
_registrationNumber,
_status ,_userId);





set _chitId=(select chitId from tbl_chitId);

insert into tbl_chitdocumentproof(documentProofId,chitId,document,description)values
(_chitId,_document,_documentProofId,_description);

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_NEW
DROP PROCEDURE IF EXISTS `sp_NEW`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_NEW`(in _chitName varchar(50),
in _noOfMonths int(11),
in _noOfCustomer int(11),
in _chitValue double,
in _chitGroupStartDate date,
in _chitGroupEndDate date,
in _chitGroupAuctionDay varchar(50),
in _previousSanctionNumber varchar(15),
in _previousSanctionDate date,
in _CCBNumber varchar(15),
in _CCBDate date,
in _summary varchar(50),
in _registrationNumber varchar(50),
in _status bit(1),
in _userId int(11),
in _documentProofId int(11),
in _chitId int(11),
in _document BLOB,
in _description varchar(500))
BEGIN

insert into tbl_chit values(_chitId,
_chitName,
_noOfMonths,
_noOfCustomer,
_chitValue ,
_chitGroupStartDate ,
_chitGroupEndDate ,
_chitGroupAuctionDay ,
_previousSanctionNumber ,
_previousSanctionDate ,
_CCBNumber ,
_CCBDate ,
_summary ,
_registrationNumber,
_status ,_userId);

insert into tbl_chitdocumentproof(documentProofId,chitId,document,description)values
(_chitId,_document,_documentProofId,_description);
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_no8OfChitsEndedThisMonthYear
DROP PROCEDURE IF EXISTS `sp_no8OfChitsEndedThisMonthYear`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_no8OfChitsEndedThisMonthYear`(in mnth Date)
BEGIN
select cht.chitName, cht.chitValue as chitAmount,
cht.noOfCustomer as no_OFSubscribar,
cht.chitGroupStartDate, cht.chitGroupEndDate
from tbl_chit cht where (
(EXTRACT(Year FROM cht.chitGroupEndDate)=EXTRACT(Year from mnth) and 
EXTRACT(Month FROM cht.chitGroupEndDate)=EXTRACT(Month from mnth)) 
);
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_numberofchitthisyear
DROP PROCEDURE IF EXISTS `Sp_numberofchitthisyear`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_numberofchitthisyear`(in dt date)
BEGIN
select e.chitName,e.chitValue,e.chitGroupStartDate,e.chitGroupEndDate,count(c.customerId)subscriber from tbl_chit e
left outer join tbl_user u on
e.userId=u.userId
left outer join tbl_subscriber sb on
u.userId=sb.userId
left outer join tbl_customer c on
sb.customerId=c.customerId
where e.chitGroupStartDate >=dt and e.chitGroupEndDate<=('2014-12-31')
group by e.chitName;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_OnMonthlyAmountCollection
DROP PROCEDURE IF EXISTS `sp_OnMonthlyAmountCollection`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_OnMonthlyAmountCollection`(in YEAR date)
BEGIN
select distinct cht.chitId,cht.chitName,usr.firstName 
as Agent_Name ,adr.area, col.dateOfPayment,(cht.chitValue/cht.noOfcustomer)asMonthlyamount
from tbl_chit cht, tbl_user usr,tbl_usertype utp,
tbl_address adr, tbl_collection col,tbl_customerdocument cosDoc where cht.userId=usr.userId
and usr.addressId=adr.addressId and cht.userId=col.userId 
and EXTRACT(Month FROM col.dateOfPayment)=EXTRACT(Month FROM YEAR) and cht.chitId=cosDoc.chitId 
and usr.userTypeId=utp.userTypeId and utp.typeName='Agent';

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_Particlaradmin
DROP PROCEDURE IF EXISTS `Sp_Particlaradmin`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Particlaradmin`(in id int)
BEGIN
SELECT  tbl_user.firstName, tbl_user.doj,tbl_user.mobileNo,tbl_chit.chitName, tbl_chit.noOfMonths, tbl_chit.noOfCustomer
FROM tbl_chit RIGHT OUTER JOIN tbl_user ON tbl_chit.userId = tbl_user.userId
where tbl_user.userId=id;

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_particularagent
DROP PROCEDURE IF EXISTS `Sp_particularagent`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_particularagent`(in id int)
BEGIN
SELECT  tbl_user.firstName, tbl_user.doj,tbl_user.mobileNo,tbl_chit.chitName, tbl_chit.noOfMonths, tbl_chit.noOfCustomer
FROM tbl_chit RIGHT OUTER JOIN tbl_user ON tbl_chit.userId = tbl_user.userId
where tbl_user.userId=id;

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_ParticularSubscriber
DROP PROCEDURE IF EXISTS `Sp_ParticularSubscriber`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ParticularSubscriber`(in name varchar(50),in id int )
BEGIN
select cu.customerId,cu.customerName,u.mobileNo,count(c.chitName)totalchits,
m.balanceRemaining,c.chitValue,m.amountCollected,m.balanceRemaining,a.area,a.houseNo,a.street,st.state,ci.city
 from  tbl_user u,tbl_customer cu,tbl_subscriber su, tbl_chit c, tbl_address a,tbl_collection m ,tbl_state st,tbl_city ci
where c.userId = u.userId and( c.userId =m.userId and u.addressId =a.addressId )
and a.cityId=ci.cityId and ci.stateId =st.stateId and cu.customerName=name and cu.customerId=id
and su.customerId=cu.customerId
group by c.userId;

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.SP_Pay
DROP PROCEDURE IF EXISTS `SP_Pay`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Pay`(in _customerId int, _chitId int)
BEGIN
select Date, DATE_FORMAT (date,'%M') as Months, DATE_FORMAT (date,'%Y') as Years, installment, Paidamount,   installment-Paidamount as dueamount from tbl_monthlypayment where subscriberDocId = (select subscriberDocId from tbl_customerdocument where customerId = _customerId and chitId = _chitId);

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.SP_PayForChit
DROP PROCEDURE IF EXISTS `SP_PayForChit`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PayForChit`(_customerId int, _chitId int, _due double, _date date)
BEGIN
UPDATE `tbl_monthlypayment`
SET
`paidAmount` = paidAmount + _due
WHERE subscriberDocId = (select subscriberDocId from tbl_customerDocument where customerId = _customerId and chitId = _chitId) and  `date` = _date;

UPDATE `tbl_subscriber`
SET
`balanceAmount` = balanceAmount - _due 
WHERE customerId = _customerId;

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_pcularsubscriber
DROP PROCEDURE IF EXISTS `Sp_pcularsubscriber`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_pcularsubscriber`(in _customerid int)
BEGIN
select u.mobileNo,count(c.chitName)totalchits,
m.balanceRemaining,c.chitValue,m.amountCollected,a.houseNo,a.street,st.state,ci.city,cut.customerName
 from  tbl_user u, tbl_chit c, tbl_address a,tbl_collection m ,tbl_state st,tbl_city ci,tbl_customer cut
where c.userId = u.userId and c.userId =m.userId and u.addressId =a.addressId 
and a.cityId=ci.cityId and ci.stateId =st.stateId and cut.customerId=_customerid and cut.addressId=a.addressId
group by c.userId;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_proc
DROP PROCEDURE IF EXISTS `Sp_proc`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_proc`(in name varchar(50),in id int)
BEGIN
select cut.customerName, cut.mobileNo,count(c.chitName)totalchits,m.balanceRemaining,
c.chitValue,m.amountCollected,m.balanceRemaining,a.area,a.houseNo,
a.street,st.state,ci.city,cut.customerName
 from  tbl_user u, tbl_chit c, tbl_address a,
tbl_collection m ,tbl_state st,tbl_city ci,tbl_customer cut
where c.userId = u.userId and c.userId =m.userId and cut.addressId =a.addressId 
and a.cityId=ci.cityId and ci.stateId =st.stateId and u.firstName=name and u.userId=id
group by c.userId;

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_Registration
DROP PROCEDURE IF EXISTS `sp_Registration`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Registration`(
In _PfirstName VARCHAR(50),
In _PmiddleName VARCHAR(50),
In _PlastName VARCHAR(50),
In _PmobileNo VARCHAR(15),
In _PloginId VARCHAR(25),
In _Ppassword VARCHAR(25),
In _Pgender BINARY(1),
In _Pdob DATE,
In _PuserTypeId INT(11),

In _PsecurityQuestionId INT(11),
In _PsecurityAnswer VARCHAR(100),
In _Pimage BLOB
)
Begin
Declare _Pdoj DATE;
Declare _PuserId int;
set _PuserId=(select Max(userId)+1 from tbl_user);
set _Pdoj=(select curdate());
insert into tbl_user values(_PuserId,_PfirstName,_PmiddleName,_PlastName,_PmobileNo,_PloginId ,_Ppassword ,_Pgender ,_Pdoj ,_Pdob ,_PuserTypeId ,(select Max(addressId) from tbl_address) ,_PsecurityQuestionId ,_PsecurityAnswer ,_Pimage);
End//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_removeCustomerfromChit
DROP PROCEDURE IF EXISTS `sp_removeCustomerfromChit`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_removeCustomerfromChit`(_customerId int,_chitId int)
BEGIN
declare `_id` int;

set `_id`= (select subscriberDocId from tbl_customerdocument where chitId=_chitId and customerId=_customerId);

delete from tbl_subscriberguaranter where subscriberDocId=`_id`;
delete from tbl_subscribernominee  where subscriberDocId=`_id`;
delete from tbl_customerdocument where subscriberDocId=`_id`;


END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.SP_RemoveMultipleCustomers
DROP PROCEDURE IF EXISTS `SP_RemoveMultipleCustomers`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_RemoveMultipleCustomers`(_subscriberDocId varchar(25))
BEGIN

delete from tbl_subscriberguaranter where find_in_set(subscriberDocId,_subscriberDocId);
delete from tbl_subscribernominee  where find_in_set(subscriberDocId,_subscriberDocId);
delete from tbl_customerdocument where find_in_set(subscriberDocId,_subscriberDocId);

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_RepInActiveChit
DROP PROCEDURE IF EXISTS `sp_RepInActiveChit`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_RepInActiveChit`()
BEGIN
select cht.chitId, count(custmr.customerName ) as total_Subscribar_ChitWise,cht.chitName,cht.chitValue as chitAmount,  usrtb.FirstName as AgentName
from tbl_chit cht, tbl_customer custmr,
 tbl_customerdocument tblcosdoc
,tbl_user usrtb where cht.status=0 and cht.userId=usrtb.userId
 and tblcosdoc.customerId=custmr.customerId group by (cht.chitId);
end//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_reportonActiveChit
DROP PROCEDURE IF EXISTS `sp_reportonActiveChit`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_reportonActiveChit`(in boolvale int)
BEGIN
select cht.chitId, count(custmr.customerName ) as total_Subscribar_ChitWise,cht.chitName,cht.chitValue as chitAmount, 
cht.chitGroupStartDate,-(((EXTRACT(Year FROM cht.chitGroupStartDate)-EXTRACT(Year FROM cht.chitGroupEndDate))*12)-
EXTRACT(Month FROM cht.chitGroupStartDate)-EXTRACT(Month FROM cht.chitGroupEndDate))
as Remaining_Month, usrtb.FirstName as AgentName
from tbl_chit cht, tbl_customer custmr,
 tbl_customerdocument tblcosdoc
,tbl_user usrtb where cht.status=boolvale=1 and cht.userId=usrtb.userId
 and tblcosdoc.customerId=custmr.customerId ;
end//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_reportOnChitAmount
DROP PROCEDURE IF EXISTS `sp_reportOnChitAmount`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_reportOnChitAmount`()
BEGIN

select cht.chitId,cht.chitName,cht.NoOfMonths, cht.chitValue, TIMESTAMPDIFF(MONTH,chitGroupStartDate, now()) as Remaining_month, cht.noOfCustomer from tbl_chit cht;

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_reportOndateWiseAmountCollection
DROP PROCEDURE IF EXISTS `sp_reportOndateWiseAmountCollection`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_reportOndateWiseAmountCollection`(in dtd date)
BEGIN

select cht.chitId,cht.chitName, cht.userId,usr.firstName as Agent_Name ,adr.area,col.amountCollected, col.dateOfPayment
from tbl_chit cht, tbl_user usr,tbl_address adr, tbl_collection col where cht.userId=usr.userId
and usr.addressId=adr.addressId and(cht.userId=col.userId and col.dateOfPayment=dtd);
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_ReportOnInactiveChit
DROP PROCEDURE IF EXISTS `sp_ReportOnInactiveChit`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ReportOnInactiveChit`()
BEGIN
select cht.chitId, cht.chitName,cht.chitValue,cht.chitGroupStartDate, cht.noOfCustomer, cht.noOfMonths from tbl_chit cht where cht.status=0 ;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_reportOnInactiveChitModf
DROP PROCEDURE IF EXISTS `sp_reportOnInactiveChitModf`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_reportOnInactiveChitModf`(in boolvale int)
BEGIN
select cht.chitId, count(custmr.customerName ) as total_Subscribar_ChitWise,cht.chitName,cht.chitValue as chitAmount, 
cht.chitGroupStartDate,-(((EXTRACT(Year FROM cht.chitGroupStartDate)-EXTRACT(Year FROM cht.chitGroupEndDate))*12)-
EXTRACT(Month FROM cht.chitGroupStartDate)-EXTRACT(Month FROM cht.chitGroupEndDate))
as Remaining_Month, usrtb.FirstName as AgentName
from tbl_chit cht, tbl_customer custmr,
 tbl_customerdocument tblcosdoc
,tbl_user usrtb where cht.status=boolvale=0 and cht.userId=usrtb.userId
 and tblcosdoc.customerId=custmr.customerId group by (cht.chitId);

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_reportOnMonthlyAmountColl
DROP PROCEDURE IF EXISTS `sp_reportOnMonthlyAmountColl`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_reportOnMonthlyAmountColl`()
BEGIN
select cht.chitId,  count(cosDoc.customerId) ,cht.chitName, cht.userId,usr.firstName 
as Agent_Name ,adr.area,count(col.amountCollected), col.dateOfPayment
from tbl_chit cht, tbl_user usr,
tbl_address adr, tbl_collection col,tbl_customerdocument cosDoc where cht.userId=usr.userId
and usr.addressId=adr.addressId and(cht.userId=col.userId 
and EXTRACT(YEAR FROM col.dateOfPayment)=yr) and cht.chitId=cosDoc.chitId group by(chitId);


END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_reportOnYearlyAmountCollection
DROP PROCEDURE IF EXISTS `sp_reportOnYearlyAmountCollection`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_reportOnYearlyAmountCollection`(in yr Year)
BEGIN
select cht.chitId,cht.chitName, cht.userId,usr.firstName 
as Agent_Name ,adr.area,col.amountCollected, col.dateOfPayment
from tbl_chit cht, tbl_user usr,
tbl_address adr, tbl_collection col where cht.userId=usr.userId
and usr.addressId=adr.addressId and(cht.userId=col.userId and EXTRACT(YEAR FROM col.dateOfPayment)=yr);
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_reportOnYearlyAmountCollection1
DROP PROCEDURE IF EXISTS `sp_reportOnYearlyAmountCollection1`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_reportOnYearlyAmountCollection1`(in yr Year)
BEGIN
select cht.chitId,cht.chitName, cht.userId,usr.firstName
as Agent_Name ,adr.area,
col.amountCollected, col.dateOfPayment,
count (cosDoc.customerId)
from tbl_chit cht, tbl_user usr,tbl_address adr,tbl_customerdocument cosDoc,
tbl_collection col where cht.userId=usr.userId
and (usr.addressId=adr.addressId) and(cht.userId=col.userId 
and EXTRACT(YEAR FROM col.dateOfPayment)=yr) 
 and (cht.chitId=cosDoc.chitId) group by(cht.chitId) ;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_reportOnYearlyAmountCollectionChitWise
DROP PROCEDURE IF EXISTS `sp_reportOnYearlyAmountCollectionChitWise`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_reportOnYearlyAmountCollectionChitWise`(in yr Year)
BEGIN
select cht.chitId,  count(cosDoc.customerId) ,cht.chitName, cht.userId,usr.firstName 
as Agent_Name ,adr.area,col.amountCollected, col.dateOfPayment
from tbl_chit cht, tbl_user usr,
tbl_address adr, tbl_collection col,tbl_customerdocument cosDoc where cht.userId=usr.userId
and usr.addressId=adr.addressId and(cht.userId=col.userId 
and EXTRACT(YEAR FROM col.dateOfPayment)=yr) and cht.chitId=cosDoc.chitId group by(chitId);
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_rpActiveChit
DROP PROCEDURE IF EXISTS `sp_rpActiveChit`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_rpActiveChit`()
BEGIN
select cht.chitId, count(custmr.customerName ) as total_Subscribar_ChitWise,cht.chitName,cht.chitValue as chitAmount, 
cht.chitGroupStartDate,-(((EXTRACT(Year FROM cht.chitGroupStartDate)-EXTRACT(Year FROM cht.chitGroupEndDate))*12)-
EXTRACT(Month FROM cht.chitGroupStartDate)-EXTRACT(Month FROM cht.chitGroupEndDate))
as Remaining_Month, usrtb.FirstName as AgentName
from tbl_chit cht, tbl_customer custmr,
 tbl_customerdocument tblcosdoc
,tbl_user usrtb where cht.status=1 and cht.userId=usrtb.userId
 and tblcosdoc.customerId=custmr.customerId group by (cht.chitId);
end//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.SP_SaveChitDocuments
DROP PROCEDURE IF EXISTS `SP_SaveChitDocuments`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SaveChitDocuments`(_documentProofId int,_document longblob, _description varchar(150))
BEGIN
INSERT INTO `tbl_chitdocumentproof`(documentProofId, chitId, document, description)
VALUES
(
_documentProofId,(select max(chitId) from tbl_chit),_document, _description);

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_selectCity
DROP PROCEDURE IF EXISTS `sp_selectCity`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_selectCity`(_stateId int)
BEGIN
select cityId,city from tbl_city where stateId=_stateId; 
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_selectGetAddressProofType
DROP PROCEDURE IF EXISTS `sp_selectGetAddressProofType`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_selectGetAddressProofType`()
BEGIN
select * from tbl_addressprooftype;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_selectState
DROP PROCEDURE IF EXISTS `sp_selectState`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_selectState`()
BEGIN
select stateId,state from tbl_state;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_ShowAgentDetails
DROP PROCEDURE IF EXISTS `Sp_ShowAgentDetails`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ShowAgentDetails`(in agentid int)
BEGIN
select u.firstName,u.lastName,c.chitName,u.doj,u.mobileNo
 from tbl_user u ,tbl_chit c
where u.userId =agentid and c.userId =agentId;

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_ShowOperatorDetails
DROP PROCEDURE IF EXISTS `Sp_ShowOperatorDetails`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ShowOperatorDetails`(in uid int)
BEGIN
select u.firstName ,u.lastName,u.doj,u.gender,u.mobileNo,u.image from tbl_user u,tbl_usertype ut
where  ut.typeName='operator' and u.userId=uid;

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_ShowOperatorDtl
DROP PROCEDURE IF EXISTS `Sp_ShowOperatorDtl`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ShowOperatorDtl`(in uid int)
BEGIN
select u.firstName ,u.lastName,u.doj,u.gender,u.mobileNo,u.image from tbl_user u
left outer join tbl_usertype ut on
u.userTypeId=ut.userTypeId
where  ut.typeName='operator' and u.userId=uid;

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_ShowTotaiAgentDetails
DROP PROCEDURE IF EXISTS `Sp_ShowTotaiAgentDetails`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ShowTotaiAgentDetails`()
BEGIN
select u.firstName,u.lastName,c.chitName,u.doj,u.mobileNo
 from tbl_user u ,tbl_chit c
where c.userId =u.userId and c.userId in (select userId from tbl_user 
                    where userTypeId= (select userTypeId from tbl_usertype
where typeName='Agent') ); 


END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_SubDetails
DROP PROCEDURE IF EXISTS `Sp_SubDetails`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_SubDetails`(in id int)
BEGIN
select cut.customerName, cut.mobileNo,c.chitValue,c.chitName,m.amountCollected,m.balanceRemaining,a.area,a.houseNo,
a.street,st.state,ci.city
 from  tbl_user u, tbl_chit c, tbl_address a,
tbl_collection m ,tbl_state st,tbl_city ci,tbl_customer cut,tbl_usertype ut,tbl_subscriber sb
where c.userId = u.userId and c.userId =m.userId and cut.addressId =a.addressId 
and a.cityId=ci.cityId and ci.stateId =st.stateId and  u.userId=id
and sb.userId=id and sb.customerId=cut.customerId
and ut.userTypeId=u.userTypeId and ut.typeName='Agent'
group by u.userId;

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_SubscribeNewCustomer
DROP PROCEDURE IF EXISTS `sp_SubscribeNewCustomer`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_SubscribeNewCustomer`()
BEGIN

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_subscriberAgentWise
DROP PROCEDURE IF EXISTS `sp_subscriberAgentWise`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_subscriberAgentWise`(AgentId int)
BEGIN
SELECT tbl_customer.customerId, tbl_customer.customerName, tbl_customer.dob, tbl_customer.doj, tbl_customer.mobileNo, tbl_customer.emailId
FROM (((tbl_subscriber INNER JOIN tbl_customer ON tbl_subscriber.customerId = tbl_customer.customerId) INNER JOIN tbl_user ON tbl_subscriber.userId = tbl_user.userId) INNER JOIN tbl_usertype ON tbl_user.userTypeId = tbl_usertype.userTypeId) INNER JOIN tbl_address ON tbl_customer.addressId = tbl_address.addressId
WHERE (((tbl_user.userId)=AgentId));
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_subscriberAreaWise
DROP PROCEDURE IF EXISTS `sp_subscriberAreaWise`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_subscriberAreaWise`(AddressId int)
BEGIN
SELECT tbl_customer.customerId, tbl_customer.customerName, tbl_customer.dob, tbl_customer.doj, tbl_customer.mobileNo, tbl_customer.emailId
FROM (tbl_address INNER JOIN tbl_customer ON tbl_address.addressId=tbl_customer.addressId) INNER JOIN tbl_subscriber ON tbl_customer.customerId=tbl_subscriber.customerId
WHERE tbl_address.addressId=AddressId;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_subscriberChitWise
DROP PROCEDURE IF EXISTS `sp_subscriberChitWise`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_subscriberChitWise`(ChitId int)
BEGIN
SELECT tbl_customer.customerId, tbl_customer.customerName, tbl_customer.dob, tbl_customer.doj, tbl_customer.mobileNo, tbl_customer.emailId
FROM ((tbl_chit INNER JOIN tbl_customerdocument ON tbl_chit.chitId=tbl_customerdocument.chitId) INNER JOIN tbl_customer ON tbl_customerdocument.customerId=tbl_customer.customerId) INNER JOIN tbl_subscriber ON tbl_customer.customerId=tbl_subscriber.customerId
WHERE tbl_chit.chitId=ChitId;

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_subscriberDetails
DROP PROCEDURE IF EXISTS `sp_subscriberDetails`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_subscriberDetails`(in subscriberId int)
BEGIN
select * from tbl_subscriber where customerId=subscriberId;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_subscriberDocId
DROP PROCEDURE IF EXISTS `sp_subscriberDocId`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_subscriberDocId`( in _chitId int)
BEGIN
select subscriberDocId from tbl_customerdocument where chitId=_chitId;

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_subscriberInfo
DROP PROCEDURE IF EXISTS `Sp_subscriberInfo`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_subscriberInfo`()
BEGIN
SELECT s.customerSubscriptionId,u.firstName,u.lastName 
from tbl_subscriber s,tbl_user u
where s.userId =u.userId;

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_subsuriberagent
DROP PROCEDURE IF EXISTS `sp_subsuriberagent`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_subsuriberagent`(in name varchar(15))
BEGIN
select ch.chitId,
       ch.chitName,
       count(ch.chitName)totalchit,
       cu.customerName,
	   cu.mobileno,
       Ad.area,
       Ad.houseNo,
       Ad.street,
       Ad.zip,
       ci.city,
       s.state,
       m.paidamount
from tbl_state s
inner join tbl_city ci on
s.stateId=ci.stateId
inner join tbl_address ad on
ad.cityId=ci.cityId
inner join tbl_customer cu on
cu.AddressId=ad.AddressId 
inner join tbl_subscriber sb on
cu.customerId=sb.customerId
inner join tbl_user u on 
sb.userId=u.userId
inner join tbl_chit ch on
u.userId=ch.userId
 join tbl_customerdocument d on
ch.chitId=d.chitId
 join tbl_monthlypayment m on 
d.subscriberDocId=m.subscriberDocId
where u.firstName='name'
group by u.userId;

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.Sp_update
DROP PROCEDURE IF EXISTS `Sp_update`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_update`()
BEGIN
 update  sp_GetUserDetails set 
image=null,
firstName='mahindar',
middleName='mahi',
lastName='Boregam5',
mobileNo='8855224411',
houseNo='606',
area='cp',
street='str',
zip='500',
city='hyd',
state='t'
where firstName='mahindar';

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_updateCustomer
DROP PROCEDURE IF EXISTS `sp_updateCustomer`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateCustomer`(_customerid int,_name varchar(30),_dob date,_mobno varchar(20),_amono varchar(30),_sp varchar(20),_eid varchar(50),_cp varchar(30),_aid int,_area varchar(30),_street varchar(50),_zip int,_cityid int,_img blob,_iptid int,_idimg blob,_addptid int,_addimg blob)
BEGIN
update tbl_customer set customerName=_name,dob=_dob,mobileNo=_mobno,alternateNo=_amono,spouse=_sp,emailId=_eid,contactPerson=_cp,addressId=_aid where customerId=_customerid; 
update tbl_address set area=_area,street=_street,cityId=_cityid,zip=_zip where addressId=_aid;
update tbl_subscriber set image=_img where customerId=_customerid;
update tbl_customeridproof set idProofId=_iptid,idProofDoc=_idimg where customerId=_customerid;
update tbl_customeraddressproof set addressProofId=_addptid,addressProofDoc=_addimg where customerId=_customerid;
END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_updateNewCustomer
DROP PROCEDURE IF EXISTS `sp_updateNewCustomer`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateNewCustomer`(_customerid int,_name varchar(30),_dob date,_mobno varchar(20),_amono varchar(30),_sp varchar(20),_eid varchar(50),_cp varchar(30),_aid int,_area varchar(30),_houseNo varchar(30),_street varchar(50),_zip int,_cityid int,_userId int,_idProofId int,_idProofDoc blob,_addressProofId int,_addressProofDoc blob,_image blob)
BEGIN
update tbl_customer set customerName=_name,dob=_dob,mobileNo=_mobno,alternateNo=_amono,spouse=_sp,emailId=_eid,contactPerson=_cp,addressId=_aid where customerId=_customerid; 
update tbl_address set area=_area,houseNo=_houseNo,street=_street,cityId=_cityid,zip=_zip where addressId=_aid;

insert into tbl_customeridproof(idProofId,customerId,idProofDoc) values(_idProofId,_customerid,_idProofDoc);
insert into tbl_customeraddressproof(customerId,addressProofId,addressProofDoc) values(_customerid,_addressProofId,_addressProofDoc);
insert into tbl_subscriber(customerId,contactPerson,userId,image,balanceAmount) values(_customerid,_cp,_userId,_image,0);

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.sp_UpdateUserDetails
DROP PROCEDURE IF EXISTS `sp_UpdateUserDetails`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UpdateUserDetails`(
in _userId int,
in _Pimage LONGBLOB,
in _PfirstName VARCHAR(50),
in _PmiddleName VARCHAR(50),
in _PlastName VARCHAR(50),
in _PmobileNo VARCHAR(15),
in _PhouseNo VARCHAR(50),
in _Parea VARCHAR(50),
in _Pstreet VARCHAR(50),
in _Pzip int(6),
in _Pcity VARCHAR(50),
in _Pstate VARCHAR(50)
#in _PsecurityQuestionId INT(11),
#in _PsecurityAnswer VARCHAR(50)
)
begin
#update tbl_user set firstName=_PfirstName,middleName=_PmiddleName,lastName=_PlastName,mobileNo=_PmobileNo,addressId=_PaddressId,image=_Pimage where loginId=_PloginId;
update  tbl_user u
left outer join tbl_address a on a.addressId = u.addressId 
left outer join tbl_city c on a.cityid=c.cityid
left outer join tbl_state s  on c.stateId=s.stateId 
set
u.image=_Pimage,
u.firstName=_PfirstName,
u.middleName=_PmiddleName,
u.lastName=_PlastName,
u.mobileNo=_PmobileNo,
a.houseNo=_PhouseNo,
a.area=_Parea,
a.street=_Pstreet,
a.zip=_Pzip,
c.city=_Pcity,
s.state=_Pstate
#u.securityQuestionId=_PsecurityQuestionId,
#u.securityAnswer=_PsecurityAnswer
where u.userId=_userId;

end//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.SP_UploadDocuments
DROP PROCEDURE IF EXISTS `SP_UploadDocuments`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UploadDocuments`(
in _documentProofId int(11),
in _chitId int(11),
in _document longblob,
in _description varchar(50)
)
begin
INSERT INTO `dotnet_chitfunddb`.`tbl_chitdocumentproof`(`documentProofId`,`chitId`,`document`,`description`)
VALUES
(
_documentProofId,
(select max(chitId) from tbl_chit) ,

_document,
_description
);

END//
DELIMITER ;


-- Dumping structure for procedure dotnet_chitfunddb.s_register
DROP PROCEDURE IF EXISTS `s_register`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `s_register`(In _PfirstName VARCHAR(50),
In _PmiddleName VARCHAR(50),
In _PlastName VARCHAR(50),
In _PmobileNo VARCHAR(15),
In _PloginId VARCHAR(25),
In _Ppassword VARCHAR(25),
In _Pgender BINARY(1),
In _Pdob DATE,
In _PuserTypeId INT(11),
In _PsecurityQuestionId INT(11),
In _PsecurityAnswer VARCHAR(100),
In _Pimage BLOB,
In _area varchar(50),
In _houseNo varchar(50),
In _street varchar(50),
In _cityId int,
In _zip int
)
Begin
Declare _Pdoj DATE;
set _Pdoj=(select curdate());
INSERT INTO `tbl_address`
(`area`,
`houseNo`,
`street`,
`cityId`,
`zip`)
VALUES
(
_area,
_houseNo,
_street,
_cityId,
_zip);

insert into tbl_address values(_area,_houseNo,_street,_cityId,_zip);
INSERT INTO `tbl_user`
(
`firstName`,
`middleName`,
`lastName`,
`mobileNo`,
`loginId`,
`password`,
`gender`,
`doj`,
`dob`,
`userTypeId`,
`addressId`,
`securityQuestionId`,
`securityAnswer`,
`image`)
VALUES
(_PfirstName,
_PmiddleName,
_PlastName,
_PmobileNo,
_PloginId,
_Ppassword,
_Pgender,
_Pdoj,
_Pdob,
_PuserTypeId,
(select Max(addressId) from tbl_address),
_PsecurityQuestionId,
_PsecurityAnswer,
_Pimage
);
End//
DELIMITER ;


-- Dumping structure for table dotnet_chitfunddb.tbl_address
DROP TABLE IF EXISTS `tbl_address`;
CREATE TABLE IF NOT EXISTS `tbl_address` (
  `addressId` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(50) NOT NULL,
  `houseNo` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `cityId` int(11) NOT NULL,
  `zip` int(6) NOT NULL,
  PRIMARY KEY (`addressId`),
  KEY `fk_CityId_idx` (`cityId`),
  CONSTRAINT `fk_CityId` FOREIGN KEY (`cityId`) REFERENCES `tbl_city` (`cityId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_addressprooftype
DROP TABLE IF EXISTS `tbl_addressprooftype`;
CREATE TABLE IF NOT EXISTS `tbl_addressprooftype` (
  `addressProofId` int(11) NOT NULL,
  `addressProofName` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`addressProofId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_auction
DROP TABLE IF EXISTS `tbl_auction`;
CREATE TABLE IF NOT EXISTS `tbl_auction` (
  `auctionId` int(11) NOT NULL AUTO_INCREMENT,
  `subscriberDocId` int(11) NOT NULL,
  `paidAmount` double NOT NULL,
  `divident` double NOT NULL DEFAULT '0',
  `auctionDate` date NOT NULL,
  `companyProfit` double NOT NULL DEFAULT '0',
  `auctionNo` int(11) DEFAULT '0',
  `chitId` int(11) DEFAULT NULL,
  PRIMARY KEY (`auctionId`),
  KEY `fk_subDocId_auction_idx` (`subscriberDocId`),
  KEY `fk_chitId_aution_idx` (`chitId`),
  CONSTRAINT `fk_chitId_aution` FOREIGN KEY (`chitId`) REFERENCES `tbl_chit` (`chitId`),
  CONSTRAINT `fk_subDocId_auction` FOREIGN KEY (`subscriberDocId`) REFERENCES `tbl_customerdocument` (`subscriberDocId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_bank
DROP TABLE IF EXISTS `tbl_bank`;
CREATE TABLE IF NOT EXISTS `tbl_bank` (
  `bankId` int(11) NOT NULL,
  `bankName` varchar(50) NOT NULL,
  PRIMARY KEY (`bankId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_branch
DROP TABLE IF EXISTS `tbl_branch`;
CREATE TABLE IF NOT EXISTS `tbl_branch` (
  `branchId` int(11) NOT NULL AUTO_INCREMENT,
  `branchName` varchar(30) NOT NULL,
  `bankId` int(11) NOT NULL,
  PRIMARY KEY (`branchId`),
  KEY `fk_bankId_auction_idx` (`bankId`),
  CONSTRAINT `fk_bankId_auction` FOREIGN KEY (`bankId`) REFERENCES `tbl_bank` (`bankId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_cheque
DROP TABLE IF EXISTS `tbl_cheque`;
CREATE TABLE IF NOT EXISTS `tbl_cheque` (
  `checkId` int(11) NOT NULL AUTO_INCREMENT,
  `checkNumber` varchar(20) NOT NULL,
  `branchId` int(11) NOT NULL,
  `DOIssue` date NOT NULL,
  `validUpTo` date NOT NULL,
  `checkStatus` varchar(20) NOT NULL,
  PRIMARY KEY (`checkId`),
  KEY `fk_branchId_tbl_Cheque_idx` (`branchId`),
  CONSTRAINT `fk_branchId_tbl_Cheque` FOREIGN KEY (`branchId`) REFERENCES `tbl_branch` (`branchId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_chit
DROP TABLE IF EXISTS `tbl_chit`;
CREATE TABLE IF NOT EXISTS `tbl_chit` (
  `chitId` int(11) NOT NULL AUTO_INCREMENT,
  `chitName` varchar(50) NOT NULL,
  `noOfMonths` int(11) NOT NULL,
  `noOfCustomer` int(11) NOT NULL,
  `chitValue` double NOT NULL,
  `chitGroupStartDate` date DEFAULT NULL,
  `chitGroupEndDate` date DEFAULT NULL,
  `chitGroupAuctionDay` varchar(50) DEFAULT NULL,
  `previousSanctionNumber` varchar(15) NOT NULL,
  `previousSanctionDate` date NOT NULL,
  `CCBNumber` varchar(15) NOT NULL,
  `CCBDate` date NOT NULL,
  `summary` varchar(50) NOT NULL,
  `registrationNumber` varchar(50) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`chitId`),
  UNIQUE KEY `chitName_UNIQUE` (`chitName`),
  KEY `fk_userId_chit_idx` (`userId`),
  CONSTRAINT `fk_userId_chit` FOREIGN KEY (`userId`) REFERENCES `tbl_user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_chitdocumentproof
DROP TABLE IF EXISTS `tbl_chitdocumentproof`;
CREATE TABLE IF NOT EXISTS `tbl_chitdocumentproof` (
  `documentProofId` int(11) NOT NULL,
  `chitId` int(11) NOT NULL,
  `document` longblob,
  `description` varchar(500) DEFAULT NULL,
  KEY `fk_documentProofId_tbl_chitdocumentproof_idx` (`documentProofId`),
  KEY `fk_chitId_chitdocumentproof_idx` (`chitId`),
  CONSTRAINT `fk_chitId_chitdocumentproof` FOREIGN KEY (`chitId`) REFERENCES `tbl_chit` (`chitId`),
  CONSTRAINT `fk_documentProofId_tbl_chitdocumentproof` FOREIGN KEY (`documentProofId`) REFERENCES `tbl_documentproof` (`documentProofId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_city
DROP TABLE IF EXISTS `tbl_city`;
CREATE TABLE IF NOT EXISTS `tbl_city` (
  `cityId` int(11) NOT NULL AUTO_INCREMENT,
  `stateId` int(11) NOT NULL,
  `city` varchar(50) NOT NULL,
  PRIMARY KEY (`cityId`),
  KEY `fk_stateId_city_idx` (`stateId`),
  CONSTRAINT `fk_stateId_city` FOREIGN KEY (`stateId`) REFERENCES `tbl_state` (`stateId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_collection
DROP TABLE IF EXISTS `tbl_collection`;
CREATE TABLE IF NOT EXISTS `tbl_collection` (
  `collectionId` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) DEFAULT NULL,
  `receiptNumber` varchar(20) NOT NULL,
  `dateOfPayment` date NOT NULL,
  `userId` int(11) NOT NULL,
  `amountCollected` double NOT NULL,
  `balanceRemaining` double NOT NULL,
  `checkId` int(11) DEFAULT NULL,
  `dateOfEntry` date NOT NULL,
  PRIMARY KEY (`collectionId`),
  KEY `fk_userId_idx` (`userId`),
  KEY `fk_checkID_idx` (`checkId`),
  KEY `fk_customerId_Collection_customer_idx` (`customerId`),
  KEY `fk_checkId_Collection_Check_idx` (`checkId`),
  CONSTRAINT `fk_checkId_Collection_Check` FOREIGN KEY (`checkId`) REFERENCES `tbl_cheque` (`checkId`),
  CONSTRAINT `fk_customerId_Collection_customer` FOREIGN KEY (`customerId`) REFERENCES `tbl_customer` (`customerId`),
  CONSTRAINT `fk_userId` FOREIGN KEY (`userId`) REFERENCES `tbl_user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_customer
DROP TABLE IF EXISTS `tbl_customer`;
CREATE TABLE IF NOT EXISTS `tbl_customer` (
  `customerId` int(11) NOT NULL AUTO_INCREMENT,
  `customerName` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `doj` date NOT NULL,
  `mobileNo` varchar(15) NOT NULL,
  `alternateNo` varchar(15) NOT NULL,
  `spouse` varchar(50) NOT NULL,
  `emailId` varchar(30) NOT NULL,
  `contactPerson` varchar(50) NOT NULL,
  `addressId` int(11) NOT NULL,
  PRIMARY KEY (`customerId`),
  KEY `fk_addressId_customer_idx` (`addressId`),
  CONSTRAINT `fk_addressId_customer` FOREIGN KEY (`addressId`) REFERENCES `tbl_address` (`addressId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_customeraddressproof
DROP TABLE IF EXISTS `tbl_customeraddressproof`;
CREATE TABLE IF NOT EXISTS `tbl_customeraddressproof` (
  `customerId` int(11) NOT NULL,
  `addressProofId` int(11) NOT NULL,
  `addressProofDoc` blob NOT NULL,
  KEY `fk_customerId_customeraddressproof_idx` (`customerId`),
  KEY `fk_addressProofId_customeraddressproof_idx` (`addressProofId`),
  KEY `FK_addressProofTypeId__idx` (`addressProofId`),
  CONSTRAINT `FK_addressProofTypeId_tbl_customeraddressproof_tbl_addressProof` FOREIGN KEY (`addressProofId`) REFERENCES `tbl_addressprooftype` (`addressProofId`),
  CONSTRAINT `fk_customerId_customeraddressproof` FOREIGN KEY (`customerId`) REFERENCES `tbl_customer` (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_customerdocument
DROP TABLE IF EXISTS `tbl_customerdocument`;
CREATE TABLE IF NOT EXISTS `tbl_customerdocument` (
  `subscriberDocId` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL,
  `chitId` int(11) NOT NULL,
  `applicationDoc` blob,
  `bidOfferDoc` blob,
  `authorizationDoc` blob,
  `agreementDoc` blob,
  PRIMARY KEY (`subscriberDocId`),
  KEY `fk_customerId_customerdocument_idx` (`customerId`),
  KEY `fk_chitId_customerdocument_idx` (`chitId`),
  CONSTRAINT `fk_chitId_customerdocument` FOREIGN KEY (`chitId`) REFERENCES `tbl_chit` (`chitId`),
  CONSTRAINT `fk_customerId_customerdocument` FOREIGN KEY (`customerId`) REFERENCES `tbl_customer` (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_customeridproof
DROP TABLE IF EXISTS `tbl_customeridproof`;
CREATE TABLE IF NOT EXISTS `tbl_customeridproof` (
  `idProofId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `idProofDoc` blob NOT NULL,
  KEY `fk_customerId_customeridproof_idx` (`customerId`),
  KEY `fk_idProofId_customeridproof_idx` (`idProofId`),
  CONSTRAINT `fk_customerId_customeridproof` FOREIGN KEY (`customerId`) REFERENCES `tbl_customer` (`customerId`),
  CONSTRAINT `fk_idProofId_customeridproof` FOREIGN KEY (`idProofId`) REFERENCES `tbl_idprooftype` (`idProofId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_documentproof
DROP TABLE IF EXISTS `tbl_documentproof`;
CREATE TABLE IF NOT EXISTS `tbl_documentproof` (
  `documentProofId` int(11) NOT NULL,
  `documentName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`documentProofId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_guaranter
DROP TABLE IF EXISTS `tbl_guaranter`;
CREATE TABLE IF NOT EXISTS `tbl_guaranter` (
  `guaranterId` int(11) NOT NULL AUTO_INCREMENT,
  `guaranterName` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `relation` varchar(20) DEFAULT NULL,
  `contactNumber` varchar(20) DEFAULT NULL,
  `idProofId` int(11) DEFAULT NULL,
  `idProofDoc` blob,
  `addressProofId` int(11) DEFAULT NULL,
  `addressProofDoc` blob,
  `occupation` varchar(50) DEFAULT NULL,
  `company` varchar(30) DEFAULT NULL,
  `anualIncome` double DEFAULT NULL,
  PRIMARY KEY (`guaranterId`),
  KEY `FK_idProofId__idx` (`idProofId`),
  KEY `FK_addressProofId_tbl_guaranter_tbl_addressProofType_idx` (`addressProofId`),
  CONSTRAINT `FK_addressProofId_tbl_guaranter_tbl_addressProofType` FOREIGN KEY (`addressProofId`) REFERENCES `tbl_addressprooftype` (`addressProofId`),
  CONSTRAINT `FK_idProofId_tbl_guaranter_tbl_idprooftype` FOREIGN KEY (`idProofId`) REFERENCES `tbl_idprooftype` (`idProofId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_idprooftype
DROP TABLE IF EXISTS `tbl_idprooftype`;
CREATE TABLE IF NOT EXISTS `tbl_idprooftype` (
  `idProofId` int(11) NOT NULL,
  `idProofName` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idProofId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_monthlypayment
DROP TABLE IF EXISTS `tbl_monthlypayment`;
CREATE TABLE IF NOT EXISTS `tbl_monthlypayment` (
  `chitpaymentId` int(11) NOT NULL AUTO_INCREMENT,
  `subscriberDocId` int(11) NOT NULL,
  `installment` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `paidAmount` double DEFAULT '0',
  PRIMARY KEY (`chitpaymentId`),
  KEY `fk_subscriberDocId_s_idx` (`subscriberDocId`),
  CONSTRAINT `fk_subscriberDocId_s` FOREIGN KEY (`subscriberDocId`) REFERENCES `tbl_customerdocument` (`subscriberDocId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_monthlypaymentinstallment
DROP TABLE IF EXISTS `tbl_monthlypaymentinstallment`;
CREATE TABLE IF NOT EXISTS `tbl_monthlypaymentinstallment` (
  `monthlypaymentinstallmentId` int(11) NOT NULL,
  `installmentAmount` decimal(10,0) DEFAULT NULL,
  `dateOfInstallment` date DEFAULT NULL,
  `collectionId` int(11) NOT NULL,
  `chitpaymentId` int(11) NOT NULL,
  PRIMARY KEY (`monthlypaymentinstallmentId`),
  KEY `fk_collectionId_monthlypaymentininstallment_idx` (`collectionId`),
  KEY `fk_chitpaymentId_monthlypaymentininstallment_idx` (`chitpaymentId`),
  CONSTRAINT `fk_chitpaymentId_monthlypaymentininstallment` FOREIGN KEY (`chitpaymentId`) REFERENCES `tbl_monthlypayment` (`chitpaymentId`),
  CONSTRAINT `fk_collectionId_monthlypaymentininstallment` FOREIGN KEY (`collectionId`) REFERENCES `tbl_collection` (`collectionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_nominee
DROP TABLE IF EXISTS `tbl_nominee`;
CREATE TABLE IF NOT EXISTS `tbl_nominee` (
  `nomineeId` int(11) NOT NULL AUTO_INCREMENT,
  `nomineeName` varchar(50) NOT NULL,
  `relation` varchar(50) NOT NULL,
  `DOB` date NOT NULL,
  `age` int(11) NOT NULL,
  `contactNumber` varchar(15) NOT NULL,
  PRIMARY KEY (`nomineeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_profile
DROP TABLE IF EXISTS `tbl_profile`;
CREATE TABLE IF NOT EXISTS `tbl_profile` (
  `user_Id` int(11) NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `middleName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `AddressId` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_Id`),
  CONSTRAINT `userId` FOREIGN KEY (`user_Id`) REFERENCES `tbl_user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_questions
DROP TABLE IF EXISTS `tbl_questions`;
CREATE TABLE IF NOT EXISTS `tbl_questions` (
  `questionId` int(11) NOT NULL,
  `question` varchar(500) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_state
DROP TABLE IF EXISTS `tbl_state`;
CREATE TABLE IF NOT EXISTS `tbl_state` (
  `stateId` int(11) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`stateId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_subscriber
DROP TABLE IF EXISTS `tbl_subscriber`;
CREATE TABLE IF NOT EXISTS `tbl_subscriber` (
  `customerId` int(11) NOT NULL,
  `customerSubscriptionId` int(11) NOT NULL AUTO_INCREMENT,
  `contactPerson` varchar(50) NOT NULL,
  `userId` int(11) NOT NULL,
  `image` longblob NOT NULL,
  `balanceAmount` decimal(10,0) NOT NULL,
  UNIQUE KEY `customerSubscriptionId` (`customerSubscriptionId`),
  KEY `fk_customerId_subscriber_idx` (`customerId`),
  KEY `fk_userId_subscriber_idx` (`userId`),
  CONSTRAINT `fk_customerId_subscriber` FOREIGN KEY (`customerId`) REFERENCES `tbl_customer` (`customerId`),
  CONSTRAINT `fk_userId_subscriber` FOREIGN KEY (`userId`) REFERENCES `tbl_user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_subscriberguaranter
DROP TABLE IF EXISTS `tbl_subscriberguaranter`;
CREATE TABLE IF NOT EXISTS `tbl_subscriberguaranter` (
  `subscriberDocId` int(11) NOT NULL,
  `guaranterId` int(11) NOT NULL,
  KEY `fk_subscriberDocId_subscriberguaranter_idx` (`subscriberDocId`),
  KEY `fk_guaranterId_subscriberguaranter_idx` (`guaranterId`),
  CONSTRAINT `fk_guaranterId_subscriberguaranter` FOREIGN KEY (`guaranterId`) REFERENCES `tbl_guaranter` (`guaranterId`),
  CONSTRAINT `fk_subscriberDocId_subscriberguaranter` FOREIGN KEY (`subscriberDocId`) REFERENCES `tbl_customerdocument` (`subscriberDocId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_subscribernominee
DROP TABLE IF EXISTS `tbl_subscribernominee`;
CREATE TABLE IF NOT EXISTS `tbl_subscribernominee` (
  `subscriberDocId` int(11) NOT NULL,
  `nomineeId` int(11) NOT NULL,
  KEY `fk_guaranterId_subscribernominee_idx` (`subscriberDocId`),
  KEY `fk_nomineeId_idx` (`nomineeId`),
  CONSTRAINT `fk_guaranterId_subscribernominee` FOREIGN KEY (`subscriberDocId`) REFERENCES `tbl_customerdocument` (`subscriberDocId`),
  CONSTRAINT `fk_nomineeId` FOREIGN KEY (`nomineeId`) REFERENCES `tbl_nominee` (`nomineeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_user
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `middleName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) NOT NULL,
  `mobileNo` varchar(15) NOT NULL,
  `loginId` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `gender` binary(1) NOT NULL,
  `doj` date NOT NULL,
  `dob` date NOT NULL,
  `userTypeId` int(11) NOT NULL,
  `addressId` int(11) NOT NULL,
  `securityQuestionId` int(11) NOT NULL,
  `securityAnswer` varchar(100) NOT NULL,
  `image` longblob,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `loginId` (`loginId`),
  KEY `fk_userTypeId_user_idx` (`userTypeId`),
  KEY `fk_addressId_user_idx` (`addressId`),
  KEY `fk_securityQuestionId_user_idx` (`securityQuestionId`),
  CONSTRAINT `fk_addressId_user` FOREIGN KEY (`addressId`) REFERENCES `tbl_address` (`addressId`),
  CONSTRAINT `fk_securityQuestionId_user` FOREIGN KEY (`securityQuestionId`) REFERENCES `tbl_questions` (`questionId`),
  CONSTRAINT `fk_userTypeId_user` FOREIGN KEY (`userTypeId`) REFERENCES `tbl_usertype` (`userTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.tbl_usertype
DROP TABLE IF EXISTS `tbl_usertype`;
CREATE TABLE IF NOT EXISTS `tbl_usertype` (
  `userTypeId` int(11) NOT NULL,
  `typeName` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table dotnet_chitfunddb.test
DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `document` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
