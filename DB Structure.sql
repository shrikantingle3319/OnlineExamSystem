-- =============================================
-- Create Database
-- =============================================
CREATE DATABASE OnlineExamSystem;
GO

USE OnlineExamSystem;
GO

-- =============================================
-- Admin Table
-- =============================================
CREATE TABLE Users_Admin (
    AdminID INT IDENTITY(1,1) PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL
);

-- =============================================
-- Student Table
-- =============================================
CREATE TABLE Users_Student (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
);

-- =============================================
-- Exam Table
-- =============================================
CREATE TABLE Exams (
    ExamID INT IDENTITY(1,1) PRIMARY KEY,
    ExamName VARCHAR(200) NOT NULL,
    Duration INT NOT NULL,
    TotalMarks INT NOT NULL,
    AdminID INT NOT NULL,
    IsActive BIT DEFAULT 1,
    ShowResults BIT DEFAULT 1,
    AllowReview BIT DEFAULT 1,
    FOREIGN KEY (AdminID) REFERENCES Users_Admin(AdminID)
);

-- =============================================
-- Question Table
-- =============================================
CREATE TABLE Questions (
    QuestionID INT IDENTITY(1,1) PRIMARY KEY,
    ExamID INT NOT NULL,
    QuestionText VARCHAR(MAX) NOT NULL,
    OptionA VARCHAR(255) NOT NULL,
    OptionB VARCHAR(255) NOT NULL,
    OptionC VARCHAR(255) NOT NULL,
    OptionD VARCHAR(255) NOT NULL,
    CorrectAnswer CHAR(1) NOT NULL,
    Marks INT DEFAULT 1,
    FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
);

-- Restrict CorrectAnswer to A, B, C, D only
ALTER TABLE Questions
ADD CONSTRAINT CK_CorrectAnswer
CHECK (CorrectAnswer IN ('A','B','C','D'));

-- =============================================
-- Student Answers Table
-- =============================================
CREATE TABLE StudentAnswers (
    AnswerID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT NOT NULL,
    ExamID INT NOT NULL,
    QuestionID INT NOT NULL,
    SelectedOption CHAR(1) NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Users_Student(StudentID),
    FOREIGN KEY (ExamID) REFERENCES Exams(ExamID),
    FOREIGN KEY (QuestionID) REFERENCES Questions(QuestionID)
);

-- Restrict SelectedOption to A, B, C, D only
ALTER TABLE StudentAnswers
ADD CONSTRAINT CK_SelectedOption
CHECK (SelectedOption IN ('A','B','C','D'));

-- =============================================
-- Results Table
-- =============================================
CREATE TABLE Results (
    ResultID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT NOT NULL,
    ExamID INT NOT NULL,
    Score INT NOT NULL,
    SubmittedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (StudentID) REFERENCES Users_Student(StudentID),
    FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
);

-- Prevent same student submitting same exam twice
ALTER TABLE Results
ADD CONSTRAINT UQ_Student_Exam UNIQUE (StudentID, ExamID);

-- =============================================
-- Concerns Table
-- =============================================
CREATE TABLE Concerns (
    ConcernID INT IDENTITY(1,1) PRIMARY KEY,
    ExamID INT NOT NULL,
    QuestionID INT NOT NULL,
    StudentID INT NOT NULL,
    ConcernText VARCHAR(MAX) NOT NULL,
    Status VARCHAR(50) DEFAULT 'Open',
    RaisedDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ExamID) REFERENCES Exams(ExamID),
    FOREIGN KEY (QuestionID) REFERENCES Questions(QuestionID),
    FOREIGN KEY (StudentID) REFERENCES Users_Student(StudentID)
);

-- =============================================
-- Live Activity Table
-- =============================================
CREATE TABLE LiveActivity (
    ActivityID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT NOT NULL,
    ExamID INT NOT NULL,
    StartTime DATETIME DEFAULT GETDATE(),
    LastHeartbeat DATETIME DEFAULT GETDATE(),
    WarningCount INT DEFAULT 0,
    Status VARCHAR(50) DEFAULT 'InProgress',
    FOREIGN KEY (StudentID) REFERENCES Users_Student(StudentID),
    FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
);

-- =============================================
-- Invigilator Table (Future Enhancement)
-- =============================================
/*
CREATE TABLE Users_Invigilator (
    InvigilatorID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    ExamID INT,
    AssignedDate DATETIME DEFAULT GETDATE(),
    IsActive BIT DEFAULT 1,
    FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
);
*/

-- =============================================
-- Exam Settings Table (Future Enhancement)
-- =============================================
/*
CREATE TABLE ExamSettings (
    SettingID INT IDENTITY(1,1) PRIMARY KEY,
    ExamID INT NOT NULL,
    SettingName VARCHAR(100) NOT NULL,
    SettingValue VARCHAR(255) NOT NULL,
    FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
);
*/
