

CREATE VIEW SelfProfiles -- Functionality #4
AS
    SELECT username, usertype, fullname, birthdate, CNIC, phonenumber, gender, emailaddress, workaddress, picture, aboutuser, rating, jobsongoing, jobsdone FROM Users
GO

CREATE VIEW NonSelfProfiles -- AAdditional Functionality (~#4)
AS
    SELECT username, usertype, fullname, gender, picture, aboutuser, rating, jobsdone FROM Users
GO




CREATE VIEW PendingComplaints -- Functionality #20
AS
    SELECT sentby, requestsate, details WHERE requeststatus = 'P'
GO








EXECUTE UpdateUserAboutById
@UserId = 6,
@aboutuser = "Hi there! My name is First_Freelancer and I am a freelance graphic designer with over 5 years of experience."
GO









CREATE VIEW MyJobs
AS
    SELECT jobtitle, jobtype, jobvalue, jobdetail, postdate, duedate, jobstatus, deliverable FROM Jobs
GO





































----no change here so didnt copy

alter PROCEDURE PostJob
    @clientID INT,
    @jobtitle VARCHAR(32),
    @jobtype VARCHAR(32),
    @jobvalue MONEY,
    @jobdetail TEXT,
    @duedate DATE,

    
AS
BEGIN
    

    
  --  DECLARE @walletBalance MONEY;
  --  SELECT @walletBalance = amount FROM moneytransfers WHERE srcuser = @clientID;
  --  IF @jobvalue > @walletBalance
  --  BEGIN
  --      RAISERROR ('Insufficient balance in wallet. Please deposit sufficient funds to post the job.', 16, 1);
  --      RETURN;
  --  END

   

  --  DECLARE @commission MONEY;
  --  SET @commission = @jobvalue * 0.1;
  --  UPDATE MoneyTransfers SET amount = amount - @jobvalue - @commission WHERE srcuser = @clientID;

    
    INSERT INTO Jobs (clientID, jobtitle, jobtype, jobvalue, jobdetail, postdate, duedate, jobstatus)
    VALUES (@clientID, @jobtitle, @jobtype, @jobvalue, @jobdetail, GETDATE(), @duedate, 'T');
    
    
END
go

select* from Jobs
select* from Users

DECLARE @retVal INT
EXEC PostJob 
    @clientID = 3,
    @jobtitle = 'Job Title',
    @jobtype = 'Data',
    @jobvalue = 100.00,
    @jobdetail = 'Example Job Details',
    @_ret_val_ = @retVal OUTPUT

SELECT @retVal
go



DECLARE @jobID INT = 16
DECLARE @UserID INT = 6
DECLARE @return_val INT

EXEC CheckIfUserHasApplied @jobID, @UserID, @return_val OUTPUT

SELECT @return_val



DECLARE @proposalID INT
DECLARE @proposaldetail VARCHAR(1000)
DECLARE @approvalstatus VARCHAR(32)
DECLARE @applydate DATE

EXEC getProposal
    @jobID = 16,
    @lancerID = 6,
    @proposalID = @proposalID OUTPUT,
    @proposaldetail = @proposaldetail OUTPUT,
    @approvalstatus = @approvalstatus OUTPUT,
    @applydate = @applydate OUTPUT

SELECT @proposalID AS ProposalID, @proposaldetail AS ProposalDetail, @approvalstatus AS ApprovalStatus, @applydate AS ApplyDate





go
------------already got it from previous file
alter PROCEDURE ViewPostedJobs
	@clientId INT
AS
BEGIN
	SELECT jobID, jobtitle, jobtype, jobvalue, jobdetail, postdate, duedate, jobstatus
	FROM Jobs
	WHERE clientID = @clientId;
END
go








EXEC UploadDeliverable @jobID = 14, @deliverable = 0x54686973206973206120746573742064656c6976657261626c652e





select* from jobs

GO

create procedure ViewOngoingJobs
@lancerID INT
as
begin
	select jobID, jobtitle, jobdetail, jobtype, jobvalue,jobstatus ,duedate from Jobs where lancerID = @lancerID
end
GO

alter procedure removeJob
@jobID INT
as
begin
    if exists (select* from MoneyTransfers where forjob = @jobID)
    begin
        UPDATE Users	SET walletmoney += (select amount from MoneyTransfers where forjob = @jobID) WHERE userID = (SELECT srcuser FROM MoneyTransfers WHERE forjob = @jobID)
        UPDATE Users	SET walletmoney -= (select amount from MoneyTransfers where forjob = @jobID) WHERE userID = (SELECT dstuser FROM MoneyTransfers WHERE forjob = @jobID)
        delete from MoneyTransfers where forjob = @jobID
        
	end
    if exists (select* from complaints where onJob = @jobID)
    begin
		delete from complaints where onJob = @jobID
	end

    delete from Jobs where jobID = @jobID
end

select * from MoneyTransfers
select* from complaints



create procedure getProposals
@jobID INT
as
begin
	select proposalID,lancerID,proposaldetail,approvalstatus,applydate from Proposals where jobID = @jobID
end
GO

create procedure checklancer
@lancerID Int,
@ret_val int output
as
begin
	if exists(select * from Jobs where lancerID = @lancerID)
	begin
		set @ret_val = 1
	end
	else
	begin
		set @ret_val = 0
	end
end
GO













DECLARE @jobTitle VARCHAR(32),
        @jobType VARCHAR(32),
        @jobValue MONEY,
        @jobDetail NVARCHAR(1000),
        @postDate DATE,
        @dueDate DATE,
        @jobID INT = 17-- Replace with the desired jobID value

EXEC ViewPostedJobs_F 
    @jobID = @jobID,
    @jobTitle = @jobTitle OUTPUT,
    @jobType = @jobType OUTPUT,
    @jobValue = @jobValue OUTPUT,
    @jobDetail = @jobDetail OUTPUT,
    @postDate = @postDate OUTPUT,
    @dueDate = @dueDate OUTPUT

SELECT @jobTitle AS JobTitle,
       @jobType AS JobType,
       @jobValue AS JobValue,
       @jobDetail AS JobDetail,
       @postDate AS PostDate,
       @dueDate AS DueDate
select* from Jobs








Declare @lancerID int = 3
Declare @jobID int = 17
Declare @proposalDetail nvarchar(1000) = 'I am a good fit for this job2'
EXEC submitProposal @lancerID, @jobID,@proposalDetail;

select* from Proposals
go





----------/////////////////////////////////////////////////
-----there are some issues here--------------------------(there should be deliverydate as well but for now i am using duedate)




------------------incomplete (rating column's confusing me)-------------- 


--incomplete

--CREATE PROCEDURE logout_user (IN user_id INT)
--BEGIN
--   UPDATE users SET is_logged_in = 0 WHERE id = user_id;
--END


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
drop procedure Feedback_store

go

-----already exists 
create table feedback		-- complaints/feedback/requests for admins by clients/freelancers
(
	feedbackID		int				primary key		identity(1,1),
	sentby			int				foreign key		references Users (userID),
	UName		varchar(25),
	email		varchar(50),
	feedback	varchar(250),
    rating      varchar(50)
);
go

create table Complain		-- complaints/feedback/requests for admins by clients/freelancers
(
	ComplainID		int				primary key		identity(1,1),
	sentby			int				foreign key		references Users (userID),
	improve		varchar(250),
	complain	varchar(250),
	suggestion	varchar(250)
);
go

drop table feedback
drop table Complain



select* from Jobs
select* from Users