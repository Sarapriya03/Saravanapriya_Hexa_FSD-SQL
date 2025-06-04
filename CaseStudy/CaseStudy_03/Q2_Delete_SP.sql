---2.Create stored procedures for all the tables to delete data by using appropriate column in where clause.---

---Table : EventDetails

ALTER PROCEDURE sp_Delete_EventDetails
    @status VARCHAR(100)
AS
BEGIN
    -- Step 1: Delete from ParticipantEventDetails using JOIN with SessionInfo and EventDetails
    DELETE ped
    FROM ParticipantEventDetails ped
    INNER JOIN SessionInfo si ON ped.SessionId = si.SessionId
    INNER JOIN EventDetails ed ON si.EventId = ed.EventId
    WHERE ed.Status = @status;

    -- Step 2: Delete from SessionInfo
    DELETE si
    FROM SessionInfo si
    INNER JOIN EventDetails ed ON si.EventId = ed.EventId
    WHERE ed.Status = @status;

    -- Step 3: Delete from EventDetails
    DELETE FROM EventDetails WHERE Status = @status;

    -- Step 4: Show remaining events
    SELECT * FROM EventDetails;
END;

EXEC sp_Delete_EventDetails @status = 'Active';

---Table : ParticipantEventDetails

CREATE PROCEDURE sp_Delete_ParticipantEventDetails
@is_attended bit
AS
BEGIN
	DELETE FROM ParticipantEventDetails Where IsAttended = @is_attended
	SELECT * FROM ParticipantEventDetails
END

EXEC sp_Delete_ParticipantEventDetails @is_attended = 0

---Table : SessionInfo

CREATE PROCEDURE sp_Delete_SessionInfo
@session_end datetime
AS
BEGIN
	DELETE FROM SessionInfo Where SessionEnd = @session_end
	SELECT * FROM SessionInfo
END

EXEC sp_Delete_SessionInfo @session_end = '2025-06-03'

---Table : SpeakersDetails

CREATE PROCEDURE sp_Delete_SpeakersDetails
@speaker_name varchar(100)
AS
BEGIN
	DELETE FROM SpeakersDetails Where SpeakerName = @speaker_name
	SELECT * FROM SpeakersDetails
END

EXEC sp_Delete_SpeakersDetails @speaker_name = 'Prof. James'

---Table : UserInfo

CREATE PROCEDURE sp_Delete_UserInfo
@role varchar(50)
AS
BEGIN
	DELETE FROM UserInfo Where Role = @role
	SELECT * FROM UserInfo
END

EXEC sp_Delete_UserInfo @role = 'Admin'