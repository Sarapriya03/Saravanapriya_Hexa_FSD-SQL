---1.Create stored procedures for all the tables to insert data.---

---Table : EventDetails

CREATE PROCEDURE sp_Add_EventDetails
@event_id int,
@event_name varchar(50)=NULL,
@event_category varchar(255)=NULL,
@event_date datetime=NULL,
@description varchar(255)=NULL,
@status varchar(20)=NULL
AS
BEGIN
	INSERT INTO EventDetails VALUES(@event_id,@event_name,@event_category,@event_date,@description,@status)
END

sp_Add_EventDetails 100,'Workshop','Hands-on','2025-05-12','Offline Event','Active'
SELECT * FROM EventDetails

---Table : ParticipantEventDetails

CREATE PROCEDURE sp_Add_ParticipantEventDetails
@id int,
@participant_email_id varchar(100)=NULL,
@event_id int=NULL,
@session_id int=NULL,
@is_attended bit=NULL
AS
BEGIN
	INSERT INTO ParticipantEventDetails VALUES(@id,@participant_email_id,@event_id,@session_id,@is_attended)
END

sp_Add_ParticipantEventDetails 5,'user3@example.com',102,202,1
SELECT * FROM ParticipantEventDetails

---Table : SessionInfo

CREATE PROCEDURE sp_Add_SessionInfo
@session_id int,
@event_id int,
@session_title varchar(100)=NULL,
@speaker_id int,
@description varchar(100)=NULL,
@session_start datetime=NULL,
@session_end datetime=NULL,
@session_url varchar(100)=NULL
AS
BEGIN
	INSERT INTO SessionInfo VALUES(@session_id,@event_id,@session_title,@speaker_id,@description,@session_start,@session_end,@session_url)
END

sp_Add_SessionInfo 104,100,'2K25 IoT Devices',1,'Benefits and Innovations','2025-06-01','2025-06-03','https://sessionlink.com/iot2025'
SELECT * FROM SessionInfo

---Table : SpeakersDetails

CREATE PROCEDURE sp_Add_SpeakersDetails
@speaker_id int,
@speaker_name varchar(100)=NULL
AS
BEGIN
	INSERT INTO SpeakersDetails VALUES(@speaker_id,@speaker_name)
END

sp_Add_SpeakersDetails 4,'Prof. James'
SELECT * FROM SpeakersDetails

---Table : UserInfo

CREATE PROCEDURE sp_Add_UserInfo
@email_id varchar(100),
@user_name varchar(100),
@role varchar(50),
@password varchar(50)
AS
BEGIN
	INSERT INTO UserInfo VALUES(@email_id,@user_name,@role,@password)
END

sp_Add_UserInfo 'user4@example.com','Dan Brown','Admin','System@123'
SELECT * FROM UserInfo