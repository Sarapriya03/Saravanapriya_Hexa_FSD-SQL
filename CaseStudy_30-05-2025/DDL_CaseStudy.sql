CREATE DATABASE EventDb
USE EventDb

CREATE TABLE UserInfo (
EmailId VARCHAR(100) PRIMARY KEY,
UserName VARCHAR(50) NOT NULL CHECK (LEN(UserName) BETWEEN 1 AND 50),
Role VARCHAR(20) NOT NULL CHECK (Role IN ('Admin', 'Participant')),
Password VARCHAR(20) NOT NULL CHECK (LEN(Password) BETWEEN 6 AND 20)
)

CREATE TABLE EventDetails (
EventId INT PRIMARY KEY,
EventName VARCHAR(50) NOT NULL CHECK (LEN(EventName) BETWEEN 1 AND 50),
EventCategory VARCHAR(50) NOT NULL CHECK (LEN(EventCategory) BETWEEN 1 AND 50),
EventDate DATETIME NOT NULL,
Description VARCHAR(MAX) NULL,
Status VARCHAR(20) CHECK (Status IN ('Active', 'In-Active'))
)

CREATE TABLE SpeakersDetails (
SpeakerId INT PRIMARY KEY,
SpeakerName VARCHAR(50) NOT NULL CHECK (LEN(SpeakerName) BETWEEN 1 AND 50)
)

CREATE TABLE SessionInfo (
SessionId INT PRIMARY KEY,
EventId INT NOT NULL,
SessionTitle VARCHAR(50) NOT NULL CHECK (LEN(SessionTitle) BETWEEN 1 AND 50),
SpeakerId INT NOT NULL,
Description VARCHAR(MAX) NULL,
SessionStart DATETIME NOT NULL,
SessionEnd DATETIME NOT NULL,
SessionUrl VARCHAR(MAX),
CONSTRAINT FK_Session_Event FOREIGN KEY (EventId) REFERENCES EventDetails(EventId),
CONSTRAINT FK_Session_Speaker FOREIGN KEY (SpeakerId) REFERENCES SpeakersDetails(SpeakerId)
)

CREATE TABLE ParticipantEventDetails (
Id INT PRIMARY KEY,
ParticipantEmailId VARCHAR(100) NOT NULL,
EventId INT NOT NULL,
SessionId INT NOT NULL,
IsAttended BIT CHECK (IsAttended IN (0, 1)),
CONSTRAINT FK_Participant_User FOREIGN KEY (ParticipantEmailId) REFERENCES UserInfo(EmailId),
CONSTRAINT FK_Participant_Event FOREIGN KEY (EventId) REFERENCES EventDetails(EventId),
CONSTRAINT FK_Participant_Session FOREIGN KEY (SessionId) REFERENCES SessionInfo(SessionId)
)

INSERT INTO UserInfo (EmailId, UserName, Role, Password) VALUES
('admin1@example.com', 'Admin User1', 'Admin', 'Admin@123'),
('user1@example.com', 'John Doe', 'Participant', 'Pass1234'),
('user2@example.com', 'Jane Smith', 'Participant', 'Welcome99'),
('user3@example.com', 'Sam Green', 'Participant', 'Secure789'),
('admin2@example.com', 'System Admin', 'Admin', 'RootAccess');

SELECT * FROM UserInfo

INSERT INTO EventDetails (EventId, EventName, EventCategory, EventDate, Description, Status) VALUES
(101, 'Tech Conference', 'Technology', '2025-07-01 10:00:00', 'Annual tech meetup', 'Active'),
(102, 'Health Symposium', 'Healthcare', '2025-07-10 09:30:00', 'Discussing future of medicine', 'Active'),
(103, 'Green Summit', 'Environment', '2025-08-05 11:00:00', 'Sustainable solutions summit', 'In-Active');

SELECT * FROM EventDetails

INSERT INTO SpeakersDetails (SpeakerId, SpeakerName) VALUES
(1, 'Dr. Alan Turing'),
(2, 'Elena White'),
(3, 'Prof. David Tan');

SELECT * FROM SpeakersDetails

INSERT INTO SessionInfo (SessionId, EventId, SessionTitle, SpeakerId, Description, SessionStart, SessionEnd, SessionUrl) VALUES
(201, 101, 'AI in 2025', 1, 'Discussing AI trends and impacts.', '2025-07-01 10:00:00', '2025-07-01 11:30:00', 'https://sessionlink.com/ai2025'),
(202, 102, 'Future of Healthcare', 2, 'Medical tech and innovation.', '2025-07-10 09:30:00', '2025-07-10 11:00:00', 'https://sessionlink.com/health2025'),
(203, 103, 'Green Energy Tech', 3, 'Innovations in clean energy.', '2025-08-05 11:00:00', '2025-08-05 12:30:00', 'https://sessionlink.com/green2025');

SELECT * FROM SessionInfo

INSERT INTO ParticipantEventDetails (Id, ParticipantEmailId, EventId, SessionId, IsAttended) VALUES
(1, 'user1@example.com', 101, 201, 1),
(2, 'user2@example.com', 101, 201, 0),
(3, 'user1@example.com', 102, 202, 1),
(4, 'user3@example.com', 103, 203, 0);

SELECT * FROM ParticipantEventDetails



