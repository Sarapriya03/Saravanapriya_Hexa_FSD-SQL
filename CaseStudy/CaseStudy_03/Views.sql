---4.Create a view to show session details of the particular event.---

CREATE VIEW view_SessionDetailsByEvent
AS
SELECT 
    e.EventId,
    e.EventName,
    e.EventCategory,
    e.EventDate,
    s.SessionId,
    s.SessionTitle,
    s.SessionStart,
    s.SessionEnd
FROM 
    EventDetails e
INNER JOIN 
    SessionInfo s ON e.EventId = s.EventId;

SELECT * FROM view_SessionDetailsByEvent

---5.Create a view to show speaker detail of particular session.---

CREATE VIEW view_SpeakerDetailsBySession
AS
SELECT 
    s.SessionId,
    s.SessionTitle,
    sd.SpeakerId,
    sd.SpeakerName
FROM 
    SessionInfo s
INNER JOIN 
    SessionInfo si ON s.SessionId = si.SessionId
INNER JOIN 
    SpeakersDetails sd ON si.SpeakerId = sd.SpeakerId;

SELECT * FROM view_SpeakerDetailsBySession

---6.Create a view to show all details of an event like sessions, speaker details, participant details.---

CREATE VIEW view_EventFullDetails
AS
SELECT 
    e.EventId,
    e.EventName,
    e.EventCategory,
    e.EventDate,
    e.Status,

    s.SessionId,
    s.SessionTitle,
    s.SessionStart,
    s.SessionEnd,

    sp.SpeakerId,
    sp.SpeakerName,
 
    p.Id AS ParticipantEntryId,
    p.ParticipantEmailId,
    p.IsAttended
FROM 
    EventDetails e
LEFT JOIN 
    SessionInfo s ON e.EventId = s.EventId
LEFT JOIN 
    SpeakersDetails sp ON s.SpeakerId = sp.SpeakerId
LEFT JOIN 
    ParticipantEventDetails p ON s.SessionId = p.SessionId AND e.EventId = p.EventId;

SELECT * FROM view_EventFullDetails