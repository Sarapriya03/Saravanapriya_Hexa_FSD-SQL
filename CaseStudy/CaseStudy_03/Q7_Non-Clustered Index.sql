---7.Apply non-clustered indexes to tables by choosing appropriate columns.---

---Table : EventDetails

CREATE NONCLUSTERED INDEX Index_EventDetails_Status
ON EventDetails (Status);

---Table : ParticipantEventDetails

CREATE NONCLUSTERED INDEX Index_ParticipantEventDetails_EventId_SessionId
ON ParticipantEventDetails (EventId, SessionId);

---Table : SessionInfo

CREATE NONCLUSTERED INDEX Index_SessionInfo_EventId
ON SessionInfo(EventId);

---Table : SpeakersDetails

CREATE NONCLUSTERED INDEX Index_SpeakersDetails_SpeakerName
ON SpeakersDetails (SpeakerName);

---Table : UserInfo

CREATE NONCLUSTERED INDEX Index_UserInfo_Email
ON UserInfo (EmailId);

