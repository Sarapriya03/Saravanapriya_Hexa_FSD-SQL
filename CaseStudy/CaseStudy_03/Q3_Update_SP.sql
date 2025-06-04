---3.Create stored procedures for all the tables to update existing data by using appropriate column in where clause.---

---Table : EventDetails

CREATE PROCEDURE sp_Update_EventDetails
@event_id INT,
@event_name VARCHAR(50) = NULL,
@event_category VARCHAR(255) = NULL,
@event_date DATETIME = NULL,
@description VARCHAR(255) = NULL,
@status VARCHAR(20) = NULL
AS
BEGIN
    UPDATE EventDetails
    SET 
        EventName = ISNULL(@event_name, EventName),
        EventCategory = ISNULL(@event_category, EventCategory),
        EventDate = ISNULL(@event_date, EventDate),
        Description = ISNULL(@description, Description),
        Status = ISNULL(@status, Status)
    WHERE EventId = @event_id;
    
    SELECT * FROM EventDetails WHERE EventId = @event_id;
END;
SELECT * FROM EventDetails
EXEC sp_Update_EventDetails @event_id = 103,@event_name = 'Green Summit', @status = 'Active'

---Table : ParticipantEventDetails

CREATE PROCEDURE sp_Update_ParticipantEventDetails
@id INT,
@participant_email_id VARCHAR(100) = NULL,
@event_id INT = NULL,
@session_id INT = NULL,
@is_attended BIT = NULL
AS
BEGIN
    UPDATE ParticipantEventDetails
    SET 
        ParticipantEmailId = ISNULL(@participant_email_id, ParticipantEmailId),
        EventId = ISNULL(@event_id, EventId),
        SessionId = ISNULL(@session_id, SessionId),
        IsAttended = ISNULL(@is_attended, IsAttended)
    WHERE Id = @id;

    SELECT * FROM ParticipantEventDetails WHERE Id = @id;
END;
SELECT * FROM ParticipantEventDetails
EXEC sp_Update_ParticipantEventDetails @id = 101,@is_attended = 0

---Table : SessionInfo

CREATE PROCEDURE sp_Update_SessionInfo
@session_id INT,
@event_id INT = NULL,
@session_title VARCHAR(100) = NULL,
@speaker_id VARCHAR(100) = NULL,
@description VARCHAR(100) = NULL,
@session_start DATETIME = NULL,
@session_end DATETIME = NULL,
@session_url VARCHAR(100) = NULL
AS
BEGIN
    UPDATE SessionInfo
    SET 
        EventId = ISNULL(@event_id, EventId),
        SessionTitle = ISNULL(@session_title, SessionTitle),
		SpeakerId = ISNULL(@speaker_id, SpeakerId),
		Description = ISNULL(@description, Description),
        SessionStart = ISNULL(@session_start, SessionStart),
        SessionEnd = ISNULL(@session_end, SessionEnd),
		SessionUrl = ISNULL(@session_url, SessionUrl)
    WHERE SessionId = @session_id;

    SELECT * FROM SessionInfo WHERE SessionId = @session_id;
END;
SELECT * FROM SessionInfo
EXEC sp_Update_SessionInfo @session_id = 203, @speaker_id = 1

---Table : SpeakersDetails

CREATE PROCEDURE sp_Update_SpeakersDetails
@speaker_id INT,
@speaker_name VARCHAR(100) = NULL
AS
BEGIN
    UPDATE SpeakersDetails
    SET
        SpeakerName = ISNULL(@speaker_name, SpeakerName)
    WHERE SpeakerId = @speaker_id;

    SELECT * FROM SpeakersDetails WHERE SpeakerId = @speaker_id;
END;
SELECT * FROM SpeakersDetails
EXEC sp_Update_SpeakersDetails @speaker_id = 3, @speaker_name = 'Prof.James'

---Table : UserInfo

ALTER PROCEDURE sp_Update_UserInfo
@email_id varchar(100) = NULL,
@user_name varchar(100) = NULL,
@role varchar(50) = NULL,
@password varchar(50)
AS
BEGIN
	UPDATE UserInfo
	SET
		EmailId = ISNULL(@email_id, EmailId),
		UserName = ISNULL(@user_name, UserName),
		Role = ISNULL(@role, Role)
	WHERE Password = @password;

	SELECT * FROM UserInfo WHERE password = @password;
END
SELECT * FROM UserInfo
EXEC sp_Update_UserInfo @password = 'Pass1234', @user_name = 'Jack'