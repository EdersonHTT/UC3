/* Lógico_2: */

CREATE TABLE User (
    ID_User INTEGER PRIMARY KEY,
    Name VARCHAR,
    Address VARCHAR,
    Email VARCHAR,
    Signature BOOLEAN
);

CREATE TABLE Album (
    ID_Album INTEGER PRIMARY KEY,
    Title VARCHAR,
    Release_Date DATE,
    fk_Artist_ID_Artist INTEGER
);

CREATE TABLE Artist (
    ID_Artist INTEGER PRIMARY KEY,
    Name VARCHAR,
    Description VARCHAR,
    Nationality VARCHAR,
    Date_of_Birth DATE
);

CREATE TABLE Audio (
    ID_Audio INTEGER PRIMARY KEY,
    Release_Date DATE,
    Name VARCHAR,
    Time TIME,
    Title VARCHAR,
    Language VARCHAR,
    fk_Album_ID_Album INTEGER,
    fk_Artist_ID_Artist INTEGER
);

CREATE TABLE Genre (
    Name VARCHAR,
    Description VARCHAR,
    ID_Genre INTEGER PRIMARY KEY
);

CREATE TABLE Music (
    Lyrics VARCHAR,
    ID_Music INTEGER,
    fk__Audio_ID_Audio INTEGER,
    PRIMARY KEY (ID_Music, fk__Audio_ID_Audio)
);

CREATE TABLE Podcast (
    Description VARCHAR,
    ID_Podcast INTEGER,
    Episode INTEGER,
    fk__Audio_ID_Audio INTEGER,
    PRIMARY KEY (ID_Podcast, fk__Audio_ID_Audio)
);

CREATE TABLE History_Listen (
    ID_Listened INTEGER PRIMARY KEY,
    Listened_Date DATE,
    fk_User_ID_User INTEGER,
    fk__Audio_ID_Audio INTEGER
);

CREATE TABLE Playlist_Save (
    Title VARCHAR,
    Listing_Date DATE,
    ID_Listed INTEGER PRIMARY KEY,
    fk_User_ID_User INTEGER,
    fk__Audio_ID_Audio INTEGER
);

CREATE TABLE Genre_List_Has (
    Type_of_Relationship VARCHAR,
    fk_Genre_ID_Genre INTEGER,
    fk__Audio_ID_Audio INTEGER
);

CREATE TABLE Premium (
    Premium_Time DATE,
    fk_User_ID_User INTEGER PRIMARY KEY
);

CREATE TABLE Common_ (
    fk_User_ID_User INTEGER PRIMARY KEY
);

CREATE TABLE Participant (
    Name VARCHAR,
    Description VARCHAR,
    ID_Participant INTEGER PRIMARY KEY
);

CREATE TABLE Participation_Has (
    Participation_Time DATE,
    fk_Podcast_ID_Podcast INTEGER,
    fk_Participant_ID_Participant INTEGER
);
 
ALTER TABLE Album ADD CONSTRAINT FK_Album_2
    FOREIGN KEY (fk_Artist_ID_Artist)
    REFERENCES Artist (ID_Artist)
    ON DELETE RESTRICT;
 
ALTER TABLE Audio ADD CONSTRAINT FK_Audio_2
    FOREIGN KEY (fk_Album_ID_Album)
    REFERENCES Album (ID_Album)
    ON DELETE RESTRICT;
 
ALTER TABLE Audio ADD CONSTRAINT FK_Audio_3
    FOREIGN KEY (fk_Artist_ID_Artist)
    REFERENCES Artist (ID_Artist)
    ON DELETE RESTRICT;
 
ALTER TABLE Music ADD CONSTRAINT FK_Music_2
    FOREIGN KEY (fk__Audio_ID_Audio)
    REFERENCES Audio (ID_Audio)
    ON DELETE CASCADE;
 
ALTER TABLE Podcast ADD CONSTRAINT FK_Podcast_2
    FOREIGN KEY (fk__Audio_ID_Audio)
    REFERENCES Audio (ID_Audio)
    ON DELETE CASCADE;
 
ALTER TABLE History_Listen ADD CONSTRAINT FK_History_Listen_2
    FOREIGN KEY (fk_User_ID_User)
    REFERENCES User (ID_User);
 
ALTER TABLE History_Listen ADD CONSTRAINT FK_History_Listen_3
    FOREIGN KEY (fk__Audio_ID_Audio)
    REFERENCES Audio (ID_Audio);
 
ALTER TABLE Playlist_Save ADD CONSTRAINT FK_Playlist_Save_2
    FOREIGN KEY (fk_User_ID_User)
    REFERENCES User (ID_User);
 
ALTER TABLE Playlist_Save ADD CONSTRAINT FK_Playlist_Save_3
    FOREIGN KEY (fk__Audio_ID_Audio)
    REFERENCES Audio (ID_Audio);
 
ALTER TABLE Genre_List_Has ADD CONSTRAINT FK_Genre_List_Has_1
    FOREIGN KEY (fk_Genre_ID_Genre)
    REFERENCES Genre (ID_Genre);
 
ALTER TABLE Genre_List_Has ADD CONSTRAINT FK_Genre_List_Has_2
    FOREIGN KEY (fk__Audio_ID_Audio)
    REFERENCES Audio (ID_Audio);
 
ALTER TABLE Premium ADD CONSTRAINT FK_Premium_2
    FOREIGN KEY (fk_User_ID_User)
    REFERENCES User (ID_User)
    ON DELETE CASCADE;
 
ALTER TABLE Common_ ADD CONSTRAINT FK_Common__2
    FOREIGN KEY (fk_User_ID_User)
    REFERENCES User (ID_User)
    ON DELETE CASCADE;
 
ALTER TABLE Participation_Has ADD CONSTRAINT FK_Participation_Has_1
    FOREIGN KEY (fk_Podcast_ID_Podcast, fk_Podcast_fk__Audio_ID_Audio)
    REFERENCES Podcast (ID_Podcast, fk__Audio_ID_Audio);
 
ALTER TABLE Participation_Has ADD CONSTRAINT FK_Participation_Has_2
    FOREIGN KEY (fk_Participant_ID_Participant)
    REFERENCES Participant (ID_Participant);