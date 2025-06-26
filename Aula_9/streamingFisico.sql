/* streaming: */

CREATE TABLE User (
    ID_User Number PRIMARY KEY,
    Name String,
    Address String
);

CREATE TABLE Movie (
    ID_Movie Number PRIMARY KEY,
    Time Time,
    Title String,
    Total_Rating NUmber,
    fk_Director_ID_Director Number
);

CREATE TABLE Series (
    ID_Serie Number PRIMARY KEY,
    Title String,
    Total_Rating Number,
    fk_Director_ID_Director Number
);

CREATE TABLE Episode (
    Title String,
    ID_Episode Number PRIMARY KEY,
    Episode_Time Time,
    fk_Series_ID_Serie Number
);

CREATE TABLE Director (
    Name String,
    Description String,
    ID_Director Number PRIMARY KEY
);

CREATE TABLE _Genre (
    ID_Genre Number PRIMARY KEY,
    Name String
);

CREATE TABLE Actor (
    ID_Actor Number PRIMARY KEY,
    Nome String,
    Description String
);

CREATE TABLE Wishlist_Movie_Watch_Later (
    Listing_Date Date,
    fk_Movie_ID_Movie Number,
    fk_User_ID_User Number
);

CREATE TABLE Rating_Movie_Watch (
    Note Number,
    Message String,
    fk_User_ID_User Number,
    fk_Movie_ID_Movie Number
);

CREATE TABLE _Watched_list_Movie_Watched (
    Status String,
    Date Date,
    fk_Movie_ID_Movie Number,
    fk_User_ID_User Number
);

CREATE TABLE Rating_Serie_Watch (
    Note Number,
    Message String,
    fk_User_ID_User Number,
    fk_Episode_ID_Episode Number
);

CREATE TABLE Wishlist_Watch_Serie_Later (
    Listing_Date Date,
    fk_Series_ID_Serie Number,
    fk_User_ID_User Number
);

CREATE TABLE Watched_list_Episode_Serie_Watched (
    Date Date,
    Status String,
    fk_User_ID_User Number,
    fk_Episode_ID_Episode Number,
    fk_Series_ID_Serie Number
);

CREATE TABLE Genre_List_Movie_Has (
    Number_of_Titles Number,
    fk_Movie_ID_Movie Number,
    FK_Genre Number
);

CREATE TABLE Genre_List_Serie_Has (
    Number_of_Titles Number,
    fk_Series_ID_Serie Number,
    FK_Genre Number
);

CREATE TABLE _Actor_Participation_Movie_Has (
    Number_of_Participations Number,
    fk_Actor_ID_Actor Number,
    fk_Movie_ID_Movie Number
);

CREATE TABLE _Actor_Participation_Serie_Has (
    Number_of_Participations Number,
    fk_Actor_ID_Actor Number,
    fk_Series_ID_Serie Number
);
 
ALTER TABLE Movie ADD CONSTRAINT FK_Movie_2
    FOREIGN KEY (fk_Director_ID_Director)
    REFERENCES Director (ID_Director)
    ON DELETE RESTRICT;
 
ALTER TABLE Series ADD CONSTRAINT FK_Series_2
    FOREIGN KEY (fk_Director_ID_Director)
    REFERENCES Director (ID_Director)
    ON DELETE RESTRICT;
 
ALTER TABLE Episode ADD CONSTRAINT FK_Episode_2
    FOREIGN KEY (fk_Series_ID_Serie)
    REFERENCES Series (ID_Serie)
    ON DELETE RESTRICT;
 
ALTER TABLE Wishlist_Movie_Watch_Later ADD CONSTRAINT FK_Wishlist_Movie_Watch_Later_1
    FOREIGN KEY (fk_Movie_ID_Movie)
    REFERENCES Movie (ID_Movie);
 
ALTER TABLE Wishlist_Movie_Watch_Later ADD CONSTRAINT FK_Wishlist_Movie_Watch_Later_2
    FOREIGN KEY (fk_User_ID_User)
    REFERENCES User (ID_User);
 
ALTER TABLE Rating_Movie_Watch ADD CONSTRAINT FK_Rating_Movie_Watch_1
    FOREIGN KEY (fk_Movie_ID_Movie)
    REFERENCES Movie (ID_Movie);
 
ALTER TABLE Rating_Movie_Watch ADD CONSTRAINT FK_Rating_Movie_Watch_2
    FOREIGN KEY (fk_User_ID_User)
    REFERENCES User (ID_User);
 
ALTER TABLE _Watched_list_Movie_Watched ADD CONSTRAINT FK__Watched_list_Movie_Watched_1
    FOREIGN KEY (fk_Movie_ID_Movie)
    REFERENCES Movie (ID_Movie);
 
ALTER TABLE _Watched_list_Movie_Watched ADD CONSTRAINT FK__Watched_list_Movie_Watched_2
    FOREIGN KEY (fk_User_ID_User)
    REFERENCES User (ID_User);
 
ALTER TABLE Rating_Serie_Watch ADD CONSTRAINT FK_Rating_Serie_Watch_1
    FOREIGN KEY (fk_User_ID_User)
    REFERENCES User (ID_User);
 
ALTER TABLE Rating_Serie_Watch ADD CONSTRAINT FK_Rating_Serie_Watch_2
    FOREIGN KEY (fk_Episode_ID_Episode)
    REFERENCES Episode (ID_Episode);
 
ALTER TABLE Wishlist_Watch_Serie_Later ADD CONSTRAINT FK_Wishlist_Watch_Serie_Later_1
    FOREIGN KEY (fk_Series_ID_Serie)
    REFERENCES Series (ID_Serie);
 
ALTER TABLE Wishlist_Watch_Serie_Later ADD CONSTRAINT FK_Wishlist_Watch_Serie_Later_2
    FOREIGN KEY (fk_User_ID_User)
    REFERENCES User (ID_User);
 
ALTER TABLE Watched_list_Episode_Serie_Watched ADD CONSTRAINT FK_Watched_list_Episode_Serie_Watched_1
    FOREIGN KEY (fk_User_ID_User)
    REFERENCES User (ID_User);
 
ALTER TABLE Watched_list_Episode_Serie_Watched ADD CONSTRAINT FK_Watched_list_Episode_Serie_Watched_2
    FOREIGN KEY (fk_Episode_ID_Episode)
    REFERENCES Episode (ID_Episode);
 
ALTER TABLE Watched_list_Episode_Serie_Watched ADD CONSTRAINT FK_Watched_list_Episode_Serie_Watched_3
    FOREIGN KEY (fk_Series_ID_Serie)
    REFERENCES Series (ID_Serie);
 
ALTER TABLE Genre_List_Movie_Has ADD CONSTRAINT FK_Genre_List_Movie_Has_1
    FOREIGN KEY (FK_Genre)
    REFERENCES _Genre (ID_Genre);
 
ALTER TABLE Genre_List_Movie_Has ADD CONSTRAINT FK_Genre_List_Movie_Has_2
    FOREIGN KEY (fk_Movie_ID_Movie)
    REFERENCES Movie (ID_Movie);
 
ALTER TABLE Genre_List_Serie_Has ADD CONSTRAINT FK_Genre_List_Serie_Has_1
    FOREIGN KEY (fk_Series_ID_Serie)
    REFERENCES Series (ID_Serie);
 
ALTER TABLE Genre_List_Serie_Has ADD CONSTRAINT FK_Genre_List_Serie_Has_2
    FOREIGN KEY (FK_Genre)
    REFERENCES _Genre (ID_Genre);
 
ALTER TABLE _Actor_Participation_Movie_Has ADD CONSTRAINT FK__Actor_Participation_Movie_Has_1
    FOREIGN KEY (fk_Actor_ID_Actor)
    REFERENCES Actor (ID_Actor);
 
ALTER TABLE _Actor_Participation_Movie_Has ADD CONSTRAINT FK__Actor_Participation_Movie_Has_2
    FOREIGN KEY (fk_Movie_ID_Movie)
    REFERENCES Movie (ID_Movie);
 
ALTER TABLE _Actor_Participation_Serie_Has ADD CONSTRAINT FK__Actor_Participation_Serie_Has_1
    FOREIGN KEY (fk_Actor_ID_Actor)
    REFERENCES Actor (ID_Actor);
 
ALTER TABLE _Actor_Participation_Serie_Has ADD CONSTRAINT FK__Actor_Participation_Serie_Has_2
    FOREIGN KEY (fk_Series_ID_Serie)
    REFERENCES Series (ID_Serie);