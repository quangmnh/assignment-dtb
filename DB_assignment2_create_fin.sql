DROP DATABASE IF EXISTS `assignment2`;

CREATE DATABASE `assignment2`;

USE `assignment2`;

-- MESSAGE
CREATE TABLE MESSAGE(
    Message_ID CHAR(22) PRIMARY KEY,
    Msg_Content LONGTEXT,
    Msg_Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- COMMUNICATE  -- Duong
CREATE TABLE COMMUNICATE (
    C_ticket_ID CHAR(22),
    C_T_User_ID CHAR(22),
    C_Message_ID CHAR(22),
    C_Admin_ID CHAR(22),
    PRIMARY KEY (
        C_ticket_ID,
        C_T_User_ID,
        C_Message_ID
    )
);

-- TICKET
CREATE TABLE TICKET (
    Ticket_ID CHAR(22),
    T_User_ID CHAR(22),
    Issue VARCHAR(255),
    TicketTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Status BOOLEAN,
    PRIMARY KEY (Ticket_ID, T_User_ID)
);

-- LISTENED_BY
CREATE TABLE LISTENED_BY (
    LB_Track_ID CHAR(22),
    LB_User_ID CHAR(22),
    NumberOfStream INT,
    PRIMARY KEY (LB_Track_ID, LB_User_ID)
);

-- TRACK_GENRE
CREATE TABLE TRACK_GENRE (
    TG_Track_ID CHAR(22),
    Genre CHAR(22),
    PRIMARY KEY (TG_Track_ID, Genre)
);

-- PLAYBACK_DEVICE
CREATE TABLE PLAYBACK_DEVICE (
    PD_Playback_ID CHAR(22),
    Device VARCHAR(255),
    PRIMARY KEY (PD_Playback_ID, Device)
);

-- PLAYBACK
CREATE TABLE PLAYBACK (
    Playback_ID CHAR(22),
    PB_User_ID CHAR(22),
    CurrentTimeStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (Playback_ID, PB_User_ID)
);

-- TRACK -- Duong
CREATE TABLE TRACK (
    Track_ID CHAR(22) PRIMARY KEY,
    Duration INT,
    Name VARCHAR(70),
    T_Content_ID CHAR(22)
);

-- USER_PLAYLIST
CREATE TABLE USER_PLAYLIST (
    UP_Playlist_ID CHAR(22),
    TimeCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UP_User_ID CHAR(22),
    PRIMARY KEY (UP_Playlist_ID)
);

-- PODCAST_GENRE
CREATE TABLE PODCAST_GENRE (
    Podcast_ID CHAR(22),
    Genre VARCHAR(255),
    PRIMARY KEY (Podcast_ID, Genre)
);

-- PODCAST
CREATE TABLE PODCAST (
    Podcast_ID CHAR(22),
    Name VARCHAR(255),
    Description LONGTEXT,
    P_User_ID CHAR(22),
    TimeHosted TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    P_CC_ID CHAR(22),
    PRIMARY KEY (Podcast_ID)
);

-- EPISODE
CREATE TABLE EPISODE (
    Episode_ID CHAR(22),
    EP_Podcast_ID CHAR(22),
    Name VARCHAR(255),
    Description mediumtext,
    Duration INT,
    Date_ DATETIME,
    EP_Content_ID CHAR(22),
    PRIMARY KEY (Episode_ID, EP_Podcast_ID)
);

-- EPISODE_GENRE
CREATE TABLE EPISODE_GENRE(
    EG_Episode_ID CHAR(22),
    EG_Episode_Podcast_ID CHAR(22),
    Genre VARCHAR(255),
    PRIMARY KEY (EG_Episode_ID, EG_Episode_Podcast_ID, Genre)
);

-- USER
CREATE TABLE USERS(
    User_ID CHAR(22),
    Email VARCHAR(255),
    Name VARCHAR(70),
    Country VARCHAR(22),
    Photo VARCHAR(255),
    -- url of the photo
    username CHAR(22),
    passwordHash BINARY(64),
    U_CC_ID CHAR(22),
    PRIMARY KEY (User_ID)
);

-- ADMIN
CREATE TABLE ADMIN (
    Admin_ID CHAR(22),
    TimeStart TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    TimeEnd TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Cost DECIMAL(10, 2),
    PRIMARY KEY (Admin_ID)
);

-- LIKE
CREATE TABLE USERS_LIKE_CONTENT (
    L_Content_ID CHAR(22),
    L_User_ID CHAR(22),
    PRIMARY KEY (L_Content_ID, L_User_ID)
);

-- FOLLOW
CREATE TABLE USERS_FOLLOW_CONTENT_CREATOR (
    F_CC_ID CHAR(22),
    F_User_ID CHAR(22),
    PRIMARY KEY (F_CC_ID, F_User_ID)
);

-- CONTENT -- Duong
CREATE TABLE CONTENT (
    Content_ID CHAR(22) PRIMARY KEY
);

-- CONTENT_CREATOR -- Duong
CREATE TABLE CONTENT_CREATOR (
    CC_ID CHAR(22) PRIMARY KEY
);

-- ARTIST -- Duong
CREATE TABLE ARTIST (
    Artist_ID CHAR(22) PRIMARY KEY,
    Name VARCHAR(70) NOT NULL,
    Year YEAR,
    A_CC_ID CHAR(22)
);

-- PUBLISH -- Duong
CREATE TABLE PUBLISH (
    P_Artist_ID CHAR(22),
    P_Release_ID CHAR(22),
    PRIMARY KEY (P_Artist_ID, P_Release_ID)
);

-- RELEASE -- Duong
CREATE TABLE RELEASES (
    Release_ID CHAR(22) PRIMARY KEY,
    ReleaseDate DATETIME,
    Photo VARCHAR(255),
    -- storing the img's url
    Type ENUM('Single', 'Album', 'EP') NOT NULL,
    Title VARCHAR(255),
    Description TEXT,
    R_Content_ID CHAR(22)
);

-- RELEASE_HAVE_TRACK
CREATE TABLE RELEASES_HAVE_TRACK (
    RHT_Track_ID CHAR(22),
    RHT_Release_ID CHAR(22),
    PRIMARY KEY (RHT_Track_ID, RHT_Release_ID)
);

-- PLAYBACK_HAVE_TRACK -- Duong quá
CREATE TABLE PLAYBACK_HAVE_TRACK (
    PHT_Track_ID CHAR(22),
    PHT_Playback_ID CHAR(22),
    Orders INT,
    PRIMARY KEY (PHT_Track_ID, PHT_Playback_ID)
);

-- IN
CREATE TABLE TRACK_IN_PLAYLIST (
    I_Track_ID CHAR(22),
    I_Playlist_ID CHAR(22),
    Orders INT,
    TimeAdded TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (I_Track_ID, I_Playlist_ID)
);

-- PLAYLIST
CREATE TABLE PLAYLIST(
    Playlist_ID CHAR(22) PRIMARY KEY,
    Name VARCHAR(70),
    Photo VARCHAR(255),
    isPrivate BIT,
    PL_Content_ID CHAR(22)
);

-- SYSTEM_PLAYLIST
CREATE TABLE SYSTEM_PLAYLIST(SP_Playlist_ID CHAR(22) PRIMARY KEY);

-- CO MANAGE
CREATE TABLE CO_MANAGE(
    CM_User_ID CHAR(22),
    CM_Playlist_ID CHAR(22),
    PRIMARY KEY (CM_User_ID, CM_Playlist_ID)
);

-- PRODUCER
CREATE TABLE PRODUCER(
    Producer_ID CHAR(22) PRIMARY KEY,
    Name VARCHAR(70),
    Address CHAR(255),
    PhoneNumber VARCHAR(15),
    TimeStart TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TimeEnd TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Cost DECIMAL(13)
);

-- RADIO
CREATE TABLE RADIO(
    Name VARCHAR(70),
    Frequency FLOAT(5, 2),
    R_Producer_ID CHAR(22),
    Radio_ID CHAR(22) PRIMARY KEY,
    R_CC_ID CHAR(22)
);

-- RADIO_REGION
CREATE TABLE RADIO_REGION(
    RR_Radio_ID CHAR(22),
    Region VARCHAR(70),
    PRIMARY KEY (RR_Radio_ID, Region)
);

-- RADIO_GENRE
CREATE TABLE RADIO_GENRE(
    RG_Radio_ID CHAR(22),
    Genre VARCHAR(70),
    PRIMARY KEY (RG_Radio_ID, Genre)
);

-- RADIO_SCHEDULE 
CREATE TABLE RADIO_SCHEDULE(
    RS_Radio_ID CHAR(22),
    Date DATETIME DEFAULT CURRENT_TIMESTAMP,
    TimeStart TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TimeEnd TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Languages CHAR(2),
    PRIMARY KEY (RS_Radio_ID, Date, TimeStart, TimeEnd, Languages)
);


-- FK CONSTRAINT --
ALTER TABLE
    COMMUNICATE
ADD
    CONSTRAINT fk_commu_ticket_tid_uid FOREIGN KEY (C_ticket_ID, C_T_User_ID) REFERENCES TICKET(Ticket_ID, T_User_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    COMMUNICATE
ADD
    CONSTRAINT fk_commu_mess_messid FOREIGN KEY (C_Message_ID) REFERENCES MESSAGE(Message_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    COMMUNICATE
ADD 
    CONSTRAINT fk_commu_admin_adminid FOREIGN KEY (C_Admin_ID) REFERENCES ADMIN(Admin_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    `ADMIN`
ADD
    CONSTRAINT fk_admin_user_userid FOREIGN KEY (Admin_ID) REFERENCES USERS(User_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    TICKET
ADD
    CONSTRAINT fk_ticket_user_id FOREIGN KEY (T_User_ID) REFERENCES USERS(User_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    LISTENED_BY
ADD
    CONSTRAINT fk_lb_track_trackid FOREIGN KEY (LB_Track_ID) REFERENCES TRACK(Track_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    LISTENED_BY
ADD
    CONSTRAINT fk_lb_user_userid FOREIGN KEY (LB_User_ID) REFERENCES USERS(User_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    TRACK_GENRE
ADD
    CONSTRAINT fk_trackGenre_track_id FOREIGN KEY (TG_Track_ID) REFERENCES TRACK(Track_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    PLAYBACK_DEVICE
ADD
    CONSTRAINT fk_pd_pb_pbid FOREIGN KEY (PD_Playback_ID) REFERENCES PLAYBACK(Playback_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    PLAYBACK
ADD
    CONSTRAINT fk_pb_user_userid FOREIGN KEY (PB_User_ID) REFERENCES USERS(User_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    TRACK
ADD
    CONSTRAINT fk_track_content_trackid FOREIGN KEY (T_Content_ID) REFERENCES CONTENT(Content_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    USER_PLAYLIST
ADD
    CONSTRAINT fk_userPlaylist_playlist_id FOREIGN KEY (UP_Playlist_ID) REFERENCES PLAYLIST(Playlist_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    USER_PLAYLIST
ADD
    CONSTRAINT fk_userPlaylist_user_id FOREIGN KEY (UP_User_ID) REFERENCES USERS(User_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    PODCAST_GENRE
ADD
    CONSTRAINT fk_podgen_pod_podid FOREIGN KEY (Podcast_ID) REFERENCES PODCAST(Podcast_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    PODCAST
ADD
    CONSTRAINT fk_pod_user_userid FOREIGN KEY (P_User_ID) REFERENCES USERS(User_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    PODCAST
ADD
    CONSTRAINT fk_pod_cc_ccid FOREIGN KEY (P_CC_ID) REFERENCES CONTENT_CREATOR(CC_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    EPISODE
ADD
    CONSTRAINT fk_episode_podcast_podcastid FOREIGN KEY (EP_Podcast_ID) REFERENCES PODCAST(Podcast_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    EPISODE
ADD
    CONSTRAINT fk_episode_podcast_contentID FOREIGN KEY (EP_Content_ID) REFERENCES CONTENT(Content_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    EPISODE_GENRE
ADD
    CONSTRAINT fk_eg_episode_episodeid FOREIGN KEY (EG_Episode_ID) REFERENCES EPISODE(Episode_ID) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE
    EPISODE_GENRE
ADD
    CONSTRAINT fk_eg_episode_podcastid FOREIGN KEY (EG_Episode_Podcast_ID) REFERENCES EPISODE(EP_Podcast_ID) ON DELETE CASCADE ON UPDATE CASCADE;
    

ALTER TABLE
    USERS
ADD
    CONSTRAINT fk_user_contentCreator_id FOREIGN KEY (U_CC_ID) REFERENCES CONTENT_CREATOR(CC_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    USERS_LIKE_CONTENT
ADD
    CONSTRAINT fk_like_user_id FOREIGN KEY (L_User_ID) REFERENCES USERS(User_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    USERS_LIKE_CONTENT
ADD
    CONSTRAINT fk_like_content_id FOREIGN KEY (L_Content_ID) REFERENCES CONTENT(Content_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    USERS_FOLLOW_CONTENT_CREATOR
ADD
    CONSTRAINT fk_follow_user_userid FOREIGN KEY (F_User_ID) REFERENCES USERS(User_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    USERS_FOLLOW_CONTENT_CREATOR
ADD
    CONSTRAINT fk_follow_cc_ccid FOREIGN KEY (F_CC_ID) REFERENCES CONTENT_CREATOR(CC_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    ARTIST
ADD
    CONSTRAINT fk_artist_user_artid FOREIGN KEY (Artist_ID) REFERENCES USERS(User_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    ARTIST
ADD
    CONSTRAINT fk_artist_cc_ccid FOREIGN KEY (A_CC_ID) REFERENCES CONTENT_CREATOR(CC_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    PUBLISH
ADD
    CONSTRAINT fk_pub_artist_artid FOREIGN KEY (P_Artist_ID) REFERENCES ARTIST(Artist_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    PUBLISH
ADD
    CONSTRAINT fk_pub_rel_relid FOREIGN KEY (P_Release_ID) REFERENCES RELEASES(Release_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    RELEASES
ADD
    CONSTRAINT fk_rel_content_contid FOREIGN KEY (R_Content_ID) REFERENCES CONTENT(Content_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    RELEASES_HAVE_TRACK
ADD
    CONSTRAINT fk_releaseHaveTrack_track_id FOREIGN KEY (RHT_Track_ID) REFERENCES TRACK(Track_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    RELEASES_HAVE_TRACK
ADD
    CONSTRAINT fk_releaseHaveTrack_release_id FOREIGN KEY (RHT_Release_ID) REFERENCES RELEASES(Release_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    PLAYBACK_HAVE_TRACK
ADD
    CONSTRAINT ft_pht_track_trackid FOREIGN KEY (PHT_Track_ID) REFERENCES TRACK(Track_ID) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE
    PLAYBACK_HAVE_TRACK
ADD
    CONSTRAINT ft_pht_plb_plbid FOREIGN KEY (PHT_Playback_ID) REFERENCES PLAYBACK(Playback_ID) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE
    TRACK_IN_PLAYLIST
ADD
    CONSTRAINT fk_in_track_trackid FOREIGN KEY (I_Track_ID) REFERENCES TRACK(Track_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    TRACK_IN_PLAYLIST
ADD
    CONSTRAINT fk_in_playlist_playlistid FOREIGN KEY (I_Playlist_ID) REFERENCES PLAYLIST(Playlist_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    PLAYLIST
ADD
    CONSTRAINT fk_pl_content_id_content_id FOREIGN KEY (PL_Content_ID) REFERENCES CONTENT(Content_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    SYSTEM_PLAYLIST
ADD
    CONSTRAINT fk_sp_playlist_id_playlist_id FOREIGN KEY (SP_Playlist_ID) REFERENCES PLAYLIST(Playlist_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    CO_MANAGE
ADD
    CONSTRAINT fk_cm_user_id_user_id FOREIGN KEY (CM_User_ID) REFERENCES USERS(User_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    CO_MANAGE
ADD
    CONSTRAINT fk_cm_playlist_id_playlist_id FOREIGN KEY (CM_Playlist_ID) REFERENCES PLAYLIST(Playlist_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    RADIO
ADD
    CONSTRAINT fk_r_producer_id_producer_id FOREIGN KEY (R_Producer_ID) REFERENCES PRODUCER(Producer_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    RADIO
ADD
    CONSTRAINT fk_r_cc_id_cc_id FOREIGN KEY (R_CC_ID) REFERENCES CONTENT_CREATOR(CC_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    RADIO_REGION
ADD
    CONSTRAINT fk_rr_radio_id_radio_id FOREIGN KEY (RR_Radio_ID) REFERENCES RADIO(Radio_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    RADIO_GENRE
ADD
    CONSTRAINT fk_rg_radio_id_radio_id FOREIGN KEY (RG_Radio_ID) REFERENCES RADIO(Radio_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    RADIO_SCHEDULE
ADD
    CONSTRAINT fk_rs_radio_id_radio_id FOREIGN KEY (RS_Radio_ID) REFERENCES RADIO(Radio_ID) ON DELETE CASCADE ON UPDATE CASCADE;

-- END FK CONSTRAINT --


-- CONTENT
INSERT INTO CONTENT (Content_ID) VALUES 
										-- PLAYLIST
										('bg7XJJj7JnHSsG3A7xcle6'), -- Playlist Ultimate 80s
										('8f9jTiSmWA06hCpOPPer4C'), -- Playlist Ultimate 90s
      							('xh7Ohfrb1vZeKnBROr3YNv'), -- Playlist Best Pop Hits 2000s
      							('deN10gGj0jgWjAAyh5Hndu'), -- Playlist Best Pop Hits 2010s
      							('Aozj4bZ1wsr7RxGLZW6o5V'),
									  ('9XueJAm3GQ5EKGCKg5hGOp'),
									  ('X9eaPDN6T2Kxg6b7A154en'),
									  ('xwIoqDKETTw8tcJYXib0VH'),
									  ('0OLUVluFlFg1a7U1IcItxh'),
									  ('ZXdzM5DAIjmpNQPzmAY6VP'),
									  ('qdrNPWd11uKUXCxmuwcZzT'),
      							-- EPISODE
      							('ujuqpuzvh3xa7NqNlhEZo6'),
      							('SbyWr9GGIrLbBz9W4ctL6h'),
      							('D7w2910SQnrGlg2tEyLRGL'),
      							('QQZRMwJnf1eYZfz4iqlLCE'),
      							('sIHoFP40eCTduQgZasa0nT'),
      							('G9wYlmJQpeDce1lvzKeR4i'),
      							('A39Cn8jlFuxblLrCwMCs3U'),
                    -- RELEASE
										('oTgyiP7HeMPm3qcXTvzbEs'),
                    ('RkW0pQE4LJavgLhMve2TCD'),
                    ('vhOrnlxprWwaiikQyb73sH'),
                    ('WDSXgn2qUA8xRGsbGp2QEu'),
                    ('3wuPm1x9xwMMEj8AtLW4M1'),
                    ('MOwZwLukreCU02jmXvKZia'),
                    ('MlBUYVPWS9xuMQUC8EaNBr'),
                    ('NueHjf2LbSEmnwfyCjDwSA'),
                    ('sCUK1BaRoI7Jxj38pqWC4k'),
                    ('OJ1SNO6pBDRmFzu9IlU0Cx'),
                    ('m0d1OZcIWQuOo2zLNZ0pPi'),
                    ('lmwSs3splnyRQe0BCz4liX'),
                    ('Pp9gdWYuYELdZ0CvXw4B1U'),
                    ('3K45Ws3E1gf8aSAlkDMEQm'),
                    ('78kZugVYyazWrBAGvqYWnq'),
                    ('o5YM7fXgdrfYp8LPN9gXae'),
                    ('xxP1hQRDO4r5DrzzXtLiyB'),
                    ('EO1vSYOl17UTxmFrjPq0Fd'),
                    ('eQVQqcQzD8pccQuwhvxUTF'),
                    ('eqoKO58zH6tFlwNHMRkTnm'),
                    ('garKCQTXihOe9ZESYBIXfp'),
                    ('EIa0sHOwpS0584x4SKAwqg'),
                    ('dvr3N8Kut4nf0EY7dn0Ggt'),
                    ('Mry9mhOPaBV5d0yI6TLCM8'),
                    ('8o3NpuDqo7vC5sV1DXtd8Q'),
                    ('PljlcISoEy6S7WBWAN6Otk'),
                    ('V1gJTIxBsMJOQHa510TBcV'),
                    ('EllmIpJ2uDHIc0MiCgeuZu'),
                    ('2283o2DKsZCXPyI8ESPe8l'),
                    ('jH8cOpFaXFLYUe13P814wi'),
                    ('ndZUE1wJYNyIf42U6BV3fm'),
                    ('O3XMAsOXCMWYC8Zaoi4i1B'),
                    ('Bm8ZpIFSFXsaK94KPbhTBn'),
                    ('PrmUN9tndayveIBhvZ3P33'),
                    ('wb7QnfbmYZU3NiPQbOvvow'),
                    ('RFOgEQIZNAjF6I6hFG67oh'),
                    ('lfed74t3Roq9MDXThKevg1'),
                    ('RZb7OrvMGsC7OIU8qpIHkl'),
                    ('3W8DUMpqWRRStwIhtNzdrE'),
                    ('2pfOx9YpbF7g8TQn17Oda8'),
                    ('Rf0NrERTRqWqbB4IxnssNC'),
                    ('MgulGFGqAbut2STl1EbMnP'),
                    ('5FNzXKEsG86Ks2khi1FoBV'),
                    ('ynXrqbRLa48MvU4bm98viS'),
                    ('R8d5CnPy8J7p7fIEaV0Gyr'),
                    ('zZBXlyL1TAvudXgSRecl4E'),
                    ('jTl1LQhSYKmplWZP5sM4VV'),
                    ('c8eq6esIHg8KX7tKMdvS6i'),
                    ('e4uxIZE6Rcdq9HS8VCL77M'),
                    ('HpWJ4fBYLgPNmka1cXWVTJ'),
                    ('nk49vL5vPUCxCYTbtRgCpg'),
                    ('MWRBRLH9Q2AdMbjWAHiFtN'),
                    ('TEClMprWK3Ya72Ngqg8c4O'),
                    -- TRACK
                    ('lMTdMcLWi59pYsnfbQ32nK'),
                    ('d6rHSjCQkdczeGlr7okHWZ'),
                    ('W2ExxF9KOflkJEgHrXmjM3'),
                    ('RxvfsbvqkJhlp0Frp4AHMG'),
                    ('2SiSFVulMWzsbNMtY10aDT'),
                    ('mbxefgrKTWiF2hU6xBg7zh'),
                    ('6gEcEngDztjChqPqClaKR4'),
                    ('J5Ln7Qn352TszKuiwXXMG5'),
                    ('pieCXOMz9P245V7B7fY8bP'),
                    ('AwWBv4fs33OvIJRgPngWpp'),
                    ('DYrtTKx9ZHf7cYtag7ixuk'),
                    ('MWC7WSXzDxpD21hEtkBX9g'),
                    ('EN25yQrZiSCBIwnhcBZTHi'),
                    ('Je90WNRwJBDkifIQT1ozzs'),
                    ('AjXbvXbl6995QScWoJTrYL'),
                    ('VmheiYbfszsVqqe4e93yO2'),
                    ('RsoCZHxJDz3yhXwgwfWB7p'),
                    ('b87l5PX6rhvkIDB87WaC6r'),
                    ('ike8ER6bfURaZQiSkLGcHA'),
                    ('C8EQZpiQe8rCvdDSYAeylJ'),
                    ('WfPZkiNPUKSc82Tpqcm3Gx'),
                    ('symf6ji1wdWSBeZ6kagLmP'),
                    ('aVcNQcYqtHd6aclke74pso'),
                    ('5ZWidMVpQ2XkkCaIda9692'),
                    ('PvXA8i2UT8KLmfjHpRrDWB'),
                    ('yfls3CeNXoQKWDyyPbzhjN'),
                    ('4i4oE8LbPDHWjX6GvLh79N'),
                    ('T74pxTWBeNAmsclG19gLin'),
                    ('IgossTIH4NvAS5554B8yOa'),
                    ('dTrhIK3NS5A5w4anlv6mu0'),
                    ('InAiwDLyAFT0NJhS217Jo5'),
                    ('5ULDaGEZa96d2J9CxQ7Weg'),
                    ('RSIyHBPXPbl9oywaaVZgoR'),
                    ('N1ZEVKcx2wKz8QdH5iQ6h7'),
                    ('FBhUvWQ9ObHP9VLQ8UyX1L'),
                    ('DVUOpDS4zsCC2UAkGCwYGq'),
                    ('bLJGbHusegKOPdtqhumDYN'),
                    ('7Za2H5e4TmMazRlXQujHpI'),
                    ('WFggoqQAHmMrwi4X0dgrq4'),
                    ('5BDCTGQDBG9dQXLNl8RObC'),
                    ('RJQeSKfYgthLMo7eRwb6A6'),
                    ('3zfambfCO39TJ3hB3k9CyJ'),
                    ('mvGPxUshaB7LkUlQEGQH8Y');
      
-- CONTENT_CREATOR
INSERT INTO CONTENT_CREATOR (CC_ID) VALUES 
														-- ARTIST
														('p4rbkjxsF536dppiXBDWgh'),
                            ('yRDo5m8QOsZ3RhTXFJasgy'),
                            ('YNPObzYfMHs7uSISGPz8k9'),
                            ('bG95wr8CWfX9GMWfbPmgot'),
                            ('1PJCgS1TmKJzWAuY6Icamk'),
                            -- RADIO
														('Kx4pLbHhvYH3toNuNpzETJ'),
														('sP3JmsIPwFzqxLfZEqwovv'),                            
														('YwhVDpjwDjB67mZt6wgPEZ'),                            
														('oUyHeE2OQ04UHYBVMzZcFU'),                            
														('OmXx3xCSGBsABIPE8JvtxI'),
														('v1S1D5eaS1injNe0wu5syG'),
                            -- PODCAST
                            ('HtJ9qM6l2XStrcfJV20no2'),
                            ('fQ7znASUc7Zh7AuWpUGb5C'),
                          	-- USER
                            ('BGZTO0z1oFYshTTqZC0bxF'),
                            ('dysB4gH3vbBrIe6FtxP4EK'),
                            ('fHTWhkNO4J1UHF9A9Qsext'),
                            ('w3wTDySMW4xu3hiyPdrDz2'),
                            ('4P9pFP3dlr3kgGdF0gqX7M'),
                            ('2kbrYqc3CdscuBK4LDMNI7'),
                            ('HCczqJsPKsISmoeVn8UW2K'),
                            ('P2Cbsv5fS2mNtDJOx7GhK8'),
                            ('ZUZJUCAvy8eF48a2Jfqjo8'),
                            ('iBl6jtcEUqqkEAZ5Ym8CRy'),
                            ('Wl4EEXzlzxL3Qa3YGwDsTS'),
                            ('zn1FwkId7XTLlGW39WmUOX'),
                            -- ARTIST
														('Fx3OU9LpeFjnhAzdAhIBau'),
                            ('jkJY3uZIyPRNUcyx305wbp'),
                            ('lyGkSeiEI2lsJ7SoaeprLZ'),
                            ('x7p5ec26Gh6Ncm1ovbxNr6'),
                            ('4HhtIkmxJVq3deFSTjjUMM'),
                            -- ADMIN
                            ('WXz40GzhaPKgRGQc9quXHX'),
                            ('cxsSQD63q8puMZbqcmuc13'),
                            ('OlTENUbVwTlHcpgv9yndFM'),
                            ('KabjpWqFP1Lo1bTn9kpEaG'),
                            ('sicvA7vLqc0VTgE8utZTq4'),
                            ('XRKqgVbkPJAtt6UzgMkqnw'),
                            ('Ysp9JfNMsE7EKAzba1t6Cx'),
                            ('8IRQ0svGPCu04ZPJWtdo4U'),
                            ('1lrtZUkPWuh2cAA4S7YWTQ'),
                            ('v8E3bVw0s6opgyFXuau5hv');




-- USER
INSERT INTO USERS 
	VALUES('ihHTsyJMvCAHbs1jIaJ61i', 'nam.nguyen123@hcmut.edu.vn', 			'Nguyen Hoang Nam', 'Vietnam', 'https://picsum.photos/id/0/367/267', 			'nam_nguyen0101', 			'0933797326',				'BGZTO0z1oFYshTTqZC0bxF'),		-- 1
        ('eUByfMoDmM3X9qC7ocArcC', 'ricardojones@gmail.com', 					'Ricardo Jones', 		'Canada', 'https://picsum.photos/id/1/367/267', 			'ricardo1996', 					'ricardojones',			'dysB4gH3vbBrIe6FtxP4EK'),		-- 2
        ('EclNfpBMvxWxyHJkuQeTLe', 'congthanhle0101@gmail.com', 			'Le Cong Thanh', 		'Vietnam', 'https://picsum.photos/id/2/367/267', 			'ghostmatter', 					'abcxyz123456',			'fHTWhkNO4J1UHF9A9Qsext'),		-- 3
        ('zbE5y24hqTKL6lPGvVAmgX', 'theduckgamer@gmail.com', 					'Takeshi Inui', 		'Japan', 'https://picsum.photos/id/3/367/267', 				'theduckgamer', 				'konichwa_123',			'w3wTDySMW4xu3hiyPdrDz2'),		-- 4
        ('ERJqJgPmQYhv3ex35fODJ1', 'duyanhnguyen.bkevent@gmail.com', 	'Nguyen Duy Anh', 	'Vietnam', 'https://picsum.photos/id/4/367/267', 			'duyanhbkevent', 				'duyanhnguyen0101',	'4P9pFP3dlr3kgGdF0gqX7M'),		-- 5
        ('VSacmSRug2jenc6nblThah', 'thesushilover3176@gmail.com', 		'Hou Tengyang', 		'Singapore', 'https://picsum.photos/id/5/367/267', 		'thesushilover', 				'abcsoultions',			'2kbrYqc3CdscuBK4LDMNI7'),		-- 6
        ('GVOZ6cHysyBnq25gZQv5GW', 'toan.tran1010@gmail.com', 				'Tran Cong Toan', 	'Vietnam', 'https://picsum.photos/id/6/367/267', 			'toantranHCMUT', 				'0913464391',				'HCczqJsPKsISmoeVn8UW2K'),		-- 7
        ('KjqlxOkt7vzY8NLzfbNlHu', 'themeatlover_texas@gmail.com', 		'Jimmy Oliver', 		'United States', 'https://picsum.photos/id/7/367/267','jimmylovemeats', 			'jimmyoliver1010',	'P2Cbsv5fS2mNtDJOx7GhK8'),		-- 8
        ('3NKjcPT0mjG2HZtkG0jsF2', 'thegamecreator@ieee.org', 				'Zhao Yachun', 			'Singapore', 'https://picsum.photos/id/8/367/267', 		'zhao_ieee', 						'idontknowthepass', 'ZUZJUCAvy8eF48a2Jfqjo8'),		-- 9
        ('8G2oicxUetr7ykVXGetWI2', 'nguyen.tran0806@hcmut.edu.vn', 		'Tran Trong Nguyen','Vietnam', 'https://picsum.photos/id/9/367/267', 			'votaynguyen_binhdinh', 'nguyencek18',			'iBl6jtcEUqqkEAZ5Ym8CRy'),		-- 10
        ('7qSNhvIkhjXc0JmCgyNAKV', 'thepresentwriter@gmail.com', 			'Chi Nguyen, PhD', 	'United States', 'https://picsum.photos/id/10/367/267','thepresentwriter', 		'chinguyen1980',		'Wl4EEXzlzxL3Qa3YGwDsTS'),		-- 11
        ('doT6m44UpIAP7uUBzBOUFQ', 'sunhuynpodcast@gmail.com', 				'Sunhuynh', 				'Vietnam', 'https://picsum.photos/id/11/367/267',			'sunhuynhpodcast', 			'mrs.sonhuynh1990',	'zn1FwkId7XTLlGW39WmUOX'),		-- 12
        
        -- artist
        ('J0GJdWAg8AthBIbHvv3xas', 'akonproj@gmail.com', 				'Akon', 				'United States', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Akon_in_July_2015_%28cropped%29.jpg/220px-Akon_in_July_2015_%28cropped%29.jpg',						'akonSpotify', 	'abcxyz69420',				'Fx3OU9LpeFjnhAzdAhIBau'),		-- 12
        ('O8s8XBbJVo1WVGbeiNNLhk', 'bgay@gmail.com', 				'B-Ray', 				'Vietnam', 'https://file.tinnhac.com/resize/600x-/2019/06/15/20190615085415-9238.jpg',																																										'bgay4luv', 		'bgay69420',					'jkJY3uZIyPRNUcyx305wbp'),		-- 12
        ('eHm5RLeDCfJqOzhBTGTtsu', 'cardib@gmail.com', 				'Cardi B', 				'United States', 'https://image.thanhnien.vn/768/uploaded/ngocthanh/2019_09_30/cardi-b-696x464_fydi.jpg',																															'cardicardi', 	'cardilac',						'lyGkSeiEI2lsJ7SoaeprLZ'),		-- 12
        ('c5v3CxylcyjlbrlU9iquab', 'dre@gmail.com', 				'Dr. Dre', 				'United States', 'https://upload.wikimedia.org/wikipedia/commons/d/de/Dr._Dre_in_2011.jpg',																																							'dre', 					'dredredre',					'x7p5ec26Gh6Ncm1ovbxNr6'),		-- 12
        ('mYwdNhHknyglMfApzuHafe', 'slimshady@gmail.com', 				'Eminem', 				'United States', 'https://www.biography.com/.image/t_share/MTQ3NjM5MTEzMTc5MjEwODI2/eminem_photo_by_dave_j_hogan_getty_images_entertainment_getty_187596325.jpg',	'marshalmathers','cleaningthecloset',	'4HhtIkmxJVq3deFSTjjUMM'),		-- 12

				-- admin
				('hI4YTRnJhW7bxSoZi8X4iz', 'baga@gmail.com', 		'Phan Tan Trung', 		'Vietnam', 'https://static2.yan.vn/YanNews/2167221/202011/thay-giao-ba-la-ai-tieu-su-su-nghiep-doi-tu-cua-thay-giao-ba-4011fed7-22176437.png', 		'thaygiaoba', 				'defsolution',			'WXz40GzhaPKgRGQc9quXHX'),		-- 6
        ('PQ69RdEJO49ZHb5tpctpOz', 'mai.thuy@gmail.com', 				'Mai Kim Thuy', 	'Vietnam', 'https://channel.mediacdn.vn/thumb_w/640/2020/3/1/photo-1-1583068240008620157505.jpg', 			'maithuy', 				'666',				'cxsSQD63q8puMZbqcmuc13'),		-- 7
        ('tH6NcFBhCD6ojFct6IDiuA', 'damn@gmail.com', 		'Dam Vinh Hung', 		'United States', 'https://nld.mediacdn.vn/2021/1/29/dam-vinh-hung-xuc-dong-ke-ve-moi-tinh-dau-voi-ban-gai-da-mat-1571402980017846693901-16118908461411753056708.jpg','mrdamn', 			'damnvinhbiet',	'OlTENUbVwTlHcpgv9yndFM'),		-- 8
        ('nkCiJ3UO9kP7699CcQb61S', 'simple@ieee.org', 				'Oleksandr Olegovich Kostyliev ', 			'Russia', 'https://static-prod.weplay.tv/users/avatar/user_283178_735ea54c0236704167d4b076a5f430ff.434648-DAB79A-9CA4AE.png','s1mple','baitruyeunuahrinyanhaidoisimple', 'KabjpWqFP1Lo1bTn9kpEaG'),		-- 9
        ('1ri8xydVrZYCAbBT5t9I5v', 'miracle@gmail.com.vn', 		'Amer al-Barkawi ','Jordan', 'https://static.wikia.nocookie.net/dota2_gamepedia/images/9/98/Miracle_EPICENTER_2017.jpg', 			'miracle-', 'anhtoi',			'sicvA7vLqc0VTgE8utZTq4'),		-- 10
        ('NoBvwP2a5mkEqPbWXp2ibu', 'kamenriderryuuga@gmail.com', 			'Shinji Kido', 	'Japan', 'https://static.wikia.nocookie.net/kamenrider/images/3/32/Ryuga_in_Episode_Yellow.png','ryuuga', 		'overdrive',		'XRKqgVbkPJAtt6UzgMkqnw'),		-- 11
        ('T7ucbH5DbsiwYMTh1HpJbP', 'supremeleader@gmail.com', 				'Kuro Salehi Takhasomi', 				'German', 'https://static.wikia.nocookie.net/dota2_gamepedia/images/3/31/KuroKy.jpg',			'kuroky', 			'quoctruong',	'Ysp9JfNMsE7EKAzba1t6Cx'),		-- 12
        ('EONz3uQAB8ivUODSFFtgHT', 'theviolonist@hcmut.edu.vn', 		'Kaori Miyazono','Japan', 'https://i.pinimg.com/originals/a5/d4/7d/a5d47ddf4e91f0d2db4db417e3d2e57c.jpg', 			'april_lie', 'kouseiarima',			'8IRQ0svGPCu04ZPJWtdo4U'),		-- 10
        ('TJVmQ6pKYTr4hplcO19kfb', 'thenutcracker@gmail.com', 			'Eimi Fukada', 	'Japan', 'https://i.vietgiaitri.com/2021/8/30/eimi-fukada-tim-nguoi-song-thu-khien-fan-nam-nao-loan-thi-nhau-ung-tuyen-127-5995202.jpg','eimi', 		'nonnn4u',		'1lrtZUkPWuh2cAA4S7YWTQ'),		-- 11
        ('ZGhPAC1ycrHYnlrNhdbKHd', 'thewildgunner@gmail.com', 				'Powder', 				'Zaun', 'https://cdn.oneesports.gg/cdn-data/2021/11/LeagueofLegends_ArcaneYoungJinxEnemyImagineDragons-1024x576.jpg',			'jinx', 			'vstands4stupid',	'v8E3bVw0s6opgyFXuau5hv');

-- ARTIST
INSERT INTO ARTIST  VALUES('J0GJdWAg8AthBIbHvv3xas', 'Akon', 		2006, 'p4rbkjxsF536dppiXBDWgh'),
                          ('O8s8XBbJVo1WVGbeiNNLhk', 'B-Ray', 	2013, 'yRDo5m8QOsZ3RhTXFJasgy'),
                          ('eHm5RLeDCfJqOzhBTGTtsu', 'Cardi B', 2005, 'YNPObzYfMHs7uSISGPz8k9'),
                          ('c5v3CxylcyjlbrlU9iquab', 'Dr. Dre', 1985, 'bG95wr8CWfX9GMWfbPmgot'),
                          ('mYwdNhHknyglMfApzuHafe', 'Eminem', 	1988, '1PJCgS1TmKJzWAuY6Icamk');

-- ADMIN
INSERT INTO ADMIN
VALUES ('hI4YTRnJhW7bxSoZi8X4iz', '2017-12-16 13:30:16', '2026-12-01 01:46:11', 81445181.35),	-- 1
			 ('PQ69RdEJO49ZHb5tpctpOz', '2013-10-10 14:34:44', '2029-02-19 04:07:32', 17884832.97),	-- 2
       ('tH6NcFBhCD6ojFct6IDiuA', '2002-03-26 00:33:46', '2022-07-09 21:04:38', 83501092.63),	-- 3
       ('nkCiJ3UO9kP7699CcQb61S', '2004-05-24 21:28:48', '2026-12-08 17:48:54', 79252930.45),	-- 4
       ('1ri8xydVrZYCAbBT5t9I5v', '2001-01-11 21:35:46', '2025-11-12 00:35:03', 23628417.59),	-- 5
       ('NoBvwP2a5mkEqPbWXp2ibu', '2006-04-09 13:05:01', '2024-12-03 11:08:20', 77745302.8),	-- 6
       ('T7ucbH5DbsiwYMTh1HpJbP', '2020-01-08 05:04:51', '2022-09-17 03:14:40', 97222295.71),	-- 7
       ('EONz3uQAB8ivUODSFFtgHT', '2008-04-13 06:49:04', '2029-12-17 12:31:26', 27161984.72),	-- 8
       ('TJVmQ6pKYTr4hplcO19kfb', '2011-09-03 19:52:05', '2023-09-19 17:01:06', 67973012.54),	-- 9
       ('ZGhPAC1ycrHYnlrNhdbKHd', '2005-07-08 07:42:20', '2024-10-12 11:56:11', 73633486.64);	-- 10
                            





-- TRACK
-- sao lai co may bai nhac viet dậy, tưởng là phải có release rồi mới có track mà hả
-- o okay minh them sau hehe
INSERT INTO TRACK VALUES('7EGYM3wfXfaJdGLizzStVx', 253, 'Freedom', 'lMTdMcLWi59pYsnfbQ32nK'),
												('xRbSNEemd79wUXjhpdtnNf', 240, 'Right Now (Na Na Na)', 'd6rHSjCQkdczeGlr7okHWZ'),
                        ('pk0c2vFeDEyqp1FMAWqJZO', 231, 'Be with you', 'W2ExxF9KOflkJEgHrXmjM3'),
                        ('24AdSae2NKNNhYWJvU13ah', 237, 'Troublemaker', 'RxvfsbvqkJhlp0Frp4AHMG'),
                        ('FQAYrkkreqvKYgwg1SLTKR', 263, 'Im so paid', '2SiSFVulMWzsbNMtY10aDT');



INSERT INTO TRACK VALUES('6adDYqIKXOZ8NZN7Ewh0VU', 235, 'Locked Up', 'mbxefgrKTWiF2hU6xBg7zh'),
                        ('rUUOR6IWkri1C6wbg1GcAC', 235, 'Lonely', '6gEcEngDztjChqPqClaKR4'),
                        ('MV5UFAfmYs9JVM2RgWq9im', 202, 'Trouble Nobody', 'J5Ln7Qn352TszKuiwXXMG5'),
                        ('ACJYUDuzYtMCFlPUGXGpoi', 256, 'Journey', 'pieCXOMz9P245V7B7fY8bP'),
                        ('fguB6VGCjK43FLF8hYhSw8', 216, 'Pot Of Gold', 'AwWBv4fs33OvIJRgPngWpp');
                        
INSERT INTO TRACK VALUES('N63VmjFlHl5ddaINdF7kdL', 212, 'Smack That', 'DYrtTKx9ZHf7cYtag7ixuk');

INSERT INTO TRACK VALUES('niOZ74IbExeZnBzS1ugSMb', 226, 'Ân xá', 'MWC7WSXzDxpD21hEtkBX9g'),
                        ('qFQfiAc9w9NP5RrxbIHpyD', 296, 'Ân cần', 'EN25yQrZiSCBIwnhcBZTHi'),
                        ('xGEF8oT2mrGODVOzY6ZgjN', 277, 'B.S.N.L 2', 'Je90WNRwJBDkifIQT1ozzs'),
                        ('YtZUvwmzzrxEUC6wnjln1k', 216, 'B.S.N.L 3', 'AjXbvXbl6995QScWoJTrYL'),
                        ('MrdQ5vmGQYM7PsqOx1hXuM', 254, 'Cao Ốc 20', 'VmheiYbfszsVqqe4e93yO2');
                           
INSERT INTO TRACK VALUES('098CJ8SFqACjBbZe07IcrW', 189, 'Do For Love', 'RsoCZHxJDz3yhXwgwfWB7p'),
                        ('VCR5iCzBtdQ6ZZfZ7MNNH5', 198, 'Đừng Đổ Lỗi Bọn Trẻ', 'b87l5PX6rhvkIDB87WaC6r'),
                        ('omzBZOkVDCUwGE07w1oftu', 169, 'Nào Có Sẽ Trả', 'ike8ER6bfURaZQiSkLGcHA'),
                        ('pCJ9gtVBMeB164CUrgMdSm', 153, 'Thua Cuộc', 'C8EQZpiQe8rCvdDSYAeylJ'),
                        ('AHs4jAWhBNtGpR6Mt9kPQz', 160, 'Dư Tiền', 'WfPZkiNPUKSc82Tpqcm3Gx');
                        
INSERT INTO TRACK VALUES('evlbeGWSXhvfGyjRIAvk6T', 231, 'Get Up 10', 'symf6ji1wdWSBeZ6kagLmP'),
                        ('JXsSTKHzeh3l5FMRJTyJhi', 181, 'Bickenhead', 'aVcNQcYqtHd6aclke74pso'),
                        ('zmRK2DT8oaOncKtVSMCYif', 253, 'I Like It', '5ZWidMVpQ2XkkCaIda9692'),
                        ('sslY66bNX05BH3gf4F65gl', 188, 'Thru Your Phone', 'PvXA8i2UT8KLmfjHpRrDWB'),
                        ('Xqf72CNN4z8zRHFtWttT0x', 200, 'I Do', 'yfls3CeNXoQKWDyyPbzhjN');



INSERT INTO TRACK VALUES('Ap0gx09VvCwIhbJPxqEWXS', 187, 'WAP', '4i4oE8LbPDHWjX6GvLh79N');


INSERT INTO TRACK VALUES('QAD0w39nHzMMega7YQA9ER', 270, 'Still D.R.E', 'T74pxTWBeNAmsclG19gLin'),
                        ('3boXyfeeTPacABRHEKPqjl', 161, 'The Next Episode', 'IgossTIH4NvAS5554B8yOa'),
                        ('KX8Ajn0lhqiC6ri6pl2kpp', 222, 'Forgot About Dre', 'dTrhIK3NS5A5w4anlv6mu0'),
                        ('QQ3VakBaFDX9es1mbKjlYz', 242, 'Housewife', 'InAiwDLyAFT0NJhS217Jo5'),
                        ('xAjbIwdgXFQjehOQfXi0qu', 304, 'The Message', '5ULDaGEZa96d2J9CxQ7Weg');



INSERT INTO TRACK VALUES('NUaZyOzMHWOm0kanVWBzdI', 297, 'Cleaning Out My Closet', 'RSIyHBPXPbl9oywaaVZgoR'),
                        ('5e2AbG8F3dzfXjASSxrGfx', 290, 'Without Me', 'N1ZEVKcx2wKz8QdH5iQ6h7'),
                        ('jgbVUAAY3KOigMrcke8V68', 339, 'Sing For The Moment', 'FBhUvWQ9ObHP9VLQ8UyX1L'),
                        ('aLQtg994VLNMMDdlXfHElO', 297, 'Till I Collapse', 'DVUOpDS4zsCC2UAkGCwYGq'),
                        ('WH9pkOt0SY0kLF4lKnRGWC', 350, 'Superman', 'bLJGbHusegKOPdtqhumDYN');
 


INSERT INTO TRACK VALUES('PLfibzSzKQfIGZ0ZLP7IfY', 404, 'Stan', '7Za2H5e4TmMazRlXQujHpI'),
                        ('ssgBd0AGjDtdppUX1HrrIc', 284, 'The Real Slim Shady', 'WFggoqQAHmMrwi4X0dgrq4'),
                        ('pts68NvOSC6msRhdK3Rbjs', 218, 'Remember Me', '5BDCTGQDBG9dQXLNl8RObC'),
                        ('JsmKuKOWeItNHzz4DxIKwW', 319, 'Criminal', 'RJQeSKfYgthLMo7eRwb6A6'),
                        ('rZ0lZSrhzrobRgKh1bwC6M', 290, 'The Way I Am', '3zfambfCO39TJ3hB3k9CyJ');

INSERT INTO TRACK VALUES('qMpVMeDq0zZ1PMBsIivqtf', 320, 'Lose Yourself', 'mvGPxUshaB7LkUlQEGQH8Y');


                      
-- RELEASE
INSERT INTO RELEASES  VALUES('wBQ09nI4xtWYkIdEsCSByW', '2008-12-01', 'https://upload.wikimedia.org/wikipedia/en/0/0a/AkonFreedom.PNG','Album', 'Freedom','With Freedom Akon delivers a set of songs so accessible they work well whether played at top volume in a night club or as background music in a doctor’s office. The disarmingly simple music-box melodies of “Sunny Day” and “Be With You” continue the tradition started by “Don’t Matter.” “Holla Holla” folds his voice and protégé T-Pain’s voice into a single entity, while the raspy rhyming of Lil Wayne and Young Jeezy forms a perfect complement to Akon’s innocence on “I’m So Paid.”','oTgyiP7HeMPm3qcXTvzbEs'),
														('7e1NyPM2GFFlCWmFPdwfjA', '2004-06-29', 'https://m.media-amazon.com/images/I/61SNoPRgTUL._SS500_.jpg','Album', 'Trouble (Deluxe Edition)','Trouble is the debut album by American singer Akon, which contains his greatest hit ""Lonely','RkW0pQE4LJavgLhMve2TCD'),
                      			('9ykErkkNkKZFr4RC7W4p1p', '2006-09-26', 'https://upload.wikimedia.org/wikipedia/en/6/63/Akon_ft._eminem_smack_that.jpg', 'Single', 'Smack That','"Smack That" is a song by American singer and songwriter Akon from his second studio album Konvicted (2006). The song, which features a guest appearance from American rapper Eminem, was written by Akon, Mike Strange, Luis Resto and Eminem, with the latter also helming the song production','vhOrnlxprWwaiikQyb73sH'),
                      			('DFvm49XhHsJvNo3TptwJyJ', '2008-12-08', 'https://avatar-ex-swe.nixcdn.com/song/2018/06/06/f/9/c/5/1528271633900_640.jpg', 'EP', 'Right Now (Na Na Na)','Good Ep, recommend 10/10','WDSXgn2qUA8xRGsbGp2QEu'),
                      			('WMmpFHrW2DxmleP2F8NisX', '2004-04-05', 'https://upload.wikimedia.org/wikipedia/en/8/87/Akon_-_Locked_Up_-_CD_cover.jpg', 'Single', 'Locked Up','First track from the ledendary album Trouble','3wuPm1x9xwMMEj8AtLW4M1'),
                            ('TsF5BS6cs6zgQSbfiOUHnS', '2005-02-22', 'https://upload.wikimedia.org/wikipedia/en/3/35/Akon-Lonely.jpg', 'Single', 'Lonely','Best single of Akon, part of the album Trouble released earlier','MOwZwLukreCU02jmXvKZia'),
                            
                            ('5BPHvW20j1sOf3KQOTBJH4', '2008-12-01', 'https://upload.wikimedia.org/wikipedia/en/0/0a/AkonFreedom.PNG', 'Single', 'Freedom', 'I didnt about this song though', 'MlBUYVPWS9xuMQUC8EaNBr'),
                            ('sVaPVAH1v3SDrnv1sFEfMD', '2008-09-23', 'https://avatar-ex-swe.nixcdn.com/song/2018/06/06/f/9/c/5/1528271633900_640.jpg', 'Single', 'Right Now (Na Na Na)', 'Haiz, i hate writing description', 'NueHjf2LbSEmnwfyCjDwSA'),
                            ('g3isH9CIiiuSvpZu0tsmu7', '2008-12-02', 'https://i0.wp.com/hitzop.com/wp-content/uploads/2021/09/images-54-2.jpeg?resize=500%2C400&ssl=1', 'Single', 'Be with you', 'Random text inserted', 'sCUK1BaRoI7Jxj38pqWC4k'),
                            ('vC12WcsYPh2g4uPYZvX0jX', '2008-11-29', 'https://upload.wikimedia.org/wikipedia/en/d/dd/Troublemaker_Akon.jpg', 'Single', 'Troublemaker', 'The quick brown fox ...', 'OJ1SNO6pBDRmFzu9IlU0Cx'),
                            ('dRtxPk0kXMRgVjUSs4uOkI', '2008-10-04', 'https://upload.wikimedia.org/wikipedia/en/b/b9/Im_So_Paid_-_Official_Single_Cover.jpg', 'Single', 'Im so paid', 'Standard description', 'm0d1OZcIWQuOo2zLNZ0pPi'),
                            ('ZfrSsaGA7wlA9305wjiXyG', '2003-05-15', 'https://m.media-amazon.com/images/I/61ZeuXTUk7L._SY355_.jpg', 'Single', 'Trouble Nobody', 'This text is really long, believe me', 'lmwSs3splnyRQe0BCz4liX'),
                            ('OkfFUTeLyd8KMPKjnRDVRb', '2004-07-09', 'https://m.media-amazon.com/images/I/61CFzRquXEL._SS500_.jpg', 'Single', 'Journey', 'Can you pretend this is a really helpful description, pretty please', 'Pp9gdWYuYELdZ0CvXw4B1U'),
                            ('hv91fERq67eWJD0yuGWceU', '2003-11-22', 'https://upload.wikimedia.org/wikipedia/en/1/13/Pot_of_Gold_%28Akon_song%29.jpg', 'Single', 'Pot Of Gold', 'My boss wants a 255 character description.', '3K45Ws3E1gf8aSAlkDMEQm');

        
        
INSERT INTO RELEASES  VALUES('oBLIWfec9jmjdbVrKqiBsr', '2020-04-27', 'https://i.scdn.co/image/ab67616d0000b273cefccd27f18dec39861aece6','Album', 'B Ray B Ray Collection, Vol. 2','Tổng hợp các hit của B-ray trong năm 2020','78kZugVYyazWrBAGvqYWnq'),
														('ibDXMkOdCsz4fJciGOYeCv', '2020-02-21', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpQtZ-osgjaARnVHzzMvf0e8bOcFuhFuxnkGDTlZ0&usqp=CAE&s','Album', 'Loser2Lover','Sản phẩm comback của nam rapper B Ray trong năm 2020, trong album có 2 ca khúc kết hợp cùng Chibi Hoàng Yến và Amee.','o5YM7fXgdrfYp8LPN9gXae'),
                            ('DMqlLuIlPbMSRGRofOHH0C', '2020-02-21', 'https://avatar-ex-swe.nixcdn.com/playlist/2020/02/13/4/1/3/6/1581612119736_500.jpg','Single', 'Làm vì yêu (Do For Love)','1 track trong sản phẩm mới nhất của bray, với ự kết hợp với Amee','xxP1hQRDO4r5DrzzXtLiyB'),
                            
                            ('eaGmU9alZQODttMRexDsvF', '2018-11-16', 'https://i1.sndcdn.com/avatars-000322248281-igrqce-t240x240.jpg', 'Single', 'Ân xá', 'Bray dissin Blacka? Madness.', 'EO1vSYOl17UTxmFrjPq0Fd'),
                            ('TKr9feWIcJTzx7mSidhjrB', '2018-11-20', 'https://i1.sndcdn.com/artworks-wwyHNaQ5dauBUrLh-7Fh9jQ-t500x500.jpg', 'Single', 'Ân cần', 'Oops, Blacka lost', 'eQVQqcQzD8pccQuwhvxUTF'),
                            ('XBo4gILBMzOdN1ymyg2Y1Z', '2017-02-13', 'https://i1.sndcdn.com/artworks-000207540269-vqchft-t500x500.jpg', 'Single', 'B.S.N.L 2', 'Song good, description bad', 'eqoKO58zH6tFlwNHMRkTnm'),
                            ('iPG5pPZT8XHXII449IQTAK', '2018-02-16', 'https://i1.sndcdn.com/artworks-000301683351-mxc97x-t500x500.jpg', 'Single', 'B.S.N.L 3', 'Song still good, description still bad', 'garKCQTXihOe9ZESYBIXfp'),
                            ('tlWrdXo2PESdvrHUweUAkB', '2018-06-26', 'https://i1.sndcdn.com/artworks-000556537428-fuinlx-t500x500.jpg', 'Single', 'Cao Ốc 20', 'A kid forced to labor??? Madness', 'EIa0sHOwpS0584x4SKAwqg'),
                            ('Ku1r8wsoDNGzhEzAxK5aj3', '2020-02-29', 'https://images.genius.com/b58e0094f0cfac1b54f36a9cf6d8c3f3.500x500x1.jpg', 'Single', 'Đừng Đổ Lỗi Bọn Trẻ', 'Dont know a bout the song, maybe good, maybe bad, dont know', 'dvr3N8Kut4nf0EY7dn0Ggt'),
                            ('CIWx5Yw4TR1YPt7la7b3Ah', '2020-02-29', 'https://i1.sndcdn.com/artworks-jOEn582cfslGcQCP-SZX4NA-t500x500.jpg', 'Single', 'Nào Có Sẽ Trả', 'long long long description text', 'Mry9mhOPaBV5d0yI6TLCM8'),
                            ('RYjy3crZIgkxkB4boUiJ92', '2020-02-29', 'https://avatar-ex-swe.nixcdn.com/playlist/2020/02/14/c/c/6/f/1581664629346_500.jpg', 'Single', 'Thua Cuộc', 'You expected a description, but it was me, Dio', '8o3NpuDqo7vC5sV1DXtd8Q'),
                            ('UCTNgJvdY26G9qH5mDjBZf', '2020-02-29', 'https://i1.sndcdn.com/artworks-OdzzlrKElm2S5c5l-uOuXkg-t500x500.jpg', 'Single', 'Dư Tiền', 'description loading ...', 'PljlcISoEy6S7WBWAN6Otk');


INSERT INTO RELEASES  VALUES('IF0J2MEdC8oDerZjU8UZ8M', '2018-04-06', 'https://upload.wikimedia.org/wikipedia/vi/thumb/9/92/Cardi_B_-_Invasion_of_Privacy_bia_album.png/220px-Cardi_B_-_Invasion_of_Privacy_bia_album.png','Album', 'Invasion of Privacy','First studio-record album of Cardi B','V1gJTIxBsMJOQHa510TBcV'),
														('QZclRbzWMMbVCXEHVicw0A', '2020-08-07', 'https://upload.wikimedia.org/wikipedia/en/f/f4/Cardi_B_-_WAP_%28feat._Megan_Thee_Stallion%29.png','Single','WAP','Lead single of the upcoming second studio album of Cardi B, WAP','EllmIpJ2uDHIc0MiCgeuZu'),

														('pjw3zTQPSWosU3TAGYaWhI', '2018-04-06', 'https://i1.sndcdn.com/artworks-DYXpF57hI6wj-0-t500x500.jpg', 'Single', 'Get Up 10', 'Get up your lazy @ss, its 10', '2283o2DKsZCXPyI8ESPe8l'),
                            ('I0I7cZuQOVS8dweg3cGKYH', '2018-04-06', 'https://ih1.redbubble.net/image.547744083.2577/fposter,small,wall_texture,product,750x1000.u5.jpg', 'Single', 'Bickenhead', 'D*ckhead', 'jH8cOpFaXFLYUe13P814wi'),
                            ('p5DXwd9pkraHcFgTSD84Eq', '2018-04-06', 'https://upload.wikimedia.org/wikipedia/vi/e/e1/Cardi_B%2C_Bad_Bunny_and_J_Balvin_-_I_Like_It_%28Single_Cover%29.jpg', 'Single', 'I Like It', 'I like it 2 hehe', 'ndZUE1wJYNyIf42U6BV3fm'),
                            ('RIZhaeD88r3lL9dpuZB4fB', '2018-04-06', 'https://i1.sndcdn.com/artworks-000338231397-kr4k28-t500x500.jpg', 'Single', 'Thru Your Phone', 'What the frick is this song about....', 'O3XMAsOXCMWYC8Zaoi4i1B'),
                            ('S12ACwBM5EyaHZbTS3e1g9', '2018-04-06', 'https://i1.sndcdn.com/artworks-2sDJ23M3q7cX-0-t500x500.jpg', 'Single', 'I Do', 'But i dont...', 'Bm8ZpIFSFXsaK94KPbhTBn');
                            

                            
                            
INSERT INTO RELEASES  VALUES('uZrtt7aFY8zCSsxIRKfJrs', '1999-11-16', 'https://img.discogs.com/i3kxhdt6sCu4sGjD4PF406i38ow=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/R-226393-1476317968-2913.jpeg.jpg', 'Album', '2001', 'Signature album of Dr Dre, with the lead single Still D.R.E', 'PrmUN9tndayveIBhvZ3P33'),
														('i3ebru9mHZt8mykTkrxfgw', '1999-11-02', 'https://upload.wikimedia.org/wikipedia/en/4/42/Drdre2.JPG', 'Single', 'Still D.R.E', 'Lead Single of the album 2001', 'wb7QnfbmYZU3NiPQbOvvow'),
                            
                            ('1HM9tDhjrAdfsTJs0klngO', '2000-06-26', 'https://upload.wikimedia.org/wikipedia/en/thumb/2/29/Dre_-_Next_Episode.jpg/220px-Dre_-_Next_Episode.jpg', 'Single', 'The Next Episode','Weed...', 'RFOgEQIZNAjF6I6hFG67oh'),
                            ('TrzksGNV5nyemeE6jgZb0d', '2000-01-29', 'https://upload.wikimedia.org/wikipedia/en/7/73/Dr._Dre_feat._Eminem_-_Forgot_about_Dre.jpeg', 'Single', 'Forgot About Dre', 'i aint forget anything though', 'lfed74t3Roq9MDXThKevg1'),
                            ('LzT63TzNyOUbRnLMhz87nR', '1999-11-16', 'https://lastfm.freetls.fastly.net/i/u/ar0/a2f54205d4024292bc501d30954315bb.jpg', 'Single', 'Housewife', 'wait, dre got a wife, since when...', 'RZb7OrvMGsC7OIU8qpIHkl'),
                            ('VfvvgkL6WCzGkMYIYBGgwg', '1999-11-15', 'https://i1.sndcdn.com/artworks-000219024455-yu0ir7-t500x500.jpg', 'Single', 'The Message', 'this is a message about how we shouldnt make long description', '3W8DUMpqWRRStwIhtNzdrE');
         

         
INSERT INTO RELEASES  VALUES('DsCXkBA0SV4aFz1UM3o136', '2002-05-26', 'https://upload.wikimedia.org/wikipedia/en/3/35/The_Eminem_Show.jpg', 'Album', 'The Eminem Show', 'G.O.A.T', '2pfOx9YpbF7g8TQn17Oda8'),
														('Tpj306uW2VLqiLBWgEnD1p', '2000-05-23', 'https://upload.wikimedia.org/wikipedia/en/a/ae/The_Marshall_Mathers_LP.jpg', 'Album', 'The Marrshall Mathers LP', 'G.O.A.T SSS+', 'Rf0NrERTRqWqbB4IxnssNC'),
                            ('r7aTvk8ox6OTe2CbgINNZm', '2000-11-20', 'https://upload.wikimedia.org/wikipedia/vi/e/e8/Eminem_-_Stan_CD_cover.jpg', 'Single', 'Stan', '"Stan" is a song by American rapper Eminem featuring vocals sampled from the opening lines of British singer Dido song "Thank You".', 'MgulGFGqAbut2STl1EbMnP'),
                            ('mchiVLY34JnrQa4NJCpIjm', '2002-10-28', 'https://upload.wikimedia.org/wikipedia/en/d/d6/Lose_Yourself.jpg', 'Single', 'Lose Yourself', '"Lose Yourself" is a song by American rapper Eminem from the soundtrack to the 2002 motion picture 8 Mile', '5FNzXKEsG86Ks2khi1FoBV'),
                            ('6buydZicCvtELTX754uMYi', '1997-12-10', 'https://upload.wikimedia.org/wikipedia/en/4/4a/Eminem_-_The_Slim_Shady_EP_CD_cover.jpg', 'EP', 'Slim Shady EP', 'Slim Shady EP is the debut extended play by American rapper Eminem, released on December 10, 1997 through the Detroit-based record label Web Entertainment.', 'ynXrqbRLa48MvU4bm98viS'),
                            
                            ('FxcgqG73pwjXx3Ez2PHQT1', '2000-05-23', 'https://upload.wikimedia.org/wikipedia/en/3/35/The_Eminem_Show.jpg', 'Single', 'Cleaning Out My Closet', 'why u hide in there lol', 'R8d5CnPy8J7p7fIEaV0Gyr'),                       
                        		('5JdZmshlCl9r6V8YC5xb7Z', '2000-05-24', 'https://upload.wikimedia.org/wikipedia/en/3/35/The_Eminem_Show.jpg', 'Single', 'Without Me', 'without me 2', 'zZBXlyL1TAvudXgSRecl4E'),
                            ('XCT6tzFuKOUBdUotqPcxsr', '2000-05-25', 'https://upload.wikimedia.org/wikipedia/en/3/35/The_Eminem_Show.jpg', 'Single', 'Sing For The Moment', 'sing sing sing', 'jTl1LQhSYKmplWZP5sM4VV'),
                            ('nRc6SuU62o19ge7EeCCKTn', '2000-05-26', 'https://upload.wikimedia.org/wikipedia/en/3/35/The_Eminem_Show.jpg', 'Single', 'Till I Collapse', 'look at the play look at the move, faker what was that', 'c8eq6esIHg8KX7tKMdvS6i'),
                            ('haT45q1dV4WapH0Tm2p4To', '2000-05-27', 'https://upload.wikimedia.org/wikipedia/en/3/35/The_Eminem_Show.jpg', 'Single', 'Superman', 'look at the sky, it a bird, it is a planve, it is superman', 'e4uxIZE6Rcdq9HS8VCL77M'),
                            ('dK9laJ8onIPf6pfqhboNvX', '2000-05-28', 'https://upload.wikimedia.org/wikipedia/en/3/35/The_Eminem_Show.jpg', 'Single', 'The Real Slim Shady', 'no u aint no real slim shady, i am', 'HpWJ4fBYLgPNmka1cXWVTJ'),
                            ('wdFgVs9ldPZ6jovDkL9UA2', '2000-05-29', 'https://upload.wikimedia.org/wikipedia/en/3/35/The_Eminem_Show.jpg', 'Single', 'Remember Me', 'damn i forgot about u dre', 'nk49vL5vPUCxCYTbtRgCpg'),
                            ('GHqojhh5AtIAKBxPJgjJVs', '2000-05-30', 'https://upload.wikimedia.org/wikipedia/en/3/35/The_Eminem_Show.jpg', 'Single', 'Criminal', 'criminal-chan cant be that cute', 'MWRBRLH9Q2AdMbjWAHiFtN'),
                            ('wKNaRmss7GI1gygp7uE4JZ', '2000-05-23', 'https://upload.wikimedia.org/wikipedia/en/3/35/The_Eminem_Show.jpg', 'Single', 'The Way I Am', 'i am what, i am who ...', 'TEClMprWK3Ya72Ngqg8c4O');



-- PUBLISH
INSERT INTO PUBLISH 	VALUES('J0GJdWAg8AthBIbHvv3xas','wBQ09nI4xtWYkIdEsCSByW'),
                            ('J0GJdWAg8AthBIbHvv3xas','7e1NyPM2GFFlCWmFPdwfjA'),
                            ('J0GJdWAg8AthBIbHvv3xas','9ykErkkNkKZFr4RC7W4p1p'),
                            ('mYwdNhHknyglMfApzuHafe','9ykErkkNkKZFr4RC7W4p1p'),
                            ('J0GJdWAg8AthBIbHvv3xas','DFvm49XhHsJvNo3TptwJyJ'),
                            ('J0GJdWAg8AthBIbHvv3xas','WMmpFHrW2DxmleP2F8NisX'),
                            ('J0GJdWAg8AthBIbHvv3xas','TsF5BS6cs6zgQSbfiOUHnS');
                            
INSERT INTO PUBLISH 	VALUES('J0GJdWAg8AthBIbHvv3xas','5BPHvW20j1sOf3KQOTBJH4'),
														('J0GJdWAg8AthBIbHvv3xas','sVaPVAH1v3SDrnv1sFEfMD'),
                            ('J0GJdWAg8AthBIbHvv3xas','g3isH9CIiiuSvpZu0tsmu7'),
                            ('J0GJdWAg8AthBIbHvv3xas','vC12WcsYPh2g4uPYZvX0jX'),
                            ('J0GJdWAg8AthBIbHvv3xas','dRtxPk0kXMRgVjUSs4uOkI'),
                            ('J0GJdWAg8AthBIbHvv3xas','ZfrSsaGA7wlA9305wjiXyG'),
                            ('J0GJdWAg8AthBIbHvv3xas','OkfFUTeLyd8KMPKjnRDVRb'),
                            ('J0GJdWAg8AthBIbHvv3xas','hv91fERq67eWJD0yuGWceU');
                            
                            
INSERT INTO PUBLISH 	VALUES('O8s8XBbJVo1WVGbeiNNLhk','oBLIWfec9jmjdbVrKqiBsr'),
														('O8s8XBbJVo1WVGbeiNNLhk','ibDXMkOdCsz4fJciGOYeCv'),
                            ('O8s8XBbJVo1WVGbeiNNLhk','DMqlLuIlPbMSRGRofOHH0C');

INSERT INTO PUBLISH		VALUES('O8s8XBbJVo1WVGbeiNNLhk','eaGmU9alZQODttMRexDsvF'),
                            ('O8s8XBbJVo1WVGbeiNNLhk','TKr9feWIcJTzx7mSidhjrB'),
                            ('O8s8XBbJVo1WVGbeiNNLhk','XBo4gILBMzOdN1ymyg2Y1Z'),
                            ('O8s8XBbJVo1WVGbeiNNLhk','iPG5pPZT8XHXII449IQTAK'),
                            ('O8s8XBbJVo1WVGbeiNNLhk','tlWrdXo2PESdvrHUweUAkB'),
                            ('O8s8XBbJVo1WVGbeiNNLhk','Ku1r8wsoDNGzhEzAxK5aj3'),
                            ('O8s8XBbJVo1WVGbeiNNLhk','CIWx5Yw4TR1YPt7la7b3Ah'),
                            ('O8s8XBbJVo1WVGbeiNNLhk','RYjy3crZIgkxkB4boUiJ92'),
                            ('O8s8XBbJVo1WVGbeiNNLhk','UCTNgJvdY26G9qH5mDjBZf');


INSERT INTO PUBLISH 	VALUES('eHm5RLeDCfJqOzhBTGTtsu','IF0J2MEdC8oDerZjU8UZ8M'),
														('eHm5RLeDCfJqOzhBTGTtsu','QZclRbzWMMbVCXEHVicw0A');

INSERT INTO PUBLISH 	VALUES('eHm5RLeDCfJqOzhBTGTtsu','pjw3zTQPSWosU3TAGYaWhI'),
														('eHm5RLeDCfJqOzhBTGTtsu','I0I7cZuQOVS8dweg3cGKYH'),
                            ('eHm5RLeDCfJqOzhBTGTtsu','p5DXwd9pkraHcFgTSD84Eq'),
                            ('eHm5RLeDCfJqOzhBTGTtsu','RIZhaeD88r3lL9dpuZB4fB'),
                            ('eHm5RLeDCfJqOzhBTGTtsu','S12ACwBM5EyaHZbTS3e1g9');
                            
INSERT INTO PUBLISH 	VALUES('c5v3CxylcyjlbrlU9iquab','uZrtt7aFY8zCSsxIRKfJrs'),
														('c5v3CxylcyjlbrlU9iquab','i3ebru9mHZt8mykTkrxfgw');

INSERT INTO PUBLISH 	VALUES('c5v3CxylcyjlbrlU9iquab','1HM9tDhjrAdfsTJs0klngO'),
														('c5v3CxylcyjlbrlU9iquab','TrzksGNV5nyemeE6jgZb0d'),
                            ('c5v3CxylcyjlbrlU9iquab','LzT63TzNyOUbRnLMhz87nR'),
                            ('c5v3CxylcyjlbrlU9iquab','VfvvgkL6WCzGkMYIYBGgwg');
                            
INSERT INTO PUBLISH 	VALUES('mYwdNhHknyglMfApzuHafe','DsCXkBA0SV4aFz1UM3o136'),
														('mYwdNhHknyglMfApzuHafe','Tpj306uW2VLqiLBWgEnD1p'),
                            ('mYwdNhHknyglMfApzuHafe','r7aTvk8ox6OTe2CbgINNZm'),
                            ('mYwdNhHknyglMfApzuHafe','mchiVLY34JnrQa4NJCpIjm'),
                            ('mYwdNhHknyglMfApzuHafe','6buydZicCvtELTX754uMYi');

INSERT INTO PUBLISH 	VALUES('mYwdNhHknyglMfApzuHafe','FxcgqG73pwjXx3Ez2PHQT1'),
														('mYwdNhHknyglMfApzuHafe','5JdZmshlCl9r6V8YC5xb7Z'),
                            ('mYwdNhHknyglMfApzuHafe','XCT6tzFuKOUBdUotqPcxsr'),
                            ('mYwdNhHknyglMfApzuHafe','nRc6SuU62o19ge7EeCCKTn'),
                            ('mYwdNhHknyglMfApzuHafe','haT45q1dV4WapH0Tm2p4To'),
                            ('mYwdNhHknyglMfApzuHafe','dK9laJ8onIPf6pfqhboNvX'),
                            ('mYwdNhHknyglMfApzuHafe','wdFgVs9ldPZ6jovDkL9UA2'),
                            ('mYwdNhHknyglMfApzuHafe','GHqojhh5AtIAKBxPJgjJVs'),
                            ('mYwdNhHknyglMfApzuHafe','wKNaRmss7GI1gygp7uE4JZ'),
                            ('mYwdNhHknyglMfApzuHafe','TrzksGNV5nyemeE6jgZb0d');







-- RELEASE_HAVE_TRACK
INSERT INTO RELEASES_HAVE_TRACK VALUES('7EGYM3wfXfaJdGLizzStVx','wBQ09nI4xtWYkIdEsCSByW'),
																			('xRbSNEemd79wUXjhpdtnNf','wBQ09nI4xtWYkIdEsCSByW'),
                                      ('pk0c2vFeDEyqp1FMAWqJZO','wBQ09nI4xtWYkIdEsCSByW'),
                                      ('24AdSae2NKNNhYWJvU13ah','wBQ09nI4xtWYkIdEsCSByW'),
                                      ('FQAYrkkreqvKYgwg1SLTKR','wBQ09nI4xtWYkIdEsCSByW');

INSERT INTO RELEASES_HAVE_TRACK VALUES('6adDYqIKXOZ8NZN7Ewh0VU','7e1NyPM2GFFlCWmFPdwfjA'),
																			('6adDYqIKXOZ8NZN7Ewh0VU','WMmpFHrW2DxmleP2F8NisX'),
																			('rUUOR6IWkri1C6wbg1GcAC','7e1NyPM2GFFlCWmFPdwfjA'),
                                      ('rUUOR6IWkri1C6wbg1GcAC','TsF5BS6cs6zgQSbfiOUHnS'),
                                      ('MV5UFAfmYs9JVM2RgWq9im','7e1NyPM2GFFlCWmFPdwfjA'),
                                      ('ACJYUDuzYtMCFlPUGXGpoi','7e1NyPM2GFFlCWmFPdwfjA'),
                                      ('fguB6VGCjK43FLF8hYhSw8','7e1NyPM2GFFlCWmFPdwfjA');

INSERT INTO RELEASES_HAVE_TRACK VALUES('N63VmjFlHl5ddaINdF7kdL','9ykErkkNkKZFr4RC7W4p1p');
INSERT INTO RELEASES_HAVE_TRACK VALUES('7EGYM3wfXfaJdGLizzStVx','5BPHvW20j1sOf3KQOTBJH4'),
																			('xRbSNEemd79wUXjhpdtnNf','sVaPVAH1v3SDrnv1sFEfMD'),
                                      ('pk0c2vFeDEyqp1FMAWqJZO','g3isH9CIiiuSvpZu0tsmu7'),
                                      ('24AdSae2NKNNhYWJvU13ah','vC12WcsYPh2g4uPYZvX0jX'),
                                      ('FQAYrkkreqvKYgwg1SLTKR','dRtxPk0kXMRgVjUSs4uOkI'),
                                      ('MV5UFAfmYs9JVM2RgWq9im','ZfrSsaGA7wlA9305wjiXyG'),
                                      ('ACJYUDuzYtMCFlPUGXGpoi','OkfFUTeLyd8KMPKjnRDVRb'),
                                      ('fguB6VGCjK43FLF8hYhSw8','hv91fERq67eWJD0yuGWceU');



INSERT INTO RELEASES_HAVE_TRACK VALUES('xRbSNEemd79wUXjhpdtnNf','DFvm49XhHsJvNo3TptwJyJ'),
																			('FQAYrkkreqvKYgwg1SLTKR','DFvm49XhHsJvNo3TptwJyJ'),
                                      ('N63VmjFlHl5ddaINdF7kdL','DFvm49XhHsJvNo3TptwJyJ');

INSERT INTO RELEASES_HAVE_TRACK VALUES('niOZ74IbExeZnBzS1ugSMb','oBLIWfec9jmjdbVrKqiBsr'),
																			('qFQfiAc9w9NP5RrxbIHpyD','oBLIWfec9jmjdbVrKqiBsr'),
                                      ('xGEF8oT2mrGODVOzY6ZgjN','oBLIWfec9jmjdbVrKqiBsr'),
                                      ('YtZUvwmzzrxEUC6wnjln1k','oBLIWfec9jmjdbVrKqiBsr'),
                                      ('MrdQ5vmGQYM7PsqOx1hXuM','oBLIWfec9jmjdbVrKqiBsr');

INSERT INTO RELEASES_HAVE_TRACK VALUES('niOZ74IbExeZnBzS1ugSMb','eaGmU9alZQODttMRexDsvF'),
																			('qFQfiAc9w9NP5RrxbIHpyD','TKr9feWIcJTzx7mSidhjrB'),
                                      ('xGEF8oT2mrGODVOzY6ZgjN','XBo4gILBMzOdN1ymyg2Y1Z'),
                                      ('YtZUvwmzzrxEUC6wnjln1k','iPG5pPZT8XHXII449IQTAK'),
                                      ('MrdQ5vmGQYM7PsqOx1hXuM','tlWrdXo2PESdvrHUweUAkB'),
                                      ('VCR5iCzBtdQ6ZZfZ7MNNH5','Ku1r8wsoDNGzhEzAxK5aj3'),
                                      ('omzBZOkVDCUwGE07w1oftu','CIWx5Yw4TR1YPt7la7b3Ah'),
                                      ('pCJ9gtVBMeB164CUrgMdSm','RYjy3crZIgkxkB4boUiJ92'),
                                      ('AHs4jAWhBNtGpR6Mt9kPQz','UCTNgJvdY26G9qH5mDjBZf');


INSERT INTO RELEASES_HAVE_TRACK VALUES('098CJ8SFqACjBbZe07IcrW','ibDXMkOdCsz4fJciGOYeCv'),
																			('VCR5iCzBtdQ6ZZfZ7MNNH5','ibDXMkOdCsz4fJciGOYeCv'),
                                      ('omzBZOkVDCUwGE07w1oftu','ibDXMkOdCsz4fJciGOYeCv'),
                                      ('pCJ9gtVBMeB164CUrgMdSm','ibDXMkOdCsz4fJciGOYeCv'),
                                      ('AHs4jAWhBNtGpR6Mt9kPQz','ibDXMkOdCsz4fJciGOYeCv');

INSERT INTO RELEASES_HAVE_TRACK VALUES('098CJ8SFqACjBbZe07IcrW','DMqlLuIlPbMSRGRofOHH0C');

INSERT INTO RELEASES_HAVE_TRACK VALUES('evlbeGWSXhvfGyjRIAvk6T','IF0J2MEdC8oDerZjU8UZ8M'),
																			('JXsSTKHzeh3l5FMRJTyJhi','IF0J2MEdC8oDerZjU8UZ8M'),
                                      ('zmRK2DT8oaOncKtVSMCYif','IF0J2MEdC8oDerZjU8UZ8M'),
                                      ('sslY66bNX05BH3gf4F65gl','IF0J2MEdC8oDerZjU8UZ8M'),
                                      ('Xqf72CNN4z8zRHFtWttT0x','IF0J2MEdC8oDerZjU8UZ8M');
INSERT INTO RELEASES_HAVE_TRACK VALUES('Ap0gx09VvCwIhbJPxqEWXS','QZclRbzWMMbVCXEHVicw0A');

INSERT INTO RELEASES_HAVE_TRACK VALUES('evlbeGWSXhvfGyjRIAvk6T','pjw3zTQPSWosU3TAGYaWhI'),
																			('JXsSTKHzeh3l5FMRJTyJhi','I0I7cZuQOVS8dweg3cGKYH'),
                                      ('zmRK2DT8oaOncKtVSMCYif','p5DXwd9pkraHcFgTSD84Eq'),
                                      ('sslY66bNX05BH3gf4F65gl','RIZhaeD88r3lL9dpuZB4fB'),
                                      ('Xqf72CNN4z8zRHFtWttT0x','S12ACwBM5EyaHZbTS3e1g9');


INSERT INTO RELEASES_HAVE_TRACK VALUES('QAD0w39nHzMMega7YQA9ER','uZrtt7aFY8zCSsxIRKfJrs'),
																			('3boXyfeeTPacABRHEKPqjl','uZrtt7aFY8zCSsxIRKfJrs'),
                                      ('KX8Ajn0lhqiC6ri6pl2kpp','uZrtt7aFY8zCSsxIRKfJrs'),
                                      ('QQ3VakBaFDX9es1mbKjlYz','uZrtt7aFY8zCSsxIRKfJrs'),
                                      ('xAjbIwdgXFQjehOQfXi0qu','uZrtt7aFY8zCSsxIRKfJrs');

INSERT INTO RELEASES_HAVE_TRACK VALUES('QAD0w39nHzMMega7YQA9ER','i3ebru9mHZt8mykTkrxfgw');

INSERT INTO RELEASES_HAVE_TRACK VALUES('3boXyfeeTPacABRHEKPqjl','1HM9tDhjrAdfsTJs0klngO'),
																			('KX8Ajn0lhqiC6ri6pl2kpp','TrzksGNV5nyemeE6jgZb0d'),
                                      ('QQ3VakBaFDX9es1mbKjlYz','LzT63TzNyOUbRnLMhz87nR'),
                                      ('xAjbIwdgXFQjehOQfXi0qu','VfvvgkL6WCzGkMYIYBGgwg');


INSERT INTO RELEASES_HAVE_TRACK VALUES('NUaZyOzMHWOm0kanVWBzdI','DsCXkBA0SV4aFz1UM3o136'),
																			('5e2AbG8F3dzfXjASSxrGfx','DsCXkBA0SV4aFz1UM3o136'),
                                      ('jgbVUAAY3KOigMrcke8V68','DsCXkBA0SV4aFz1UM3o136'),
                                      ('aLQtg994VLNMMDdlXfHElO','DsCXkBA0SV4aFz1UM3o136'),
                                      ('WH9pkOt0SY0kLF4lKnRGWC','DsCXkBA0SV4aFz1UM3o136');

INSERT INTO RELEASES_HAVE_TRACK VALUES('PLfibzSzKQfIGZ0ZLP7IfY','Tpj306uW2VLqiLBWgEnD1p'),
																			('ssgBd0AGjDtdppUX1HrrIc','Tpj306uW2VLqiLBWgEnD1p'),
                                      ('pts68NvOSC6msRhdK3Rbjs','Tpj306uW2VLqiLBWgEnD1p'),
                                      ('JsmKuKOWeItNHzz4DxIKwW','Tpj306uW2VLqiLBWgEnD1p'),
                                      ('rZ0lZSrhzrobRgKh1bwC6M','Tpj306uW2VLqiLBWgEnD1p'); 

INSERT INTO RELEASES_HAVE_TRACK VALUES('PLfibzSzKQfIGZ0ZLP7IfY','r7aTvk8ox6OTe2CbgINNZm');
INSERT INTO RELEASES_HAVE_TRACK VALUES('qMpVMeDq0zZ1PMBsIivqtf','mchiVLY34JnrQa4NJCpIjm');

INSERT INTO RELEASES_HAVE_TRACK VALUES('NUaZyOzMHWOm0kanVWBzdI','FxcgqG73pwjXx3Ez2PHQT1'),
																			('5e2AbG8F3dzfXjASSxrGfx','5JdZmshlCl9r6V8YC5xb7Z'),
                                      ('jgbVUAAY3KOigMrcke8V68','XCT6tzFuKOUBdUotqPcxsr'),
                                      ('aLQtg994VLNMMDdlXfHElO','nRc6SuU62o19ge7EeCCKTn'),
                                      ('WH9pkOt0SY0kLF4lKnRGWC','haT45q1dV4WapH0Tm2p4To'),
                                      ('ssgBd0AGjDtdppUX1HrrIc','dK9laJ8onIPf6pfqhboNvX'),
                                      ('pts68NvOSC6msRhdK3Rbjs','wdFgVs9ldPZ6jovDkL9UA2'),
                                      ('JsmKuKOWeItNHzz4DxIKwW','GHqojhh5AtIAKBxPJgjJVs'),
                                      ('rZ0lZSrhzrobRgKh1bwC6M','wKNaRmss7GI1gygp7uE4JZ');

INSERT INTO RELEASES_HAVE_TRACK VALUES('NUaZyOzMHWOm0kanVWBzdI','6buydZicCvtELTX754uMYi'),
																			('jgbVUAAY3KOigMrcke8V68','6buydZicCvtELTX754uMYi'),
                                      ('JsmKuKOWeItNHzz4DxIKwW','6buydZicCvtELTX754uMYi');



-- PLAYLIST
INSERT INTO PLAYLIST (Playlist_ID, Name, Photo, isPrivate, PL_Content_ID) VALUES 
	-- SYSTEM PLAYLIST
  ('UugJuJhz5dkWafTFSmfdht', 'Ultimate 80s',        'https://cdns-images.dzcdn.net/images/cover/1cacb39cdfc9c0f15c79c3193df6cd42/500x500.jpg', 0, 'bg7XJJj7JnHSsG3A7xcle6'),
  ('0RoZ2z2YPeS0T2hjmO6J8v', 'Ultimate 90s',        'https://cdns-images.dzcdn.net/images/cover/0ad94bf3bccfc79f29ea59d24783aad3/500x500.jpg', 0, '8f9jTiSmWA06hCpOPPer4C'),
  ('JH10PQErDtoyn7OXQz5op0', 'Best Pop Hits 2000s', 'https://cdns-images.dzcdn.net/images/cover/10613fc0d1a157fce0d8313497a4958c/500x500.jpg', 0, 'xh7Ohfrb1vZeKnBROr3YNv'),
  ('CvlTmZnLBxW3SZege1kZpH', 'Best Pop HIts 2010s', 'https://cdns-images.dzcdn.net/images/cover/ce7fb62b89cd7b01f6263c8258e098cc/500x500.jpg', 0, 'deN10gGj0jgWjAAyh5Hndu'),
  ('ebg6TESFPsoLv99597wwvY', 'Deluxe EDM Music',    'https://cdns-images.dzcdn.net/images/cover/03e2560bbf866ded020f771b6a29254e/500x500.jpg', 0, 'Aozj4bZ1wsr7RxGLZW6o5V'),
  
  -- USER PLAYLIST
  ('sorGuoJMeymKYWYlH9o45G', 'My Favorite Music',   'https://cdns-images.dzcdn.net/images/cover/03e2560bbf866ded020f771b6a29254e/500x500.jpg', 0, '9XueJAm3GQ5EKGCKg5hGOp'),
  ('Jqs5bA29vNUiqGk9wWQGBn', 'Best US-UK Music',    'https://cdns-images.dzcdn.net/images/cover/03e2560bbf866ded020f771b6a29254e/500x500.jpg', 0, 'X9eaPDN6T2Kxg6b7A154en'),

  ('uuRCzKF5d0pmbOkVARIf6n', 'Favorite Music',    	'https://cdns-images.dzcdn.net/images/cover/03e2560bbf866ded020f771b6a29254e/500x500.jpg', 0, 'xwIoqDKETTw8tcJYXib0VH'),
  ('F7QXemTOJb6Hfofw3jdHcR', 'Best Adele Song',    	'https://cdns-images.dzcdn.net/images/cover/03e2560bbf866ded020f771b6a29254e/500x500.jpg', 0, '0OLUVluFlFg1a7U1IcItxh'),
  
  ('JTz23RlOIaU0FJiAV7BcHm', 'Nhạc iu thích',    	  'https://cdns-images.dzcdn.net/images/cover/03e2560bbf866ded020f771b6a29254e/500x500.jpg', 0, 'ZXdzM5DAIjmpNQPzmAY6VP'),
  ('UiUJ39xal2XcfCp1bZRjAc', 'Tuyển tập B-Ray',    	'https://cdns-images.dzcdn.net/images/cover/03e2560bbf866ded020f771b6a29254e/500x500.jpg', 0, 'qdrNPWd11uKUXCxmuwcZzT');

-- IN
INSERT INTO TRACK_IN_PLAYLIST (I_Track_ID, I_Playlist_ID, Orders, TimeAdded) VALUES
	-- SYSTEM PLAYLIST
	('7EGYM3wfXfaJdGLizzStVx', 'UugJuJhz5dkWafTFSmfdht', 1, '2021-11-13 08:20:09'),
  ('xRbSNEemd79wUXjhpdtnNf', 'UugJuJhz5dkWafTFSmfdht', 2, '2021-11-13 08:20:09'),
  ('pk0c2vFeDEyqp1FMAWqJZO', 'UugJuJhz5dkWafTFSmfdht', 3, '2021-11-13 08:20:09'),
  ('24AdSae2NKNNhYWJvU13ah', 'UugJuJhz5dkWafTFSmfdht', 4, '2021-11-13 08:20:09'),
  ('FQAYrkkreqvKYgwg1SLTKR', 'UugJuJhz5dkWafTFSmfdht', 5, '2021-11-13 08:20:09'),
  ('6adDYqIKXOZ8NZN7Ewh0VU', 'UugJuJhz5dkWafTFSmfdht', 6, '2021-11-13 08:20:09'),
  ('rUUOR6IWkri1C6wbg1GcAC', 'UugJuJhz5dkWafTFSmfdht', 7, '2021-11-13 08:20:09'),
  ('MV5UFAfmYs9JVM2RgWq9im', 'UugJuJhz5dkWafTFSmfdht', 8, '2021-11-13 08:20:09'),
  ('ACJYUDuzYtMCFlPUGXGpoi', 'UugJuJhz5dkWafTFSmfdht', 9, '2021-11-13 08:20:09'),
  ('fguB6VGCjK43FLF8hYhSw8', 'UugJuJhz5dkWafTFSmfdht', 10, '2021-11-13 08:20:09'),
  
  ('N63VmjFlHl5ddaINdF7kdL', '0RoZ2z2YPeS0T2hjmO6J8v', 1, '2021-11-13 14:19:30'),
  ('niOZ74IbExeZnBzS1ugSMb', '0RoZ2z2YPeS0T2hjmO6J8v', 2, '2021-11-13 14:19:30'),
  ('omzBZOkVDCUwGE07w1oftu', '0RoZ2z2YPeS0T2hjmO6J8v', 3, '2021-11-13 14:19:30'),
  ('pCJ9gtVBMeB164CUrgMdSm', '0RoZ2z2YPeS0T2hjmO6J8v', 4, '2021-11-13 14:19:30'),
  ('AHs4jAWhBNtGpR6Mt9kPQz', '0RoZ2z2YPeS0T2hjmO6J8v', 5, '2021-11-13 14:19:30'),
  ('JXsSTKHzeh3l5FMRJTyJhi', '0RoZ2z2YPeS0T2hjmO6J8v', 6, '2021-11-13 14:19:30'),
  ('zmRK2DT8oaOncKtVSMCYif', '0RoZ2z2YPeS0T2hjmO6J8v', 7, '2021-11-13 14:19:30'),
  ('sslY66bNX05BH3gf4F65gl', '0RoZ2z2YPeS0T2hjmO6J8v', 8, '2021-11-13 14:19:30'),
  ('Ap0gx09VvCwIhbJPxqEWXS', '0RoZ2z2YPeS0T2hjmO6J8v', 9, '2021-11-13 14:19:30'),
  ('QAD0w39nHzMMega7YQA9ER', '0RoZ2z2YPeS0T2hjmO6J8v', 10, '2021-11-13 14:19:30'),
  
  ('NUaZyOzMHWOm0kanVWBzdI', 'JH10PQErDtoyn7OXQz5op0', 1, '2021-11-13 22:09:54'),
  ('5e2AbG8F3dzfXjASSxrGfx', 'JH10PQErDtoyn7OXQz5op0', 2, '2021-11-13 22:09:54'),
  ('jgbVUAAY3KOigMrcke8V68', 'JH10PQErDtoyn7OXQz5op0', 3, '2021-11-13 22:09:54'),
  ('aLQtg994VLNMMDdlXfHElO', 'JH10PQErDtoyn7OXQz5op0', 4, '2021-11-13 22:09:54'),
  ('WH9pkOt0SY0kLF4lKnRGWC', 'JH10PQErDtoyn7OXQz5op0', 5, '2021-11-13 22:09:54'),
  ('PLfibzSzKQfIGZ0ZLP7IfY', 'JH10PQErDtoyn7OXQz5op0', 6, '2021-11-13 22:09:54'),
  ('ssgBd0AGjDtdppUX1HrrIc', 'JH10PQErDtoyn7OXQz5op0', 7, '2021-11-13 22:09:54'),
  ('pts68NvOSC6msRhdK3Rbjs', 'JH10PQErDtoyn7OXQz5op0', 8, '2021-11-13 22:09:54'),
  ('JsmKuKOWeItNHzz4DxIKwW', 'JH10PQErDtoyn7OXQz5op0', 9, '2021-11-13 22:09:54'),
  ('rZ0lZSrhzrobRgKh1bwC6M', 'JH10PQErDtoyn7OXQz5op0', 10, '2021-11-13 22:09:54'),
  
  ('rUUOR6IWkri1C6wbg1GcAC', 'CvlTmZnLBxW3SZege1kZpH', 1, '2021-11-13 20:19:49'),
  ('ACJYUDuzYtMCFlPUGXGpoi', 'CvlTmZnLBxW3SZege1kZpH', 2, '2021-11-13 20:19:49'),
  ('fguB6VGCjK43FLF8hYhSw8', 'CvlTmZnLBxW3SZege1kZpH', 3, '2021-11-13 20:19:49'),
  ('niOZ74IbExeZnBzS1ugSMb', 'CvlTmZnLBxW3SZege1kZpH', 4, '2021-11-13 20:19:49'),
  ('xGEF8oT2mrGODVOzY6ZgjN', 'CvlTmZnLBxW3SZege1kZpH', 5, '2021-11-13 20:19:49'),
  ('omzBZOkVDCUwGE07w1oftu', 'CvlTmZnLBxW3SZege1kZpH', 6, '2021-11-13 20:19:49'),
  ('QAD0w39nHzMMega7YQA9ER', 'CvlTmZnLBxW3SZege1kZpH', 7, '2021-11-13 20:19:49'),
  ('5e2AbG8F3dzfXjASSxrGfx', 'CvlTmZnLBxW3SZege1kZpH', 8, '2021-11-13 20:19:49'),
  ('pts68NvOSC6msRhdK3Rbjs', 'CvlTmZnLBxW3SZege1kZpH', 9, '2021-11-13 20:19:49'),
  ('qMpVMeDq0zZ1PMBsIivqtf', 'CvlTmZnLBxW3SZege1kZpH', 10, '2021-11-13 20:19:49'),
  
  ('7EGYM3wfXfaJdGLizzStVx', 'ebg6TESFPsoLv99597wwvY', 1, '2021-11-13 21:20:16'),
  ('pk0c2vFeDEyqp1FMAWqJZO', 'ebg6TESFPsoLv99597wwvY', 2, '2021-11-13 21:20:16'),
  ('rUUOR6IWkri1C6wbg1GcAC', 'ebg6TESFPsoLv99597wwvY', 3, '2021-11-13 21:20:16'),
  ('MV5UFAfmYs9JVM2RgWq9im', 'ebg6TESFPsoLv99597wwvY', 4, '2021-11-13 21:20:16'),
  ('fguB6VGCjK43FLF8hYhSw8', 'ebg6TESFPsoLv99597wwvY', 5, '2021-11-13 21:20:16'),
  ('xGEF8oT2mrGODVOzY6ZgjN', 'ebg6TESFPsoLv99597wwvY', 6, '2021-11-13 21:20:16'),
  ('VCR5iCzBtdQ6ZZfZ7MNNH5', 'ebg6TESFPsoLv99597wwvY', 7, '2021-11-13 21:20:16'),
  ('JXsSTKHzeh3l5FMRJTyJhi', 'ebg6TESFPsoLv99597wwvY', 8, '2021-11-13 21:20:16'),
  ('3boXyfeeTPacABRHEKPqjl', 'ebg6TESFPsoLv99597wwvY', 9, '2021-11-13 21:20:16'),
  ('5e2AbG8F3dzfXjASSxrGfx', 'ebg6TESFPsoLv99597wwvY', 10, '2021-11-13 21:20:16'),
  
  -- USER PLAYIST
  ('evlbeGWSXhvfGyjRIAvk6T', 'sorGuoJMeymKYWYlH9o45G', 1, '2021-11-13 19:09:54'),
  ('PLfibzSzKQfIGZ0ZLP7IfY', 'sorGuoJMeymKYWYlH9o45G', 2, '2021-11-13 19:09:54'),
  ('7EGYM3wfXfaJdGLizzStVx', 'sorGuoJMeymKYWYlH9o45G', 3, '2021-11-13 19:09:54'),
  ('aLQtg994VLNMMDdlXfHElO', 'sorGuoJMeymKYWYlH9o45G', 4, '2021-11-13 19:09:54'),
  ('qMpVMeDq0zZ1PMBsIivqtf', 'sorGuoJMeymKYWYlH9o45G', 5, '2021-11-13 19:09:54'),
  ('6adDYqIKXOZ8NZN7Ewh0VU', 'sorGuoJMeymKYWYlH9o45G', 6, '2021-11-13 19:09:54'),
  ('VCR5iCzBtdQ6ZZfZ7MNNH5', 'sorGuoJMeymKYWYlH9o45G', 7, '2021-11-13 19:09:54'),
  ('N63VmjFlHl5ddaINdF7kdL', 'sorGuoJMeymKYWYlH9o45G', 8, '2021-11-13 19:09:54'),
  ('pk0c2vFeDEyqp1FMAWqJZO', 'sorGuoJMeymKYWYlH9o45G', 9, '2021-11-13 19:09:54'),
  
  ('AHs4jAWhBNtGpR6Mt9kPQz', 'Jqs5bA29vNUiqGk9wWQGBn', 1, '2021-11-10 16:33:18'),
  ('VCR5iCzBtdQ6ZZfZ7MNNH5', 'Jqs5bA29vNUiqGk9wWQGBn', 2, '2021-11-10 16:33:18'),
  ('QQ3VakBaFDX9es1mbKjlYz', 'Jqs5bA29vNUiqGk9wWQGBn', 3, '2021-11-10 16:33:18'),
  ('ssgBd0AGjDtdppUX1HrrIc', 'Jqs5bA29vNUiqGk9wWQGBn', 4, '2021-11-10 16:33:18'),
  ('NUaZyOzMHWOm0kanVWBzdI', 'Jqs5bA29vNUiqGk9wWQGBn', 5, '2021-11-10 16:33:18'),
  ('pCJ9gtVBMeB164CUrgMdSm', 'Jqs5bA29vNUiqGk9wWQGBn', 6, '2021-11-10 16:33:18'),
  ('xGEF8oT2mrGODVOzY6ZgjN', 'Jqs5bA29vNUiqGk9wWQGBn', 7, '2021-11-10 16:33:18'),
  ('098CJ8SFqACjBbZe07IcrW', 'Jqs5bA29vNUiqGk9wWQGBn', 8, '2021-11-10 16:33:18'),
  ('zmRK2DT8oaOncKtVSMCYif', 'Jqs5bA29vNUiqGk9wWQGBn', 9, '2021-11-10 16:33:18'),
  ('fguB6VGCjK43FLF8hYhSw8', 'Jqs5bA29vNUiqGk9wWQGBn', 10, '2021-11-10 16:33:18'),
  
  ('098CJ8SFqACjBbZe07IcrW', 'uuRCzKF5d0pmbOkVARIf6n', 1, '2021-11-10 20:19:05'),
  ('VCR5iCzBtdQ6ZZfZ7MNNH5', 'uuRCzKF5d0pmbOkVARIf6n', 2, '2021-11-10 20:19:05'),
  ('JXsSTKHzeh3l5FMRJTyJhi', 'uuRCzKF5d0pmbOkVARIf6n', 3, '2021-11-10 20:19:05'),
  ('zmRK2DT8oaOncKtVSMCYif', 'uuRCzKF5d0pmbOkVARIf6n', 4, '2021-11-10 20:19:05'),
  ('QAD0w39nHzMMega7YQA9ER', 'uuRCzKF5d0pmbOkVARIf6n', 5, '2021-11-10 20:19:05'),
  ('jgbVUAAY3KOigMrcke8V68', 'uuRCzKF5d0pmbOkVARIf6n', 6, '2021-11-10 20:19:05'),
  ('ssgBd0AGjDtdppUX1HrrIc', 'uuRCzKF5d0pmbOkVARIf6n', 7, '2021-11-10 20:19:05'),
  ('xGEF8oT2mrGODVOzY6ZgjN', 'uuRCzKF5d0pmbOkVARIf6n', 8, '2021-11-10 20:19:05'),
  ('MV5UFAfmYs9JVM2RgWq9im', 'uuRCzKF5d0pmbOkVARIf6n', 9, '2021-11-10 20:19:05'),
  ('fguB6VGCjK43FLF8hYhSw8', 'uuRCzKF5d0pmbOkVARIf6n', 10, '2021-11-10 20:19:05'),
  
  ('VCR5iCzBtdQ6ZZfZ7MNNH5', 'F7QXemTOJb6Hfofw3jdHcR', 1, '2021-10-23 08:27:16'),
  ('pCJ9gtVBMeB164CUrgMdSm', 'F7QXemTOJb6Hfofw3jdHcR', 2, '2021-10-23 08:27:16'),
  ('JXsSTKHzeh3l5FMRJTyJhi', 'F7QXemTOJb6Hfofw3jdHcR', 3, '2021-10-23 08:27:16'),
  ('QAD0w39nHzMMega7YQA9ER', 'F7QXemTOJb6Hfofw3jdHcR', 4, '2021-10-23 08:27:16'),
  ('5e2AbG8F3dzfXjASSxrGfx', 'F7QXemTOJb6Hfofw3jdHcR', 5, '2021-10-23 08:27:16'),
  ('ssgBd0AGjDtdppUX1HrrIc', 'F7QXemTOJb6Hfofw3jdHcR', 6, '2021-10-23 08:27:16'),
  ('aLQtg994VLNMMDdlXfHElO', 'F7QXemTOJb6Hfofw3jdHcR', 7, '2021-10-23 08:27:16'),
  ('WH9pkOt0SY0kLF4lKnRGWC', 'F7QXemTOJb6Hfofw3jdHcR', 8, '2021-10-23 08:27:16'),
  ('qMpVMeDq0zZ1PMBsIivqtf', 'F7QXemTOJb6Hfofw3jdHcR', 9, '2021-10-23 08:27:16'),
  ('JsmKuKOWeItNHzz4DxIKwW', 'F7QXemTOJb6Hfofw3jdHcR', 10, '2021-10-23 08:27:16'),
  
  ('7EGYM3wfXfaJdGLizzStVx', 'JTz23RlOIaU0FJiAV7BcHm', 1, '2021-11-07 22:57:47'),
  ('xRbSNEemd79wUXjhpdtnNf', 'JTz23RlOIaU0FJiAV7BcHm', 2, '2021-11-07 22:57:47'),
  ('pk0c2vFeDEyqp1FMAWqJZO', 'JTz23RlOIaU0FJiAV7BcHm', 3, '2021-11-07 22:57:47'),
  ('6adDYqIKXOZ8NZN7Ewh0VU', 'JTz23RlOIaU0FJiAV7BcHm', 4, '2021-11-07 22:57:47'),
  ('MV5UFAfmYs9JVM2RgWq9im', 'JTz23RlOIaU0FJiAV7BcHm', 5, '2021-11-07 22:57:47'),
  ('ACJYUDuzYtMCFlPUGXGpoi', 'JTz23RlOIaU0FJiAV7BcHm', 6, '2021-11-07 22:57:47'),
  ('qFQfiAc9w9NP5RrxbIHpyD', 'JTz23RlOIaU0FJiAV7BcHm', 7, '2021-11-07 22:57:47'),
  ('omzBZOkVDCUwGE07w1oftu', 'JTz23RlOIaU0FJiAV7BcHm', 8, '2021-11-07 22:57:47'),
  ('JXsSTKHzeh3l5FMRJTyJhi', 'JTz23RlOIaU0FJiAV7BcHm', 9, '2021-11-07 22:57:47'),
  ('Ap0gx09VvCwIhbJPxqEWXS', 'JTz23RlOIaU0FJiAV7BcHm', 10, '2021-11-07 22:57:47'),
  
  ('7EGYM3wfXfaJdGLizzStVx', 'UiUJ39xal2XcfCp1bZRjAc', 1, '2021-11-12 13:02:02'),
  ('6adDYqIKXOZ8NZN7Ewh0VU', 'UiUJ39xal2XcfCp1bZRjAc', 2, '2021-11-12 13:02:02'),
  ('qFQfiAc9w9NP5RrxbIHpyD', 'UiUJ39xal2XcfCp1bZRjAc', 3, '2021-11-12 13:02:02'),
  ('omzBZOkVDCUwGE07w1oftu', 'UiUJ39xal2XcfCp1bZRjAc', 4, '2021-11-12 13:02:02'),
  ('zmRK2DT8oaOncKtVSMCYif', 'UiUJ39xal2XcfCp1bZRjAc', 5, '2021-11-12 13:02:02'),
  ('3boXyfeeTPacABRHEKPqjl', 'UiUJ39xal2XcfCp1bZRjAc', 6, '2021-11-12 13:02:02'),
  ('xAjbIwdgXFQjehOQfXi0qu', 'UiUJ39xal2XcfCp1bZRjAc', 7, '2021-11-12 13:02:02'),
  ('5e2AbG8F3dzfXjASSxrGfx', 'UiUJ39xal2XcfCp1bZRjAc', 8, '2021-11-12 13:02:02'),
  ('ssgBd0AGjDtdppUX1HrrIc', 'UiUJ39xal2XcfCp1bZRjAc', 9, '2021-11-12 13:02:02'),
  ('rZ0lZSrhzrobRgKh1bwC6M', 'UiUJ39xal2XcfCp1bZRjAc', 10, '2021-11-12 13:02:02');
  
-- SYSTEM_PLAYLIST
INSERT INTO SYSTEM_PLAYLIST (SP_Playlist_ID) VALUES
														('UugJuJhz5dkWafTFSmfdht'),
														('0RoZ2z2YPeS0T2hjmO6J8v'),
														('JH10PQErDtoyn7OXQz5op0'),
														('CvlTmZnLBxW3SZege1kZpH'),
														('ebg6TESFPsoLv99597wwvY');
  
-- USER_PLAYLIST (Playlist_ID, TimeCreated, User_ID)
-- Cái này khi user nhấn tạo mới insert data thôi phải hông, nên giờ đâu cần insert data cho user_playlist ??  <----------- 
-- ye, vậy thì phải có hàm gen id nữa hả
-- mà có thể làm trước là user đã insert sẵn 1 playlist ùi mừ
-- Okay
INSERT INTO USER_PLAYLIST VALUES
	-- Nam's user playlist
	('sorGuoJMeymKYWYlH9o45G', '2021-11-10 19:45:23', 'ihHTsyJMvCAHbs1jIaJ61i'),
  ('Jqs5bA29vNUiqGk9wWQGBn', '2021-04-15 20:12:39', 'ihHTsyJMvCAHbs1jIaJ61i'),
  
  -- Ricardo's user playlist
  ('uuRCzKF5d0pmbOkVARIf6n', '2021-11-10 19:45:23', 'eUByfMoDmM3X9qC7ocArcC'),
  ('F7QXemTOJb6Hfofw3jdHcR', '2021-04-15 20:12:39', 'eUByfMoDmM3X9qC7ocArcC'),
  
  -- Le Cong Thanh's user playlist
  ('JTz23RlOIaU0FJiAV7BcHm', '2021-04-15 20:12:39', 'EclNfpBMvxWxyHJkuQeTLe'),
  ('UiUJ39xal2XcfCp1bZRjAc', '2021-04-15 20:12:39', 'EclNfpBMvxWxyHJkuQeTLe');
  
  

-- PLAYBACK
INSERT INTO PLAYBACK VALUES 
	('ZXIREsJm4IVqy3iTdfIc1C', 'ihHTsyJMvCAHbs1jIaJ61i', ''),
  ('SGNfUUSqucgNKafERMbY0O', 'eUByfMoDmM3X9qC7ocArcC', ''),
  ('pyJ4JAPT6mVoe5kCJYTKnu', 'EclNfpBMvxWxyHJkuQeTLe', ''),
  ('DAtZcZVqUUgU3217Bzz57o', 'zbE5y24hqTKL6lPGvVAmgX', ''),
  ('9cLyAiseolvmDGDG95bbfj', 'ERJqJgPmQYhv3ex35fODJ1', ''),
  ('E7HybW4Y9u84cs3vwodHZ6', 'VSacmSRug2jenc6nblThah', ''),
  ('3HUoUC2t32VLGf72XHvLoW', 'GVOZ6cHysyBnq25gZQv5GW', ''),
  ('sdXOgm0mMBpfyvJxg7ZCk9', 'KjqlxOkt7vzY8NLzfbNlHu', ''),
  ('8BUFSvPXClrjrzC6okWXxw', '3NKjcPT0mjG2HZtkG0jsF2', ''),
  ('5dg08p26qGH0uRanKrkYTh', '8G2oicxUetr7ykVXGetWI2', ''),
  ('MKlt2vYgSoWDsn92QayJjO', '7qSNhvIkhjXc0JmCgyNAKV', ''),
  ('ZWuxQA9aP0dyHizo7DJuzv', 'doT6m44UpIAP7uUBzBOUFQ', '');
  
-- PLAYBACK_DEVICE
INSERT INTO PLAYBACK_DEVICE VALUES
	('ZXIREsJm4IVqy3iTdfIc1C', 'Phone'),
  ('ZXIREsJm4IVqy3iTdfIc1C', 'Tablet'),
  
  ('SGNfUUSqucgNKafERMbY0O', 'Phone'),
  
  ('pyJ4JAPT6mVoe5kCJYTKnu', 'PC'),
  
  ('DAtZcZVqUUgU3217Bzz57o', 'PC'),
  ('DAtZcZVqUUgU3217Bzz57o', 'Phone'),
  
  ('9cLyAiseolvmDGDG95bbfj', 'Phone'),
  
  ('E7HybW4Y9u84cs3vwodHZ6', 'Phone'),
  
  ('3HUoUC2t32VLGf72XHvLoW', 'Phone'),
  ('3HUoUC2t32VLGf72XHvLoW', 'Tablet'),
  
  ('sdXOgm0mMBpfyvJxg7ZCk9', 'PC'),
  
  ('8BUFSvPXClrjrzC6okWXxw', 'Phone'),
  
  ('5dg08p26qGH0uRanKrkYTh', 'Phone'),
  
  ('MKlt2vYgSoWDsn92QayJjO', 'Phone'),
  ('MKlt2vYgSoWDsn92QayJjO', 'PC'),
  ('MKlt2vYgSoWDsn92QayJjO', 'Tablet'),
  
  ('ZWuxQA9aP0dyHizo7DJuzv', 'Phone'),
  ('ZWuxQA9aP0dyHizo7DJuzv', 'PC');

-- PLAYBACK_HAVE_TRACK
INSERT INTO PLAYBACK_HAVE_TRACK VALUES
	('7EGYM3wfXfaJdGLizzStVx', 'ZXIREsJm4IVqy3iTdfIc1C', 1),
  ('pk0c2vFeDEyqp1FMAWqJZO', 'ZXIREsJm4IVqy3iTdfIc1C', 2),
  ('24AdSae2NKNNhYWJvU13ah', 'ZXIREsJm4IVqy3iTdfIc1C', 3),
  ('FQAYrkkreqvKYgwg1SLTKR', 'ZXIREsJm4IVqy3iTdfIc1C', 4),
  ('ACJYUDuzYtMCFlPUGXGpoi', 'ZXIREsJm4IVqy3iTdfIc1C', 5),
  
  ('N63VmjFlHl5ddaINdF7kdL', 'SGNfUUSqucgNKafERMbY0O', 1),
  ('qFQfiAc9w9NP5RrxbIHpyD', 'SGNfUUSqucgNKafERMbY0O', 2),
  ('YtZUvwmzzrxEUC6wnjln1k', 'SGNfUUSqucgNKafERMbY0O', 3),
  ('VCR5iCzBtdQ6ZZfZ7MNNH5', 'SGNfUUSqucgNKafERMbY0O', 4),
  ('evlbeGWSXhvfGyjRIAvk6T', 'SGNfUUSqucgNKafERMbY0O', 5),
  
  ('xGEF8oT2mrGODVOzY6ZgjN', 'pyJ4JAPT6mVoe5kCJYTKnu', 1),
  ('rUUOR6IWkri1C6wbg1GcAC', 'pyJ4JAPT6mVoe5kCJYTKnu', 2),
  ('JXsSTKHzeh3l5FMRJTyJhi', 'pyJ4JAPT6mVoe5kCJYTKnu', 3),
  ('zmRK2DT8oaOncKtVSMCYif', 'pyJ4JAPT6mVoe5kCJYTKnu', 4),
  ('Xqf72CNN4z8zRHFtWttT0x', 'pyJ4JAPT6mVoe5kCJYTKnu', 5),
  
  ('3boXyfeeTPacABRHEKPqjl', 'DAtZcZVqUUgU3217Bzz57o', 1),
  ('KX8Ajn0lhqiC6ri6pl2kpp', 'DAtZcZVqUUgU3217Bzz57o', 2),
  ('QQ3VakBaFDX9es1mbKjlYz', 'DAtZcZVqUUgU3217Bzz57o', 3),
  ('NUaZyOzMHWOm0kanVWBzdI', 'DAtZcZVqUUgU3217Bzz57o', 4),
  ('WH9pkOt0SY0kLF4lKnRGWC', 'DAtZcZVqUUgU3217Bzz57o', 5),
  
  ('PLfibzSzKQfIGZ0ZLP7IfY', '9cLyAiseolvmDGDG95bbfj', 1),
  ('ssgBd0AGjDtdppUX1HrrIc', '9cLyAiseolvmDGDG95bbfj', 2),
  ('pts68NvOSC6msRhdK3Rbjs', '9cLyAiseolvmDGDG95bbfj', 3),
  ('JsmKuKOWeItNHzz4DxIKwW', '9cLyAiseolvmDGDG95bbfj', 4),
  ('6adDYqIKXOZ8NZN7Ewh0VU', '9cLyAiseolvmDGDG95bbfj', 5),
  
  ('rUUOR6IWkri1C6wbg1GcAC', 'E7HybW4Y9u84cs3vwodHZ6', 1),
  ('KX8Ajn0lhqiC6ri6pl2kpp', 'E7HybW4Y9u84cs3vwodHZ6', 2),
  ('YtZUvwmzzrxEUC6wnjln1k', 'E7HybW4Y9u84cs3vwodHZ6', 3),
  ('PLfibzSzKQfIGZ0ZLP7IfY', 'E7HybW4Y9u84cs3vwodHZ6', 4),
  ('3boXyfeeTPacABRHEKPqjl', 'E7HybW4Y9u84cs3vwodHZ6', 5),
  
  ('QAD0w39nHzMMega7YQA9ER', '3HUoUC2t32VLGf72XHvLoW', 1),
  ('QQ3VakBaFDX9es1mbKjlYz', '3HUoUC2t32VLGf72XHvLoW', 2),
  ('24AdSae2NKNNhYWJvU13ah', '3HUoUC2t32VLGf72XHvLoW', 3),
  ('rUUOR6IWkri1C6wbg1GcAC', '3HUoUC2t32VLGf72XHvLoW', 4),
  ('MV5UFAfmYs9JVM2RgWq9im', '3HUoUC2t32VLGf72XHvLoW', 5),
  
  ('fguB6VGCjK43FLF8hYhSw8', 'sdXOgm0mMBpfyvJxg7ZCk9', 1),
  ('aLQtg994VLNMMDdlXfHElO', 'sdXOgm0mMBpfyvJxg7ZCk9', 2),
  ('N63VmjFlHl5ddaINdF7kdL', 'sdXOgm0mMBpfyvJxg7ZCk9', 3),
  ('PLfibzSzKQfIGZ0ZLP7IfY', 'sdXOgm0mMBpfyvJxg7ZCk9', 4),
  ('rUUOR6IWkri1C6wbg1GcAC', 'sdXOgm0mMBpfyvJxg7ZCk9', 5),
  
  ('Xqf72CNN4z8zRHFtWttT0x', '8BUFSvPXClrjrzC6okWXxw', 1),
  ('pk0c2vFeDEyqp1FMAWqJZO', '8BUFSvPXClrjrzC6okWXxw', 2),
  ('MV5UFAfmYs9JVM2RgWq9im', '8BUFSvPXClrjrzC6okWXxw', 3),
  ('PLfibzSzKQfIGZ0ZLP7IfY', '8BUFSvPXClrjrzC6okWXxw', 4),
  ('5e2AbG8F3dzfXjASSxrGfx', '8BUFSvPXClrjrzC6okWXxw', 5),
  
  ('KX8Ajn0lhqiC6ri6pl2kpp', '5dg08p26qGH0uRanKrkYTh', 1),
  ('xAjbIwdgXFQjehOQfXi0qu', '5dg08p26qGH0uRanKrkYTh', 2),
  ('7EGYM3wfXfaJdGLizzStVx', '5dg08p26qGH0uRanKrkYTh', 3),
  ('pk0c2vFeDEyqp1FMAWqJZO', '5dg08p26qGH0uRanKrkYTh', 4),
  ('FQAYrkkreqvKYgwg1SLTKR', '5dg08p26qGH0uRanKrkYTh', 5),
  
  ('Ap0gx09VvCwIhbJPxqEWXS', 'MKlt2vYgSoWDsn92QayJjO', 1),
  ('jgbVUAAY3KOigMrcke8V68', 'MKlt2vYgSoWDsn92QayJjO', 2),
  ('MV5UFAfmYs9JVM2RgWq9im', 'MKlt2vYgSoWDsn92QayJjO', 3),
  ('ACJYUDuzYtMCFlPUGXGpoi', 'MKlt2vYgSoWDsn92QayJjO', 4),
  ('niOZ74IbExeZnBzS1ugSMb', 'MKlt2vYgSoWDsn92QayJjO', 5),
  
  ('JXsSTKHzeh3l5FMRJTyJhi', 'ZWuxQA9aP0dyHizo7DJuzv', 1),
  ('zmRK2DT8oaOncKtVSMCYif', 'ZWuxQA9aP0dyHizo7DJuzv', 2),
  ('Ap0gx09VvCwIhbJPxqEWXS', 'ZWuxQA9aP0dyHizo7DJuzv', 3),
  ('3boXyfeeTPacABRHEKPqjl', 'ZWuxQA9aP0dyHizo7DJuzv', 4),
  ('Xqf72CNN4z8zRHFtWttT0x', 'ZWuxQA9aP0dyHizo7DJuzv', 5);


  
  

-- PRODUCER
-- Check time start phai be hon time end
-- check cu phap sdt
INSERT INTO PRODUCER (Producer_ID,              Name,                         Address,                                           PhoneNumber,    TimeStart,             TimeEnd,               Cost) VALUES 
	                   ('nsUgpSk6hAGMOIeYrm3lwS', 'Meruelo Radio Holdings Ltd', '9550 Firestone Blvd. Suite 105. Downey, CA',      '562.745.2300', '2020-01-01 08:00:00', '2022-01-01 08:00:00', 13000000),
                     ('98Q1H51M1zuxh0rDwCAaaE', 'MediaCo Holding Inc',        '40 Monument Circle, Suite 700. Indianapolis, IN', '317.266.0100', '2020-01-01 08:00:00', '2022-01-01 08:00:00', 10000000);
  
-- RADIO
INSERT INTO RADIO (Name, 			Frequency, R_Producer_ID, 					 Radio_ID, 								 R_CC_ID) VALUES
  								('KDEY-FM', 93.5,      'nsUgpSk6hAGMOIeYrm3lwS', 'XvGXT74BNCFXXhQxAMIpTt', 'Kx4pLbHhvYH3toNuNpzETJ'),
  								('KLOS',    95.5,      'nsUgpSk6hAGMOIeYrm3lwS', 'N4sIDrSdMGjsZ02m5HBpSN', 'sP3JmsIPwFzqxLfZEqwovv'),
  								('KPWR',    106.0,     'nsUgpSk6hAGMOIeYrm3lwS', 'a0X87wRdL9r6qu5sg6uXb3', 'YwhVDpjwDjB67mZt6wgPEZ'),
  								('KLLI',    93.9,      'nsUgpSk6hAGMOIeYrm3lwS', 'qciopFAtaLswoVXDrHpsgs', 'oUyHeE2OQ04UHYBVMzZcFU'),
  								('WQHT',    97,        '98Q1H51M1zuxh0rDwCAaaE', 'ntJ5wqlQ2oazUWkViaCRoa', 'OmXx3xCSGBsABIPE8JvtxI'),
                  ('WBLS',    107.5,     '98Q1H51M1zuxh0rDwCAaaE', 'tTJ0XMU5JMYObG82JEBCo7', 'v1S1D5eaS1injNe0wu5syG');
  
-- RADIO_REGION
INSERT INTO RADIO_REGION (RR_Radio_ID, 						  Region) VALUES
												 ('XvGXT74BNCFXXhQxAMIpTt', 'Inland Empire'),
												 ('XvGXT74BNCFXXhQxAMIpTt', 'Greater Los Angeles'),                         
                         ('N4sIDrSdMGjsZ02m5HBpSN', 'Greater Los Angeles'), 
												 ('a0X87wRdL9r6qu5sg6uXb3', 'Greater Los Angeles'),
 												 ('qciopFAtaLswoVXDrHpsgs', 'Garden Grove'),
 												 ('qciopFAtaLswoVXDrHpsgs', 'Greater Los Angeles'),                         
									       ('ntJ5wqlQ2oazUWkViaCRoa', 'New York metropolitan area'),
									       ('ntJ5wqlQ2oazUWkViaCRoa', 'Garden Grove'),                       
									       ('tTJ0XMU5JMYObG82JEBCo7', 'New York metropolitan area');
-- RADIO_GENRE
INSERT INTO RADIO_GENRE (RG_Radio_ID, 						 Genre) VALUES
												('XvGXT74BNCFXXhQxAMIpTt', 'Classic hip hop'),
												('N4sIDrSdMGjsZ02m5HBpSN', 'Mainstream rock'),
												('a0X87wRdL9r6qu5sg6uXb3', 'Rhythmic crossover'),
												('a0X87wRdL9r6qu5sg6uXb3', 'Mainstream radio'),
												('qciopFAtaLswoVXDrHpsgs', 'Rhythmic crossover'),
												('ntJ5wqlQ2oazUWkViaCRoa', 'Mainstream radio'),
												('tTJ0XMU5JMYObG82JEBCo7', 'Adult R&B');
-- RADIO_SCHEDULE
-- Check time start phai be hon time end, va time start time end date cua no phai trung voi date cua date
INSERT INTO RADIO_SCHEDULE (RS_Radio_ID,              Date,                  TimeStart,             TimeEnd,               Languages) VALUES
													 ('XvGXT74BNCFXXhQxAMIpTt', '2020-11-15 00:00:00', '2020-11-15 07:00:00', '2020-11-15 10:00:00', 'EN'),
													 ('XvGXT74BNCFXXhQxAMIpTt', '2020-11-18 00:00:00', '2020-11-18 07:00:00', '2020-11-18 10:00:00', 'EN'),
													 ('XvGXT74BNCFXXhQxAMIpTt', '2020-11-21 00:00:00', '2020-11-21 07:00:00', '2020-11-21 10:00:00', 'EN'),                           
													 ('N4sIDrSdMGjsZ02m5HBpSN', '2020-11-15 00:00:00', '2020-11-15 09:00:00', '2020-11-15 16:00:00', 'EN'),
													 ('N4sIDrSdMGjsZ02m5HBpSN', '2020-11-19 00:00:00', '2020-11-19 09:00:00', '2020-11-19 16:00:00', 'EN'),
													 ('a0X87wRdL9r6qu5sg6uXb3', '2020-11-15 00:00:00', '2020-11-15 10:00:00', '2020-11-15 20:00:00', 'EN'),
                           ('a0X87wRdL9r6qu5sg6uXb3', '2020-11-18 00:00:00', '2020-11-18 10:00:00', '2020-11-18 20:00:00', 'EN'),
                           ('a0X87wRdL9r6qu5sg6uXb3', '2020-11-21 00:00:00', '2020-11-21 10:00:00', '2020-11-21 20:00:00', 'EN'),
													 ('qciopFAtaLswoVXDrHpsgs', '2020-11-15 00:00:00', '2020-11-15 07:00:00', '2020-11-15 09:00:00', 'EN'),
                           ('qciopFAtaLswoVXDrHpsgs', '2020-11-16 00:00:00', '2020-11-16 07:00:00', '2020-11-16 09:00:00', 'SP'),
                           ('qciopFAtaLswoVXDrHpsgs', '2020-11-17 00:00:00', '2020-11-17 07:00:00', '2020-11-17 09:00:00', 'EN'),
                           ('qciopFAtaLswoVXDrHpsgs', '2020-11-18 00:00:00', '2020-11-18 07:00:00', '2020-11-18 09:00:00', 'SP'),
                           ('qciopFAtaLswoVXDrHpsgs', '2020-11-19 00:00:00', '2020-11-19 07:00:00', '2020-11-19 09:00:00', 'EN'),
												   ('qciopFAtaLswoVXDrHpsgs', '2020-11-20 00:00:00', '2020-11-20 07:00:00', '2020-11-20 09:00:00', 'SP'),
													 ('ntJ5wqlQ2oazUWkViaCRoa', '2020-11-15 00:00:00', '2020-11-15 06:00:00', '2020-11-15 18:00:00', 'EN'),
                           ('ntJ5wqlQ2oazUWkViaCRoa', '2020-11-16 00:00:00', '2020-11-16 06:00:00', '2020-11-16 18:00:00', 'SP'),
													 ('tTJ0XMU5JMYObG82JEBCo7', '2020-11-15 00:00:00', '2020-11-15 00:00:00', '2020-11-15 04:00:00', 'EN'),
                           ('tTJ0XMU5JMYObG82JEBCo7', '2020-11-17 00:00:00', '2020-11-15 00:00:00', '2020-11-15 04:00:00', 'EN'),
                           ('tTJ0XMU5JMYObG82JEBCo7', '2020-11-19 00:00:00', '2020-11-15 00:00:00', '2020-11-15 04:00:00', 'EN');


-- MESSAGE
INSERT INTO MESSAGE 																																							-- 1-5, 6-10,... mỗi cụm là một communicate hay ticket
VALUES 	('kd5QDSDJjcEcs1mhdifUZ1', 'Hello', 														'2021-01-01 06:05:45'),   -- 1			
       	('KUxuvl1u47GhHYLF1AInHn', 'Có gì hông?', 											'2021-01-01 11:17:12'),		-- 2
       	('snxiLIcT85OwggAXcF8qvk', 'Bạn tên gì vậy?', 									'2021-01-01 11:23:52'),		-- 3
       	('5BCgdJoDKKJBiHmJD5govU', 'Tôi tên Hưng', 											'2021-01-01 16:14:52'),		-- 4
       	('O8jU5Q0melWIKXX2oREHCO', 'Vậy à!', 														'2021-01-01 22:41:44'),		-- 5    
       	('bFWH8R9n3Z4dLoJ5hSRUqu', 'Giúp mình mở khóa tài khoản với!', 	'2021-01-04 09:22:04'),		-- 6
       	('VFDt7WKkOLMhUjwYwLvPob', 'Gửi account id của bạn đây', 				'2021-01-04 11:41:22'),		-- 7
       	('nbZj6UgyvJulo6iv1nOnf0', 'nè 1234567', 												'2021-01-04 18:56:55'),		-- 8
       	('NEEimkzpRW09zONdIdlDMX', 'Oke', 															'2021-01-04 19:25:10'),		-- 9
       	('aQqwYqis4R9pLCDqoS8Ulx', 'Hmm', 															'2021-01-04 19:52:33'),		-- 10
       	('FueKwzXl7sknHtWf3UgI0k', 'Chào buổi sáng', 										'2021-02-04 06:07:13'),		-- 11
       	('MQCSdGGQYGtXVMiaKEBEi3', 'Bạn cần giúp gì?', 									'2021-02-04 08:28:28'),		-- 12
       	('Z2piBpMwMi6VJVme5bLTrA', 'Cho mình xin 1 trái táo với', 			'2021-02-04 09:12:21'),		-- 13
       	('slQNYW6cGyWEiNFRmWEgVM', 'Oke', 															'2021-02-04 15:24:29'),		-- 14
       	('ec2Ospup9dLJA3t5rE7ACM', 'Cảm ơn nha!', 											'2021-02-04 19:44:02'),		-- 15
   		 	('VJki94ZAlCx3922QwiiR3C', 'Bạn gì ơi!', 												'2021-02-08 06:42:26'),		-- 16
   		 	('YxZSKJdRuEFCq4KKJgXNuf', '?', 																'2021-02-08 09:35:57'),		-- 17
   		 	('ctqxhSsuTJDf9riRd6ZAJP', 'Bạn có bạn gái chưa?', 							'2021-02-08 16:58:21'),		-- 18
   			('5aSUBZpUeZnTSZgM4S7CMZ', 'Có rồi', 														'2021-02-08 18:56:18'),		-- 19
   			('lRNwPubvnQwFWQl2NBX7lN', 'Hmm buồn!', 												'2021-02-08 20:33:16'),		-- 20
   			('BrDTaZrnv9OFKaiDMXi4ah', 'Admin ơi', 													'2021-03-15 12:11:23'),		-- 21
   			('aJRzoUCvQVxqXanuzKGzFs', 'Nghe nè', 													'2021-03-15 14:15:36'),		-- 22
   			('FJ2EmkPcazk5GMEN1ffm0p', 'Cho mình xin tuổi bạn với', 				'2021-03-15 17:52:48'),		-- 23
   			('B3d46OIMHTCcOig09oDgff', '21 nha', 														'2021-03-15 18:14:06'),		-- 24
   			('bIMhtaglCfG8E67UDza8Lm', 'Oh', 																'2021-03-15 18:51:03'),		-- 25
   			('05mGS7C8WfogvPvzwye0OU', 'Tối nay ăn gì ta?', 								'2021-03-18 16:00:05'),		-- 26
   			('Oe0WvOGnzZUFbiXyFQByr3', 'Sao cũng được', 										'2021-03-18 16:50:48'),		-- 27
   			('GgI6erQPY3cmQ9XxxDZEsz', 'Ăn mì nha', 												'2021-03-18 18:51:29'),		-- 28
   			('iGl1KBhCiiE9cOxGTLZJpW', 'Mì nóng lắm', 											'2021-03-18 21:42:58'),		-- 29
   			('AVmU3prEYQiMQDiMQEEbBd', 'Vậy nhịn đi bro', 									'2021-03-18 21:51:29'),		-- 30
   			('pwVdTYy8xbO6datD6dJgDB', 'Nào bạn rước mình?', 								'2021-05-01 14:50:03'),		-- 31
   			('X9uncwId4uY7ON4uWDwdFM', 'Rước?', 														'2021-05-01 14:58:39'),		-- 32
   			('s45ZD3V4BzuUbwb4VDOSFF', 'À mình nhắn lộn', 									'2021-05-01 15:01:51'),		-- 33
   			('qIAlcZExgX62eD1Dh71jP7', '???', 															'2021-05-01 18:12:40'),		-- 34
   			('c9LgmlAj9x49HjGOKRqKif', 'Làm gì căng', 											'2021-05-01 20:19:08'),		-- 35
   			('9AWha1voRVQX7ExV4sHam1', '1 2 3 4 ...', 											'2021-05-15 08:49:10'),		-- 36
   			('PoH4OIr4sTov7GqJ5JpUod', 'Chào bạn', 													'2021-05-15 11:51:10'),		-- 37
   			('iUPkLVcuY67Feo4ZRQ76ku', 'Chào bạn lại', 											'2021-05-15 14:59:58'),		-- 38
   			('YrTVdUOHLcjLDpzePmUViN', 'Haizz', 														'2021-05-15 20:56:22'),		-- 39
   			('Hyu7Dlz2a3tJGjOtC8Pqk9', 'Bye bạn', 													'2021-05-15 21:16:14'),		-- 40
   			('D73siaJWwJZKaeNUjWTxED', 'Đằng này chào đằng ấy', 						'2021-06-15 09:23:46'),		-- 41
   			('LX6m8DcYq02LR2n04Zitlh', 'Đằng ấy xin chào lại', 							'2021-06-15 12:04:29'),		-- 42
   			('KzrUbqKie1KhaZYzvcTFI3', 'Đằng này muốn hỏi cái', 						'2021-06-15 12:19:31'),		-- 43
   			('J5xLROUwrj5KRwn4VLhpeI', 'Đằng ấy hỏi gì?', 									'2021-06-15 13:23:17'),		-- 44
   			('88FiAw9kxw5OLTGKphtGNa', 'Bao giờ mới yêu lại một người?', 		'2021-06-15 22:59:42'),		-- 45
   			('mr4F521jBa8hmeIc4jlSfG', 'Sắp xong rồi bro ạ', 								'2021-11-01 06:07:32'),		-- 46
   			('HEMRb5nSR534uHwPswgPLF', 'Toang vậy', 												'2021-11-01 13:02:21'),		-- 47
   			('2R3up0Yc7JIBZ52zP1WpWM', 'Haizz', 														'2021-11-01 16:42:00'),		-- 48
   			('maZ6fosglhSkLnZZhQxdxD', 'Đừng buồn', 												'2021-11-01 19:59:16'),		-- 49
   			('boETKblSm052aPQQmyhKLm', 'Buồn gì bro?', 											'2021-11-01 21:20:54');		-- 50



-- TICKET
INSERT INTO TICKET
VALUES 	('OEf1RQJRCd9F4rOKkW130d', 'ihHTsyJMvCAHbs1jIaJ61i', 'Hỏi tên', '2020-12-31 06:05:45', true), 						-- 1  <-> message 1-5
				('4lYuyC2C93BLq8HZJVRMt9', 'eUByfMoDmM3X9qC7ocArcC', 'Mở khóa tài khoản', '2021-01-03 09:22:04', true), 	-- 2  <-> message 6-10
        ('sn14dJLMigwF7YRisVMiHY', 'eUByfMoDmM3X9qC7ocArcC', 'Xin trái táo', '2021-02-03 06:07:13', true), 				-- 3  <-> message 11-15
        ('zpOI3Yu7dQ3va2kQ2pxD8C', 'EclNfpBMvxWxyHJkuQeTLe', 'Hỏi có bạn gái chưa', '2021-02-07 06:42:26', true), -- 4  <-> message 16-20
        ('gxOSuGt93eD6VTC3Q7AOgi', 'EclNfpBMvxWxyHJkuQeTLe', 'Hỏi tuổi', '2021-03-14 12:11:23', true), 						-- 5  <-> message 21-25
        ('NVndXaEuUpxDkjTpqjEsaz', 'EclNfpBMvxWxyHJkuQeTLe', 'Tối nay ăn gì', '2021-03-17 16:00:05', true), 			-- 6  <-> message 26-30
        ('islWWVx956Yw3vhni1z62H', 'zbE5y24hqTKL6lPGvVAmgX', 'Nhắn lộn', '2021-04-30 14:50:03', true), 						-- 7  <-> message 31-35
        ('e8MGDx0hEjwnc7kMMhNQQv', 'zbE5y24hqTKL6lPGvVAmgX', 'Chào hỏi', '2021-05-14 08:49:10', true), 						-- 8  <-> message 36-40
        ('YaTlVEPxdlzDBx0LNpuqkf', 'zbE5y24hqTKL6lPGvVAmgX', 'Câu chuyện 2 đằng', '2021-06-14 09:23:46', true), 	-- 9  <-> message 41-45
        ('Ut8QmCj3XHkjQVYfJIsjX1', 'zbE5y24hqTKL6lPGvVAmgX', 'Xong rồi', '2021-10-31 06:07:32', true), 						-- 10 <-> message 46-50
        ('y7Dwqil3QKhtiNSpJrM1N0', 'ERJqJgPmQYhv3ex35fODJ1', 'Lấy lại thông tin', '2021-11-18 18:12:57', false), 	-- 11
        ('AqCGsRnQ33ZseQUicdEehX', 'VSacmSRug2jenc6nblThah', 'Cập nhật bài hát', '2021-11-29 11:02:10', false), 	-- 12
        ('TYqHZXGdGuLsUkDMNI3Qj9', 'GVOZ6cHysyBnq25gZQv5GW', 'Hệ thống bị lỗi', '2021-11-19 20:18:14', false), 		-- 13
        ('IMcAo4Q7HHD7lGmXzcgFZ2', 'doT6m44UpIAP7uUBzBOUFQ', 'Khi nào có update', '2021-11-06 05:03:20', false), 	-- 14
        ('yri9Wm46KgB66y4d6vrVlV', 'doT6m44UpIAP7uUBzBOUFQ', 'Khi nào trời mưa', '2021-11-20 05:07:18', false), 	-- 15
        ('g7fkgiSjKtvW2Ml8vit0nW', 'doT6m44UpIAP7uUBzBOUFQ', 'Xin 1 cây hoa', '2021-11-09 10:08:08', false), 			-- 16
        ('YVOE1fMBNORvSeS5QmNYkr', 'doT6m44UpIAP7uUBzBOUFQ', 'Cây táo nở hoa', '2021-11-16 02:37:16', false), 		-- 17
        ('JBFeoe7CBm8ZtfCfdfDBQE', 'doT6m44UpIAP7uUBzBOUFQ', 'Hôm qua đi lạc', '2021-11-05 23:36:13', false), 		-- 18
        ('Hk89Ou5EJvSgsWz0LeQTgB', 'doT6m44UpIAP7uUBzBOUFQ', 'Một Hai Ba', '2021-11-21 10:17:24', false), 				-- 19
        ('uuZtDBftWqX4l11OqempPy', 'doT6m44UpIAP7uUBzBOUFQ', 'Xin nhẹ', '2021-11-11 06:44:37', false); 						-- 20



-- COMMUNICATE
INSERT INTO COMMUNICATE
VALUES 	('OEf1RQJRCd9F4rOKkW130d', 'ihHTsyJMvCAHbs1jIaJ61i', 'kd5QDSDJjcEcs1mhdifUZ1', 'hI4YTRnJhW7bxSoZi8X4iz'), 	-- ticket 1	  <-> 	message 1   <->  admin 1	
				('OEf1RQJRCd9F4rOKkW130d', 'ihHTsyJMvCAHbs1jIaJ61i', 'KUxuvl1u47GhHYLF1AInHn', 'hI4YTRnJhW7bxSoZi8X4iz'), 	-- ticket 1	  <-> 	message 2   <->  admin 1
        ('OEf1RQJRCd9F4rOKkW130d', 'ihHTsyJMvCAHbs1jIaJ61i', 'snxiLIcT85OwggAXcF8qvk', 'hI4YTRnJhW7bxSoZi8X4iz'), 	-- ticket 1	  <-> 	message 3   <->  admin 1
        ('OEf1RQJRCd9F4rOKkW130d', 'ihHTsyJMvCAHbs1jIaJ61i', '5BCgdJoDKKJBiHmJD5govU', 'hI4YTRnJhW7bxSoZi8X4iz'), 	-- ticket 1	  <-> 	message 4   <->  admin 1
        ('OEf1RQJRCd9F4rOKkW130d', 'ihHTsyJMvCAHbs1jIaJ61i', 'O8jU5Q0melWIKXX2oREHCO', 'hI4YTRnJhW7bxSoZi8X4iz'), 	-- ticket 1	  <-> 	message 5   <->  admin 1
				('4lYuyC2C93BLq8HZJVRMt9', 'eUByfMoDmM3X9qC7ocArcC', 'bFWH8R9n3Z4dLoJ5hSRUqu', 'PQ69RdEJO49ZHb5tpctpOz'), 	-- ticket 2	  <-> 	message 6   <->  admin 2
        ('4lYuyC2C93BLq8HZJVRMt9', 'eUByfMoDmM3X9qC7ocArcC', 'VFDt7WKkOLMhUjwYwLvPob', 'PQ69RdEJO49ZHb5tpctpOz'), 	-- ticket 2	  <-> 	message 7   <->  admin 2
        ('4lYuyC2C93BLq8HZJVRMt9', 'eUByfMoDmM3X9qC7ocArcC', 'nbZj6UgyvJulo6iv1nOnf0', 'PQ69RdEJO49ZHb5tpctpOz'), 	-- ticket 2	  <-> 	message 8   <->  admin 2
        ('4lYuyC2C93BLq8HZJVRMt9', 'eUByfMoDmM3X9qC7ocArcC', 'NEEimkzpRW09zONdIdlDMX', 'PQ69RdEJO49ZHb5tpctpOz'), 	-- ticket 2	  <-> 	message 9   <->  admin 2
        ('4lYuyC2C93BLq8HZJVRMt9', 'eUByfMoDmM3X9qC7ocArcC', 'aQqwYqis4R9pLCDqoS8Ulx', 'PQ69RdEJO49ZHb5tpctpOz'), 	-- ticket 2	  <-> 	message 10  <->  admin 2
        ('sn14dJLMigwF7YRisVMiHY', 'eUByfMoDmM3X9qC7ocArcC', 'FueKwzXl7sknHtWf3UgI0k', 'PQ69RdEJO49ZHb5tpctpOz'), 	-- ticket 3   <-> 	message 11  <->  admin 2
        ('sn14dJLMigwF7YRisVMiHY', 'eUByfMoDmM3X9qC7ocArcC', 'MQCSdGGQYGtXVMiaKEBEi3', 'PQ69RdEJO49ZHb5tpctpOz'), 	-- ticket 3   <-> 	message 12  <->  admin 2
        ('sn14dJLMigwF7YRisVMiHY', 'eUByfMoDmM3X9qC7ocArcC', 'Z2piBpMwMi6VJVme5bLTrA', 'PQ69RdEJO49ZHb5tpctpOz'), 	-- ticket 3   <-> 	message 13  <->  admin 2
        ('sn14dJLMigwF7YRisVMiHY', 'eUByfMoDmM3X9qC7ocArcC', 'slQNYW6cGyWEiNFRmWEgVM', 'PQ69RdEJO49ZHb5tpctpOz'), 	-- ticket 3   <-> 	message 14  <->  admin 2
        ('sn14dJLMigwF7YRisVMiHY', 'eUByfMoDmM3X9qC7ocArcC', 'ec2Ospup9dLJA3t5rE7ACM', 'PQ69RdEJO49ZHb5tpctpOz'), 	-- ticket 3   <-> 	message 15  <->  admin 2
        ('zpOI3Yu7dQ3va2kQ2pxD8C', 'EclNfpBMvxWxyHJkuQeTLe', 'VJki94ZAlCx3922QwiiR3C', 'tH6NcFBhCD6ojFct6IDiuA'), 	-- ticket 4   <-> 	message 16 	<->  admin 3
        ('zpOI3Yu7dQ3va2kQ2pxD8C', 'EclNfpBMvxWxyHJkuQeTLe', 'YxZSKJdRuEFCq4KKJgXNuf', 'tH6NcFBhCD6ojFct6IDiuA'), 	-- ticket 4   <-> 	message 17 	<->  admin 3
        ('zpOI3Yu7dQ3va2kQ2pxD8C', 'EclNfpBMvxWxyHJkuQeTLe', 'ctqxhSsuTJDf9riRd6ZAJP', 'tH6NcFBhCD6ojFct6IDiuA'), 	-- ticket 4   <-> 	message 18 	<->  admin 3
        ('zpOI3Yu7dQ3va2kQ2pxD8C', 'EclNfpBMvxWxyHJkuQeTLe', '5aSUBZpUeZnTSZgM4S7CMZ', 'tH6NcFBhCD6ojFct6IDiuA'), 	-- ticket 4   <-> 	message 19 	<->  admin 3
        ('zpOI3Yu7dQ3va2kQ2pxD8C', 'EclNfpBMvxWxyHJkuQeTLe', 'lRNwPubvnQwFWQl2NBX7lN', 'tH6NcFBhCD6ojFct6IDiuA'), 	-- ticket 4   <-> 	message 20 	<->  admin 3
        ('gxOSuGt93eD6VTC3Q7AOgi', 'EclNfpBMvxWxyHJkuQeTLe', 'BrDTaZrnv9OFKaiDMXi4ah', 'tH6NcFBhCD6ojFct6IDiuA'), 	-- ticket 5   <-> 	message 21 	<->  admin 3
        ('gxOSuGt93eD6VTC3Q7AOgi', 'EclNfpBMvxWxyHJkuQeTLe', 'aJRzoUCvQVxqXanuzKGzFs', 'tH6NcFBhCD6ojFct6IDiuA'), 	-- ticket 5   <-> 	message 22 	<->  admin 3
        ('gxOSuGt93eD6VTC3Q7AOgi', 'EclNfpBMvxWxyHJkuQeTLe', 'FJ2EmkPcazk5GMEN1ffm0p', 'tH6NcFBhCD6ojFct6IDiuA'), 	-- ticket 5   <-> 	message 23 	<->  admin 3
        ('gxOSuGt93eD6VTC3Q7AOgi', 'EclNfpBMvxWxyHJkuQeTLe', 'B3d46OIMHTCcOig09oDgff', 'tH6NcFBhCD6ojFct6IDiuA'), 	-- ticket 5   <-> 	message 24 	<->  admin 3
        ('gxOSuGt93eD6VTC3Q7AOgi', 'EclNfpBMvxWxyHJkuQeTLe', 'bIMhtaglCfG8E67UDza8Lm', 'tH6NcFBhCD6ojFct6IDiuA'), 	-- ticket 5   <-> 	message 25 	<->  admin 3
        ('NVndXaEuUpxDkjTpqjEsaz', 'EclNfpBMvxWxyHJkuQeTLe', '05mGS7C8WfogvPvzwye0OU', 'tH6NcFBhCD6ojFct6IDiuA'), 	-- ticket 6   <-> 	message 26 	<->  admin 3
        ('NVndXaEuUpxDkjTpqjEsaz', 'EclNfpBMvxWxyHJkuQeTLe', 'Oe0WvOGnzZUFbiXyFQByr3', 'tH6NcFBhCD6ojFct6IDiuA'), 	-- ticket 6   <-> 	message 27 	<->  admin 3
        ('NVndXaEuUpxDkjTpqjEsaz', 'EclNfpBMvxWxyHJkuQeTLe', 'GgI6erQPY3cmQ9XxxDZEsz', 'tH6NcFBhCD6ojFct6IDiuA'), 	-- ticket 6   <-> 	message 28 	<->  admin 3
        ('NVndXaEuUpxDkjTpqjEsaz', 'EclNfpBMvxWxyHJkuQeTLe', 'iGl1KBhCiiE9cOxGTLZJpW', 'tH6NcFBhCD6ojFct6IDiuA'), 	-- ticket 6   <-> 	message 29 	<->  admin 3
        ('NVndXaEuUpxDkjTpqjEsaz', 'EclNfpBMvxWxyHJkuQeTLe', 'AVmU3prEYQiMQDiMQEEbBd', 'tH6NcFBhCD6ojFct6IDiuA'), 	-- ticket 6   <-> 	message 30 	<->  admin 3
        ('islWWVx956Yw3vhni1z62H', 'zbE5y24hqTKL6lPGvVAmgX', 'pwVdTYy8xbO6datD6dJgDB', 'nkCiJ3UO9kP7699CcQb61S'), 	-- ticket 7   <-> 	message 31 	<->  admin 4
        ('islWWVx956Yw3vhni1z62H', 'zbE5y24hqTKL6lPGvVAmgX', 'X9uncwId4uY7ON4uWDwdFM', 'nkCiJ3UO9kP7699CcQb61S'), 	-- ticket 7   <-> 	message 32 	<->  admin 4
        ('islWWVx956Yw3vhni1z62H', 'zbE5y24hqTKL6lPGvVAmgX', 's45ZD3V4BzuUbwb4VDOSFF', 'nkCiJ3UO9kP7699CcQb61S'), 	-- ticket 7   <-> 	message 33 	<->  admin 4
        ('islWWVx956Yw3vhni1z62H', 'zbE5y24hqTKL6lPGvVAmgX', 'qIAlcZExgX62eD1Dh71jP7', 'nkCiJ3UO9kP7699CcQb61S'), 	-- ticket 7   <-> 	message 34 	<->  admin 4
        ('islWWVx956Yw3vhni1z62H', 'zbE5y24hqTKL6lPGvVAmgX', 'c9LgmlAj9x49HjGOKRqKif', 'nkCiJ3UO9kP7699CcQb61S'), 	-- ticket 7   <-> 	message 35 	<->  admin 4
        ('e8MGDx0hEjwnc7kMMhNQQv', 'zbE5y24hqTKL6lPGvVAmgX', '9AWha1voRVQX7ExV4sHam1', 'nkCiJ3UO9kP7699CcQb61S'), 	-- ticket 8   <-> 	message 36 	<->  admin 4
        ('e8MGDx0hEjwnc7kMMhNQQv', 'zbE5y24hqTKL6lPGvVAmgX', 'PoH4OIr4sTov7GqJ5JpUod', 'nkCiJ3UO9kP7699CcQb61S'), 	-- ticket 8   <-> 	message 37 	<->  admin 4
        ('e8MGDx0hEjwnc7kMMhNQQv', 'zbE5y24hqTKL6lPGvVAmgX', 'iUPkLVcuY67Feo4ZRQ76ku', 'nkCiJ3UO9kP7699CcQb61S'), 	-- ticket 8   <-> 	message 38 	<->  admin 4
        ('e8MGDx0hEjwnc7kMMhNQQv', 'zbE5y24hqTKL6lPGvVAmgX', 'YrTVdUOHLcjLDpzePmUViN', 'nkCiJ3UO9kP7699CcQb61S'), 	-- ticket 8   <-> 	message 39 	<->  admin 4
        ('e8MGDx0hEjwnc7kMMhNQQv', 'zbE5y24hqTKL6lPGvVAmgX', 'Hyu7Dlz2a3tJGjOtC8Pqk9', 'nkCiJ3UO9kP7699CcQb61S'), 	-- ticket 8   <-> 	message 40 	<->  admin 4
        ('YaTlVEPxdlzDBx0LNpuqkf', 'zbE5y24hqTKL6lPGvVAmgX', 'D73siaJWwJZKaeNUjWTxED', 'nkCiJ3UO9kP7699CcQb61S'), 	-- ticket 9   <-> 	message 41 	<->  admin 4
        ('YaTlVEPxdlzDBx0LNpuqkf', 'zbE5y24hqTKL6lPGvVAmgX', 'LX6m8DcYq02LR2n04Zitlh', 'nkCiJ3UO9kP7699CcQb61S'), 	-- ticket 9   <-> 	message 42 	<->  admin 4
        ('YaTlVEPxdlzDBx0LNpuqkf', 'zbE5y24hqTKL6lPGvVAmgX', 'KzrUbqKie1KhaZYzvcTFI3', 'nkCiJ3UO9kP7699CcQb61S'), 	-- ticket 9   <-> 	message 43 	<->  admin 4
        ('YaTlVEPxdlzDBx0LNpuqkf', 'zbE5y24hqTKL6lPGvVAmgX', 'J5xLROUwrj5KRwn4VLhpeI', 'nkCiJ3UO9kP7699CcQb61S'), 	-- ticket 9   <-> 	message 44 	<->  admin 4
        ('YaTlVEPxdlzDBx0LNpuqkf', 'zbE5y24hqTKL6lPGvVAmgX', '88FiAw9kxw5OLTGKphtGNa', 'nkCiJ3UO9kP7699CcQb61S'), 	-- ticket 9   <-> 	message 45 	<->  admin 4
        ('Ut8QmCj3XHkjQVYfJIsjX1', 'zbE5y24hqTKL6lPGvVAmgX', 'mr4F521jBa8hmeIc4jlSfG', 'nkCiJ3UO9kP7699CcQb61S'), 	-- ticket 10  <-> 	message 46 	<->  admin 4
        ('Ut8QmCj3XHkjQVYfJIsjX1', 'zbE5y24hqTKL6lPGvVAmgX', 'HEMRb5nSR534uHwPswgPLF', 'nkCiJ3UO9kP7699CcQb61S'), 	-- ticket 10  <-> 	message 47 	<->  admin 4
        ('Ut8QmCj3XHkjQVYfJIsjX1', 'zbE5y24hqTKL6lPGvVAmgX', '2R3up0Yc7JIBZ52zP1WpWM', 'nkCiJ3UO9kP7699CcQb61S'), 	-- ticket 10  <-> 	message 48 	<->  admin 4
        ('Ut8QmCj3XHkjQVYfJIsjX1', 'zbE5y24hqTKL6lPGvVAmgX', 'maZ6fosglhSkLnZZhQxdxD', 'nkCiJ3UO9kP7699CcQb61S'), 	-- ticket 10  <-> 	message 49 	<->  admin 4
        ('Ut8QmCj3XHkjQVYfJIsjX1', 'zbE5y24hqTKL6lPGvVAmgX', 'boETKblSm052aPQQmyhKLm', 'nkCiJ3UO9kP7699CcQb61S'); 	-- ticket 10  <-> 	message 50 	<->  admin 4








-- LISTENED_BY
INSERT INTO LISTENED_BY (LB_Track_ID,              LB_User_ID, 							 NumberOfStream) VALUES 	
												('7EGYM3wfXfaJdGLizzStVx', 'ihHTsyJMvCAHbs1jIaJ61i', 15),
												('7EGYM3wfXfaJdGLizzStVx', 'doT6m44UpIAP7uUBzBOUFQ', 10),
												('7EGYM3wfXfaJdGLizzStVx', '7qSNhvIkhjXc0JmCgyNAKV', 20),
                        
												('xRbSNEemd79wUXjhpdtnNf', 'zbE5y24hqTKL6lPGvVAmgX', 23),
												('xRbSNEemd79wUXjhpdtnNf', '3NKjcPT0mjG2HZtkG0jsF2', 30),
												('xRbSNEemd79wUXjhpdtnNf', 'VSacmSRug2jenc6nblThah', 100),
												('xRbSNEemd79wUXjhpdtnNf', 'ERJqJgPmQYhv3ex35fODJ1', 10),
                        
                        ('pk0c2vFeDEyqp1FMAWqJZO', 'GVOZ6cHysyBnq25gZQv5GW', 45),
                        ('pk0c2vFeDEyqp1FMAWqJZO', 'KjqlxOkt7vzY8NLzfbNlHu', 55),
                        ('pk0c2vFeDEyqp1FMAWqJZO', '3NKjcPT0mjG2HZtkG0jsF2', 85),
                        ('pk0c2vFeDEyqp1FMAWqJZO', '8G2oicxUetr7ykVXGetWI2', 105),
                        ('pk0c2vFeDEyqp1FMAWqJZO', '7qSNhvIkhjXc0JmCgyNAKV', 15),
                        
        								('24AdSae2NKNNhYWJvU13ah', 'doT6m44UpIAP7uUBzBOUFQ', 45),
        								('24AdSae2NKNNhYWJvU13ah', '7qSNhvIkhjXc0JmCgyNAKV', 100),
        								('24AdSae2NKNNhYWJvU13ah', 'ERJqJgPmQYhv3ex35fODJ1', 69),
        								('24AdSae2NKNNhYWJvU13ah', 'eUByfMoDmM3X9qC7ocArcC', 75),
        								('24AdSae2NKNNhYWJvU13ah', 'VSacmSRug2jenc6nblThah', 80),
        								('24AdSae2NKNNhYWJvU13ah', 'GVOZ6cHysyBnq25gZQv5GW', 100),
                        
        								('FQAYrkkreqvKYgwg1SLTKR', '3NKjcPT0mjG2HZtkG0jsF2', 45),
        								('FQAYrkkreqvKYgwg1SLTKR', '8G2oicxUetr7ykVXGetWI2', 100),
        								('FQAYrkkreqvKYgwg1SLTKR', '7qSNhvIkhjXc0JmCgyNAKV', 20),
        								('FQAYrkkreqvKYgwg1SLTKR', 'doT6m44UpIAP7uUBzBOUFQ', 39),
                        
        								('6adDYqIKXOZ8NZN7Ewh0VU', 'doT6m44UpIAP7uUBzBOUFQ', 45),
        								('6adDYqIKXOZ8NZN7Ewh0VU', 'EclNfpBMvxWxyHJkuQeTLe', 50),
        								('6adDYqIKXOZ8NZN7Ewh0VU', 'VSacmSRug2jenc6nblThah', 49),
        								('6adDYqIKXOZ8NZN7Ewh0VU', 'ihHTsyJMvCAHbs1jIaJ61i', 10),
        								('6adDYqIKXOZ8NZN7Ewh0VU', 'zbE5y24hqTKL6lPGvVAmgX', 15),
        								('6adDYqIKXOZ8NZN7Ewh0VU', '3NKjcPT0mjG2HZtkG0jsF2', 20),
                        
                        ('rUUOR6IWkri1C6wbg1GcAC', 'ihHTsyJMvCAHbs1jIaJ61i', 50),
                        ('rUUOR6IWkri1C6wbg1GcAC', 'GVOZ6cHysyBnq25gZQv5GW', 100),
                        ('rUUOR6IWkri1C6wbg1GcAC', '8G2oicxUetr7ykVXGetWI2', 80),
                        ('rUUOR6IWkri1C6wbg1GcAC', '3NKjcPT0mjG2HZtkG0jsF2', 70),
                        ('rUUOR6IWkri1C6wbg1GcAC', 'VSacmSRug2jenc6nblThah', 60),
                        ('rUUOR6IWkri1C6wbg1GcAC', '7qSNhvIkhjXc0JmCgyNAKV', 50),

                        ('MV5UFAfmYs9JVM2RgWq9im', 'ihHTsyJMvCAHbs1jIaJ61i', 12),
                        ('MV5UFAfmYs9JVM2RgWq9im', 'EclNfpBMvxWxyHJkuQeTLe', 45),
                        ('MV5UFAfmYs9JVM2RgWq9im', 'ERJqJgPmQYhv3ex35fODJ1', 10),
                        ('MV5UFAfmYs9JVM2RgWq9im', 'GVOZ6cHysyBnq25gZQv5GW', 4),
                        ('MV5UFAfmYs9JVM2RgWq9im', 'KjqlxOkt7vzY8NLzfbNlHu', 3),
                        
                        ('ACJYUDuzYtMCFlPUGXGpoi', 'ihHTsyJMvCAHbs1jIaJ61i', 60),
                        ('ACJYUDuzYtMCFlPUGXGpoi', 'eUByfMoDmM3X9qC7ocArcC', 90),
                        ('ACJYUDuzYtMCFlPUGXGpoi', 'EclNfpBMvxWxyHJkuQeTLe', 10),
                        ('ACJYUDuzYtMCFlPUGXGpoi', 'zbE5y24hqTKL6lPGvVAmgX', 15),
                        ('ACJYUDuzYtMCFlPUGXGpoi', 'ERJqJgPmQYhv3ex35fODJ1', 20),
                        ('ACJYUDuzYtMCFlPUGXGpoi', 'VSacmSRug2jenc6nblThah', 5),
                        ('ACJYUDuzYtMCFlPUGXGpoi', 'GVOZ6cHysyBnq25gZQv5GW', 30),
                        ('ACJYUDuzYtMCFlPUGXGpoi', 'KjqlxOkt7vzY8NLzfbNlHu', 50),
                        ('ACJYUDuzYtMCFlPUGXGpoi', '3NKjcPT0mjG2HZtkG0jsF2', 45),
                        
                        ('fguB6VGCjK43FLF8hYhSw8', 'VSacmSRug2jenc6nblThah', 105),
                        ('fguB6VGCjK43FLF8hYhSw8', 'EclNfpBMvxWxyHJkuQeTLe', 12),
                        ('fguB6VGCjK43FLF8hYhSw8', 'ihHTsyJMvCAHbs1jIaJ61i', 36),
                        ('fguB6VGCjK43FLF8hYhSw8', 'KjqlxOkt7vzY8NLzfbNlHu', 78),
                        ('fguB6VGCjK43FLF8hYhSw8', '3NKjcPT0mjG2HZtkG0jsF2', 9),
                        ('fguB6VGCjK43FLF8hYhSw8', '8G2oicxUetr7ykVXGetWI2', 19),
                        ('fguB6VGCjK43FLF8hYhSw8', 'zbE5y24hqTKL6lPGvVAmgX', 21),
                                               
                        ('N63VmjFlHl5ddaINdF7kdL', 'zbE5y24hqTKL6lPGvVAmgX', 30),
                        ('N63VmjFlHl5ddaINdF7kdL', 'ihHTsyJMvCAHbs1jIaJ61i', 31),
                        ('N63VmjFlHl5ddaINdF7kdL', 'EclNfpBMvxWxyHJkuQeTLe', 57),
                        ('N63VmjFlHl5ddaINdF7kdL', 'KjqlxOkt7vzY8NLzfbNlHu', 89),
                        ('N63VmjFlHl5ddaINdF7kdL', 'VSacmSRug2jenc6nblThah', 96),
                        ('N63VmjFlHl5ddaINdF7kdL', '3NKjcPT0mjG2HZtkG0jsF2', 63),
                        ('N63VmjFlHl5ddaINdF7kdL', '7qSNhvIkhjXc0JmCgyNAKV', 30),
                                     
                        ('niOZ74IbExeZnBzS1ugSMb', 'ERJqJgPmQYhv3ex35fODJ1', 45),
                        ('niOZ74IbExeZnBzS1ugSMb', 'doT6m44UpIAP7uUBzBOUFQ', 50),
                        ('niOZ74IbExeZnBzS1ugSMb', '7qSNhvIkhjXc0JmCgyNAKV', 100),
                        ('niOZ74IbExeZnBzS1ugSMb', 'KjqlxOkt7vzY8NLzfbNlHu', 12),
                        ('niOZ74IbExeZnBzS1ugSMb', '3NKjcPT0mjG2HZtkG0jsF2', 50),
                        ('niOZ74IbExeZnBzS1ugSMb', 'ihHTsyJMvCAHbs1jIaJ61i', 10),
                        ('niOZ74IbExeZnBzS1ugSMb', 'zbE5y24hqTKL6lPGvVAmgX', 15),
                        
                        
                        ('qFQfiAc9w9NP5RrxbIHpyD', '8G2oicxUetr7ykVXGetWI2', 20),
                        ('qFQfiAc9w9NP5RrxbIHpyD', 'KjqlxOkt7vzY8NLzfbNlHu', 35),
                        ('qFQfiAc9w9NP5RrxbIHpyD', 'zbE5y24hqTKL6lPGvVAmgX', 45),
                        ('qFQfiAc9w9NP5RrxbIHpyD', 'ihHTsyJMvCAHbs1jIaJ61i', 30),
                        ('qFQfiAc9w9NP5RrxbIHpyD', 'doT6m44UpIAP7uUBzBOUFQ', 10),
                  
                        
                        ('xGEF8oT2mrGODVOzY6ZgjN', 'ERJqJgPmQYhv3ex35fODJ1', 10),
                        ('xGEF8oT2mrGODVOzY6ZgjN', 'GVOZ6cHysyBnq25gZQv5GW', 12),
                        ('xGEF8oT2mrGODVOzY6ZgjN', '8G2oicxUetr7ykVXGetWI2', 14),
                        
                        ('YtZUvwmzzrxEUC6wnjln1k', 'eUByfMoDmM3X9qC7ocArcC', 50),    
                        ('YtZUvwmzzrxEUC6wnjln1k', 'VSacmSRug2jenc6nblThah', 45),
                        ('YtZUvwmzzrxEUC6wnjln1k', 'doT6m44UpIAP7uUBzBOUFQ', 40),
                        ('YtZUvwmzzrxEUC6wnjln1k', 'zbE5y24hqTKL6lPGvVAmgX', 10),
                        
                        ('MrdQ5vmGQYM7PsqOx1hXuM', 'VSacmSRug2jenc6nblThah', 15),
                        ('MrdQ5vmGQYM7PsqOx1hXuM', 'doT6m44UpIAP7uUBzBOUFQ', 20),
                        ('MrdQ5vmGQYM7PsqOx1hXuM', 'ihHTsyJMvCAHbs1jIaJ61i', 30),
                        ('MrdQ5vmGQYM7PsqOx1hXuM', 'EclNfpBMvxWxyHJkuQeTLe', 20),
                        ('MrdQ5vmGQYM7PsqOx1hXuM', 'eUByfMoDmM3X9qC7ocArcC', 15),
                        ('MrdQ5vmGQYM7PsqOx1hXuM', '7qSNhvIkhjXc0JmCgyNAKV', 100),
                        
                        
                        ('098CJ8SFqACjBbZe07IcrW', 'KjqlxOkt7vzY8NLzfbNlHu', 20),
                        ('098CJ8SFqACjBbZe07IcrW', '3NKjcPT0mjG2HZtkG0jsF2', 10),
                        ('098CJ8SFqACjBbZe07IcrW', '8G2oicxUetr7ykVXGetWI2', 15),
                        ('098CJ8SFqACjBbZe07IcrW', 'ERJqJgPmQYhv3ex35fODJ1', 20),
                        
                        
                        ('VCR5iCzBtdQ6ZZfZ7MNNH5', 'ihHTsyJMvCAHbs1jIaJ61i', 15),
                        ('VCR5iCzBtdQ6ZZfZ7MNNH5', 'doT6m44UpIAP7uUBzBOUFQ', 10),
                        ('VCR5iCzBtdQ6ZZfZ7MNNH5', 'KjqlxOkt7vzY8NLzfbNlHu', 20),
                        ('VCR5iCzBtdQ6ZZfZ7MNNH5', 'eUByfMoDmM3X9qC7ocArcC', 30),
                        ('VCR5iCzBtdQ6ZZfZ7MNNH5', '3NKjcPT0mjG2HZtkG0jsF2', 45),
                        
                        
                        ('omzBZOkVDCUwGE07w1oftu', 'eUByfMoDmM3X9qC7ocArcC', 10),
                        ('omzBZOkVDCUwGE07w1oftu', 'EclNfpBMvxWxyHJkuQeTLe', 20),
                        ('omzBZOkVDCUwGE07w1oftu', 'zbE5y24hqTKL6lPGvVAmgX', 15),
                        ('omzBZOkVDCUwGE07w1oftu', '8G2oicxUetr7ykVXGetWI2', 60),
                        ('omzBZOkVDCUwGE07w1oftu', '7qSNhvIkhjXc0JmCgyNAKV', 50),
                        
                        
                        ('pCJ9gtVBMeB164CUrgMdSm', 'ihHTsyJMvCAHbs1jIaJ61i', 10),
                        ('pCJ9gtVBMeB164CUrgMdSm', 'KjqlxOkt7vzY8NLzfbNlHu', 20),
                        ('pCJ9gtVBMeB164CUrgMdSm', 'ERJqJgPmQYhv3ex35fODJ1', 30),
                        
                        
                        ('AHs4jAWhBNtGpR6Mt9kPQz', 'KjqlxOkt7vzY8NLzfbNlHu', 45),
                        ('AHs4jAWhBNtGpR6Mt9kPQz', '3NKjcPT0mjG2HZtkG0jsF2', 50),
                        ('AHs4jAWhBNtGpR6Mt9kPQz', 'VSacmSRug2jenc6nblThah', 30),
                        ('AHs4jAWhBNtGpR6Mt9kPQz', '7qSNhvIkhjXc0JmCgyNAKV', 35),
                        
                        
                        ('evlbeGWSXhvfGyjRIAvk6T', 'ihHTsyJMvCAHbs1jIaJ61i', 20),
                        ('evlbeGWSXhvfGyjRIAvk6T', 'eUByfMoDmM3X9qC7ocArcC', 10),
                        ('evlbeGWSXhvfGyjRIAvk6T', 'zbE5y24hqTKL6lPGvVAmgX', 15),
                        ('evlbeGWSXhvfGyjRIAvk6T', 'VSacmSRug2jenc6nblThah', 45),
                        ('evlbeGWSXhvfGyjRIAvk6T', 'GVOZ6cHysyBnq25gZQv5GW', 40),
                        ('evlbeGWSXhvfGyjRIAvk6T', '7qSNhvIkhjXc0JmCgyNAKV', 50),
                        ('evlbeGWSXhvfGyjRIAvk6T', 'doT6m44UpIAP7uUBzBOUFQ', 60),
                        
                        
                        ('JXsSTKHzeh3l5FMRJTyJhi', 'doT6m44UpIAP7uUBzBOUFQ', 10),
                        ('JXsSTKHzeh3l5FMRJTyJhi', 'GVOZ6cHysyBnq25gZQv5GW', 15),
                        ('JXsSTKHzeh3l5FMRJTyJhi', '7qSNhvIkhjXc0JmCgyNAKV', 7),
                        
                        ('zmRK2DT8oaOncKtVSMCYif', 'zbE5y24hqTKL6lPGvVAmgX', 50),
                        ('zmRK2DT8oaOncKtVSMCYif', 'VSacmSRug2jenc6nblThah', 10),
                        ('zmRK2DT8oaOncKtVSMCYif', '3NKjcPT0mjG2HZtkG0jsF2', 45),
                        ('zmRK2DT8oaOncKtVSMCYif', 'EclNfpBMvxWxyHJkuQeTLe', 30),
                        
                        
                        ('sslY66bNX05BH3gf4F65gl', 'GVOZ6cHysyBnq25gZQv5GW', 20),
                        ('sslY66bNX05BH3gf4F65gl', 'KjqlxOkt7vzY8NLzfbNlHu', 60),
                        ('sslY66bNX05BH3gf4F65gl', '3NKjcPT0mjG2HZtkG0jsF2', 65),

                        
                        ('Xqf72CNN4z8zRHFtWttT0x', 'doT6m44UpIAP7uUBzBOUFQ', 30),
                        ('Xqf72CNN4z8zRHFtWttT0x', '7qSNhvIkhjXc0JmCgyNAKV', 45),
                        ('Xqf72CNN4z8zRHFtWttT0x', '8G2oicxUetr7ykVXGetWI2', 70),
                        ('Xqf72CNN4z8zRHFtWttT0x', '3NKjcPT0mjG2HZtkG0jsF2', 20),
                        ('Xqf72CNN4z8zRHFtWttT0x', 'KjqlxOkt7vzY8NLzfbNlHu', 60),

                        ('Ap0gx09VvCwIhbJPxqEWXS', 'zbE5y24hqTKL6lPGvVAmgX', 30),
                        ('Ap0gx09VvCwIhbJPxqEWXS', 'EclNfpBMvxWxyHJkuQeTLe', 100),
                        ('Ap0gx09VvCwIhbJPxqEWXS', 'eUByfMoDmM3X9qC7ocArcC', 69),
                        ('Ap0gx09VvCwIhbJPxqEWXS', 'ihHTsyJMvCAHbs1jIaJ61i', 72),
                        
                        ('QAD0w39nHzMMega7YQA9ER', 'GVOZ6cHysyBnq25gZQv5GW', 50),
                        ('QAD0w39nHzMMega7YQA9ER', 'KjqlxOkt7vzY8NLzfbNlHu', 50),
                        ('QAD0w39nHzMMega7YQA9ER', '3NKjcPT0mjG2HZtkG0jsF2', 50),

                        ('3boXyfeeTPacABRHEKPqjl', '3NKjcPT0mjG2HZtkG0jsF2', 60),
                        ('3boXyfeeTPacABRHEKPqjl', 'KjqlxOkt7vzY8NLzfbNlHu', 61),
                        ('3boXyfeeTPacABRHEKPqjl', 'GVOZ6cHysyBnq25gZQv5GW', 73),
                        ('3boXyfeeTPacABRHEKPqjl', 'VSacmSRug2jenc6nblThah', 48),
                        ('3boXyfeeTPacABRHEKPqjl', 'ERJqJgPmQYhv3ex35fODJ1', 56),
                        ('3boXyfeeTPacABRHEKPqjl', 'zbE5y24hqTKL6lPGvVAmgX', 93),
                        ('3boXyfeeTPacABRHEKPqjl', 'EclNfpBMvxWxyHJkuQeTLe', 87),
                        ('3boXyfeeTPacABRHEKPqjl', 'eUByfMoDmM3X9qC7ocArcC', 60),
                        
                        ('KX8Ajn0lhqiC6ri6pl2kpp', '8G2oicxUetr7ykVXGetWI2', 50),
                        ('KX8Ajn0lhqiC6ri6pl2kpp', '3NKjcPT0mjG2HZtkG0jsF2', 45),                      

                        ('QQ3VakBaFDX9es1mbKjlYz', '8G2oicxUetr7ykVXGetWI2', 105),
                        ('QQ3VakBaFDX9es1mbKjlYz', '3NKjcPT0mjG2HZtkG0jsF2', 100),
                        ('QQ3VakBaFDX9es1mbKjlYz', 'KjqlxOkt7vzY8NLzfbNlHu', 90),
                        ('QQ3VakBaFDX9es1mbKjlYz', 'GVOZ6cHysyBnq25gZQv5GW', 120),
                        ('QQ3VakBaFDX9es1mbKjlYz', 'VSacmSRug2jenc6nblThah', 56),
                                                
                        ('xAjbIwdgXFQjehOQfXi0qu', 'doT6m44UpIAP7uUBzBOUFQ', 78),
                        ('xAjbIwdgXFQjehOQfXi0qu', '7qSNhvIkhjXc0JmCgyNAKV', 99),
                        ('xAjbIwdgXFQjehOQfXi0qu', '8G2oicxUetr7ykVXGetWI2', 63),
                        ('xAjbIwdgXFQjehOQfXi0qu', 'KjqlxOkt7vzY8NLzfbNlHu', 50),                                            
                        
                        ('NUaZyOzMHWOm0kanVWBzdI', 'doT6m44UpIAP7uUBzBOUFQ', 45),
                        ('NUaZyOzMHWOm0kanVWBzdI', '7qSNhvIkhjXc0JmCgyNAKV', 55),
                        ('NUaZyOzMHWOm0kanVWBzdI', '8G2oicxUetr7ykVXGetWI2', 25),
                        ('NUaZyOzMHWOm0kanVWBzdI', '3NKjcPT0mjG2HZtkG0jsF2', 35),
                        ('NUaZyOzMHWOm0kanVWBzdI', 'KjqlxOkt7vzY8NLzfbNlHu', 92),
                        ('NUaZyOzMHWOm0kanVWBzdI', 'GVOZ6cHysyBnq25gZQv5GW', 52),
                        ('NUaZyOzMHWOm0kanVWBzdI', 'VSacmSRug2jenc6nblThah', 12),
                        ('NUaZyOzMHWOm0kanVWBzdI', 'ERJqJgPmQYhv3ex35fODJ1', 66),
                        ('NUaZyOzMHWOm0kanVWBzdI', 'zbE5y24hqTKL6lPGvVAmgX', 38),
                        ('NUaZyOzMHWOm0kanVWBzdI', 'EclNfpBMvxWxyHJkuQeTLe', 113),
                        ('NUaZyOzMHWOm0kanVWBzdI', 'eUByfMoDmM3X9qC7ocArcC', 100),
                        ('NUaZyOzMHWOm0kanVWBzdI', 'ihHTsyJMvCAHbs1jIaJ61i', 90),

                        ('5e2AbG8F3dzfXjASSxrGfx', '8G2oicxUetr7ykVXGetWI2', 80),
                        ('5e2AbG8F3dzfXjASSxrGfx', '3NKjcPT0mjG2HZtkG0jsF2', 100),
                        ('5e2AbG8F3dzfXjASSxrGfx', 'KjqlxOkt7vzY8NLzfbNlHu', 45),
                        ('5e2AbG8F3dzfXjASSxrGfx', 'GVOZ6cHysyBnq25gZQv5GW', 75),
                        ('5e2AbG8F3dzfXjASSxrGfx', 'VSacmSRug2jenc6nblThah', 30),
                        ('5e2AbG8F3dzfXjASSxrGfx', 'ERJqJgPmQYhv3ex35fODJ1', 60),
                        ('5e2AbG8F3dzfXjASSxrGfx', 'zbE5y24hqTKL6lPGvVAmgX', 55),
                        
                        ('jgbVUAAY3KOigMrcke8V68', 'doT6m44UpIAP7uUBzBOUFQ', 51),
                        ('jgbVUAAY3KOigMrcke8V68', '7qSNhvIkhjXc0JmCgyNAKV', 32),
                        ('jgbVUAAY3KOigMrcke8V68', '8G2oicxUetr7ykVXGetWI2', 41),
                        ('jgbVUAAY3KOigMrcke8V68', '3NKjcPT0mjG2HZtkG0jsF2', 52),

                        ('aLQtg994VLNMMDdlXfHElO', 'GVOZ6cHysyBnq25gZQv5GW', 60),
                        ('aLQtg994VLNMMDdlXfHElO', 'VSacmSRug2jenc6nblThah', 67),
                        ('aLQtg994VLNMMDdlXfHElO', 'ERJqJgPmQYhv3ex35fODJ1', 59),
                        ('aLQtg994VLNMMDdlXfHElO', 'zbE5y24hqTKL6lPGvVAmgX', 82),
                        ('aLQtg994VLNMMDdlXfHElO', 'EclNfpBMvxWxyHJkuQeTLe', 18),
                        ('aLQtg994VLNMMDdlXfHElO', 'eUByfMoDmM3X9qC7ocArcC', 24),
                        ('aLQtg994VLNMMDdlXfHElO', 'ihHTsyJMvCAHbs1jIaJ61i', 105),
                        
                        ('WH9pkOt0SY0kLF4lKnRGWC', 'GVOZ6cHysyBnq25gZQv5GW', 65),
                        ('WH9pkOt0SY0kLF4lKnRGWC', 'doT6m44UpIAP7uUBzBOUFQ', 20),
                        ('WH9pkOt0SY0kLF4lKnRGWC', '7qSNhvIkhjXc0JmCgyNAKV', 15),
                        ('WH9pkOt0SY0kLF4lKnRGWC', '8G2oicxUetr7ykVXGetWI2', 10),
                        ('WH9pkOt0SY0kLF4lKnRGWC', '3NKjcPT0mjG2HZtkG0jsF2', 20),
                        ('WH9pkOt0SY0kLF4lKnRGWC', 'KjqlxOkt7vzY8NLzfbNlHu', 10),

                        ('PLfibzSzKQfIGZ0ZLP7IfY', 'KjqlxOkt7vzY8NLzfbNlHu', 15),
                        ('PLfibzSzKQfIGZ0ZLP7IfY', 'GVOZ6cHysyBnq25gZQv5GW', 10),
                        ('PLfibzSzKQfIGZ0ZLP7IfY', 'VSacmSRug2jenc6nblThah', 20),
                        ('PLfibzSzKQfIGZ0ZLP7IfY', 'ERJqJgPmQYhv3ex35fODJ1', 30),
                        ('PLfibzSzKQfIGZ0ZLP7IfY', 'zbE5y24hqTKL6lPGvVAmgX', 20),

                        ('ssgBd0AGjDtdppUX1HrrIc', 'ihHTsyJMvCAHbs1jIaJ61i', 12),
                        ('ssgBd0AGjDtdppUX1HrrIc', 'eUByfMoDmM3X9qC7ocArcC', 13),
                        ('ssgBd0AGjDtdppUX1HrrIc', 'EclNfpBMvxWxyHJkuQeTLe', 15),
                        ('ssgBd0AGjDtdppUX1HrrIc', 'ERJqJgPmQYhv3ex35fODJ1', 10),
                        ('ssgBd0AGjDtdppUX1HrrIc', 'GVOZ6cHysyBnq25gZQv5GW', 20),
                        ('ssgBd0AGjDtdppUX1HrrIc', 'zbE5y24hqTKL6lPGvVAmgX', 15),
                        ('ssgBd0AGjDtdppUX1HrrIc', 'VSacmSRug2jenc6nblThah', 10),

                        ('pts68NvOSC6msRhdK3Rbjs', 'ERJqJgPmQYhv3ex35fODJ1', 20),
                        ('pts68NvOSC6msRhdK3Rbjs', 'VSacmSRug2jenc6nblThah', 30),
                        ('pts68NvOSC6msRhdK3Rbjs', 'KjqlxOkt7vzY8NLzfbNlHu', 12),
                        ('pts68NvOSC6msRhdK3Rbjs', 'GVOZ6cHysyBnq25gZQv5GW', 10),
                        ('pts68NvOSC6msRhdK3Rbjs', '3NKjcPT0mjG2HZtkG0jsF2', 50),

                        ('JsmKuKOWeItNHzz4DxIKwW', 'ihHTsyJMvCAHbs1jIaJ61i', 6),
                        ('JsmKuKOWeItNHzz4DxIKwW', 'eUByfMoDmM3X9qC7ocArcC', 5),
                        ('JsmKuKOWeItNHzz4DxIKwW', 'KjqlxOkt7vzY8NLzfbNlHu', 10),
                        ('JsmKuKOWeItNHzz4DxIKwW', '3NKjcPT0mjG2HZtkG0jsF2', 5),
                        ('JsmKuKOWeItNHzz4DxIKwW', 'GVOZ6cHysyBnq25gZQv5GW', 6),
                        ('JsmKuKOWeItNHzz4DxIKwW', 'VSacmSRug2jenc6nblThah', 7),
                        ('JsmKuKOWeItNHzz4DxIKwW', 'ERJqJgPmQYhv3ex35fODJ1', 6),
                        ('JsmKuKOWeItNHzz4DxIKwW', 'zbE5y24hqTKL6lPGvVAmgX', 5),
                        ('JsmKuKOWeItNHzz4DxIKwW', 'EclNfpBMvxWxyHJkuQeTLe', 10),
                        
                        ('rZ0lZSrhzrobRgKh1bwC6M', 'zbE5y24hqTKL6lPGvVAmgX', 20),
                        ('rZ0lZSrhzrobRgKh1bwC6M', 'ERJqJgPmQYhv3ex35fODJ1', 45),
                        ('rZ0lZSrhzrobRgKh1bwC6M', 'VSacmSRug2jenc6nblThah', 35),
                        
                        ('qMpVMeDq0zZ1PMBsIivqtf', 'KjqlxOkt7vzY8NLzfbNlHu', 15),
                        ('qMpVMeDq0zZ1PMBsIivqtf', '3NKjcPT0mjG2HZtkG0jsF2', 32),
                        ('qMpVMeDq0zZ1PMBsIivqtf', '8G2oicxUetr7ykVXGetWI2', 7),
                        ('qMpVMeDq0zZ1PMBsIivqtf', '7qSNhvIkhjXc0JmCgyNAKV', 60),
                        ('qMpVMeDq0zZ1PMBsIivqtf', 'doT6m44UpIAP7uUBzBOUFQ', 50),
                        ('qMpVMeDq0zZ1PMBsIivqtf', 'GVOZ6cHysyBnq25gZQv5GW', 45);

                             
-- TRACK_GENRE
INSERT INTO TRACK_GENRE (TG_Track_ID, 						 Genre) VALUES 
												('7EGYM3wfXfaJdGLizzStVx', 'Country'),
                        ('7EGYM3wfXfaJdGLizzStVx', 'Electronic'),
                        ('7EGYM3wfXfaJdGLizzStVx', 'Funk'),
												('xRbSNEemd79wUXjhpdtnNf', 'Electronic'),
                        ('xRbSNEemd79wUXjhpdtnNf', 'Funk'),
                        ('xRbSNEemd79wUXjhpdtnNf', 'HipHop'),
												('pk0c2vFeDEyqp1FMAWqJZO', 'Funk'),
                        ('pk0c2vFeDEyqp1FMAWqJZO', 'HipHop'),
                        ('pk0c2vFeDEyqp1FMAWqJZO', 'Jazz'),
												('24AdSae2NKNNhYWJvU13ah', 'HipHop'),
                        ('24AdSae2NKNNhYWJvU13ah', 'Jazz'),
                        ('24AdSae2NKNNhYWJvU13ah', 'Pop'),
												('FQAYrkkreqvKYgwg1SLTKR', 'Latin'),
                        ('FQAYrkkreqvKYgwg1SLTKR', 'Punk'),
                        ('FQAYrkkreqvKYgwg1SLTKR', 'Rock'),
                        
												('6adDYqIKXOZ8NZN7Ewh0VU', 'HipHop'),
                        ('6adDYqIKXOZ8NZN7Ewh0VU', 'Latin'),
                        ('6adDYqIKXOZ8NZN7Ewh0VU', 'Rock'),
												('rUUOR6IWkri1C6wbg1GcAC', 'Country'),
                        ('rUUOR6IWkri1C6wbg1GcAC', 'Punk'),
                        ('rUUOR6IWkri1C6wbg1GcAC', 'Metal'),
												('MV5UFAfmYs9JVM2RgWq9im', 'Pop'),
                        ('MV5UFAfmYs9JVM2RgWq9im', 'Funk'),
                        ('MV5UFAfmYs9JVM2RgWq9im', 'Electronic'),
												('ACJYUDuzYtMCFlPUGXGpoi', 'Metal'),
                        ('ACJYUDuzYtMCFlPUGXGpoi', 'Funk'),
                        ('ACJYUDuzYtMCFlPUGXGpoi', 'Electronic'),
												('fguB6VGCjK43FLF8hYhSw8', 'Latin'),
                        ('fguB6VGCjK43FLF8hYhSw8', 'Punk'),
                        ('fguB6VGCjK43FLF8hYhSw8', 'Metal'),
                        
                        ('N63VmjFlHl5ddaINdF7kdL', 'Latin'),

												('niOZ74IbExeZnBzS1ugSMb', 'HipHop'),
												('qFQfiAc9w9NP5RrxbIHpyD', 'Electronic'),
												('xGEF8oT2mrGODVOzY6ZgjN', 'Jazz'),
												('YtZUvwmzzrxEUC6wnjln1k', 'Punk'),
												('MrdQ5vmGQYM7PsqOx1hXuM', 'Metal'),

												('098CJ8SFqACjBbZe07IcrW', 'HipHop'),
												('VCR5iCzBtdQ6ZZfZ7MNNH5', 'Electronic'),
												('omzBZOkVDCUwGE07w1oftu', 'Rock'),
												('pCJ9gtVBMeB164CUrgMdSm', 'Funk'),
												('AHs4jAWhBNtGpR6Mt9kPQz', 'Metal'),

												('evlbeGWSXhvfGyjRIAvk6T', 'Electronic'),
                        ('evlbeGWSXhvfGyjRIAvk6T', 'HipHop'),
												('JXsSTKHzeh3l5FMRJTyJhi', 'Latin'),
                        ('JXsSTKHzeh3l5FMRJTyJhi', 'Rock'),
												('zmRK2DT8oaOncKtVSMCYif', 'Funk'),
                        ('zmRK2DT8oaOncKtVSMCYif', 'Metal'),
												('sslY66bNX05BH3gf4F65gl', 'Country'),
                        ('sslY66bNX05BH3gf4F65gl', 'Latin'),
												('Xqf72CNN4z8zRHFtWttT0x', 'Rock'),
                        ('Xqf72CNN4z8zRHFtWttT0x', 'Metal'),
                    
												('Ap0gx09VvCwIhbJPxqEWXS', 'Funk'),

												('QAD0w39nHzMMega7YQA9ER', 'Country'),
                        ('QAD0w39nHzMMega7YQA9ER', 'Latin'),
                        
												('3boXyfeeTPacABRHEKPqjl', 'Metal'),
                        ('3boXyfeeTPacABRHEKPqjl', 'Latin'),
                        
												('KX8Ajn0lhqiC6ri6pl2kpp', 'Rock'),
                        
												('QQ3VakBaFDX9es1mbKjlYz', 'Country'),
                        ('QQ3VakBaFDX9es1mbKjlYz', 'Jazz'),
                        ('QQ3VakBaFDX9es1mbKjlYz', 'Punk'),
                        
												('xAjbIwdgXFQjehOQfXi0qu', 'Country'),
                        
												('NUaZyOzMHWOm0kanVWBzdI', 'Punk'),
                        ('NUaZyOzMHWOm0kanVWBzdI', 'Pop'),
                        ('NUaZyOzMHWOm0kanVWBzdI', 'Rock'),
                        
												('5e2AbG8F3dzfXjASSxrGfx', 'Metal'),
                        ('5e2AbG8F3dzfXjASSxrGfx', 'Pop'),
                        
												('jgbVUAAY3KOigMrcke8V68', 'Metal'),
                        ('jgbVUAAY3KOigMrcke8V68', 'Rock'),
                        ('jgbVUAAY3KOigMrcke8V68', 'Country'),
                        
												('aLQtg994VLNMMDdlXfHElO', 'Latin'),
												('WH9pkOt0SY0kLF4lKnRGWC', 'Country'),

												('PLfibzSzKQfIGZ0ZLP7IfY', 'Pop'),
                        ('PLfibzSzKQfIGZ0ZLP7IfY', 'Rock'),
                        
												('ssgBd0AGjDtdppUX1HrrIc', 'Rock'),
                        
												('pts68NvOSC6msRhdK3Rbjs', 'Electronic'),
                        ('pts68NvOSC6msRhdK3Rbjs', 'Metal'),
                        ('pts68NvOSC6msRhdK3Rbjs', 'Rock'),
                        
												('JsmKuKOWeItNHzz4DxIKwW', 'Metal'),
                        ('JsmKuKOWeItNHzz4DxIKwW', 'Jazz'),
                        
												('rZ0lZSrhzrobRgKh1bwC6M', 'Funk'),
                        ('rZ0lZSrhzrobRgKh1bwC6M', 'Jazz'),

												('qMpVMeDq0zZ1PMBsIivqtf', 'Funk'); 


                        

-- PODCAST
INSERT INTO PODCAST VALUES
	('RlB04DUQP18TZvAnel4GVp', 
   'The Present Writer', 
   'Podcast về bài học cuộc sống, phát triển bản thân và Chủ nghĩa tối giản. Podcast được host bởi Chi Nguyễn, Tiến sĩ Giáo dục tại Mỹ, blogger, và tác giả "Một Cuốn Sách về Chủ Nghĩa Tối Giản. 
   A light-hearted podcast about life lessons, personal development, and minimalism. This podcast is hosted by Chi Nguyen, Ph.D. in Education, Blogger, and Author of "A Book about Minimalism"',
   '7qSNhvIkhjXc0JmCgyNAKV', -- Chi Nguyen user ID
   '2020-09-16 12:00:00',
   'HtJ9qM6l2XStrcfJV20no2'),
   ('mFYG09aoljE31pbzsBiLxt', 
   'Sunhuyn Podcast', 
   'Chào các bạn, mình là Sun. Các bạn đang lắng nghe Sunhuyn Podcast. Nếu có những ngày cảm thấy chênh vênh hãy quay về đây và yêu lấy chính mình. Cùng lắng nghe và thấu hiểu.',
   'doT6m44UpIAP7uUBzBOUFQ', -- Sunhuyn user ID
   '2021-02-14 20:30:00',
   'fQ7znASUc7Zh7AuWpUGb5C');
   
-- EPISODE (ep_id, podcast_id, [name], description, duration, date, content_id)
INSERT INTO EPISODE VALUES 
	-- The prsent writer podcast episodes
	('PkkLFtFS3CgZWmUY471cSC', 
   'RlB04DUQP18TZvAnel4GVp', 
   'Bạn có thực sự cần bảo hiểm', 
   'Kỳ đầu tiên du học tại Mỹ, mình có trải nghiệm kinh hoàng khi đang nằm trên bàn nha sĩ, thuốc tê cứng quai hàm vẫn phải gọi về Việt Nam để hỏi ý kiến gia đình trước khi chữa răng vì quá lo sợ do không có bảo hiểm. Gần 8 năm trôi qua, trải nghiệm đó đã hoàn toàn thay đổi cái nhìn của mình về bảo hiểm và thúc đẩy mình tìm hiểu sâu hơn về đề tài này. Tập podcast này bàn về bản chất của bảo hiểm, những hiểu lầm thường gặp, và tầm quan trọng của việc “hiểu đủ - mua đúng” khi tham gia bảo hiểm, cũng như vai trò của bảo hiểm với tài chính cá nhân.',
   1653,
   '2021-11-12 12:00:00',
   'ujuqpuzvh3xa7NqNlhEZo6'),
   ('plAvNcHDfDfFcHZA8hBOcb', 
   'RlB04DUQP18TZvAnel4GVp', 
   'Squid Game & Bao đồng', 
   'Được truyền cảm hứng bởi bộ phim Hàn Quốc đình đám: "Squid Game" (Trò chơi con mực), tập podcast này bàn về một nét tính cách đặc biệt của một số người (trong đó có mình): Bao đồng -- quan tâm và hy sinh hết mình cho những người không thân thiết hoặc cho những hoạt động cộng đồng; nhưng đồng thời lại thiếu quan tâm đến người thân, thậm chí khiến người thân chịu thiệt thòi để dành sự tốt đẹp cho người lạ. Bạn có nét tính cách này hoặc biết những ai có nét tính cách này không? Nghe tập podcast và chia sẻ với mình nhé! ',
   2760,
   '2021-11-01 12:00:00',
   'SbyWr9GGIrLbBz9W4ctL6h'),
   ('iD4F4h3Y4lQSNs6UjUPOAy', 
   'RlB04DUQP18TZvAnel4GVp', 
   'Trưởng thành', 
   'Có bao giờ bạn tự hỏi: “Trưởng thành” có nghĩa là gì? Đôi khi nhìn vào gương, tôi tự hỏi mình đang ở đâu trên quãng đường đời này. Nếu cuộc đời là một bộ phim dài tập, tôi hiện đang ở tập thứ mấy? Nếu sau này có người viết tiểu sử về tôi, họ sẽ viết giai đoạn này ở chương thứ mấy? Ở thời điểm này, tôi đã đi được bao nhiêu phần của cuộc đời?',
   907,
   '2021-10-15 12:00:00',
   'D7w2910SQnrGlg2tEyLRGL'),
   ('4xbvUpLK44MoumJsu0Q7H0', 
   'RlB04DUQP18TZvAnel4GVp', 
   'Đừng chờ cơ hội tới', 
   'Tại sao không nên chờ đợi cơ hội (công việc, học tập, mối quan hệ...) trong mơ tới thì mới bắt tay vào thực hiện ước mơ của mình? Tập podcast nêu ra 3 lý do thực tế nhất, dựa vào cuộc hành trình nhiều năm thăng trầm theo đuổi "công việc trong mơ" tại Mỹ của Chi Nguyễn.',
   1943,
   '2021-09-17 12:00:00',
   'QQZRMwJnf1eYZfz4iqlLCE'),
   
   -- Sunhuyn podcast episodes
   ('QyqROEPIg8FVx4eJdJBlLM', 
   'mFYG09aoljE31pbzsBiLxt', 
   'Hiểu được giá trị của mình rất khó nhưng đáng', 
   'Đây là live stream của Sun ngày 10.10.2021 trên Instagram @sunhuyn',
   2235,
   '2021-10-27 12:00:00',
   'sIHoFP40eCTduQgZasa0nT'),
   ('qHTRkbmemAdqIAqR7GNKjv', 
   'mFYG09aoljE31pbzsBiLxt', 
   '#9 Kẻ lớn lên qua những cuộc tình', 
   'Tôi chỉ là một kẻ bình thường. Khao khát được yêu thương nhưng đôi khi lại sai cách rồi... lớn lên qua những cuộc tình.',
   1278,
   '2021-10-15 12:00:00',
   'G9wYlmJQpeDce1lvzKeR4i'),
   ('k4nuhyCEtDqaIVoQQYCoVc', 
   'mFYG09aoljE31pbzsBiLxt', 
   '#8 Sống dễ thở giữa đời ngột ngạt', 
   'Tại sao cuộc sống của nhiều người lại suôn sẻ và dễ dàng mà tôi lại vất vả mệt nhọc đến vậy?',
   1346,
   '2021-09-29 12:00:00',
   'A39Cn8jlFuxblLrCwMCs3U');

-- PODCAST_GENRE
INSERT INTO PODCAST_GENRE VALUES 
	-- The present writer podcast generes
	('RlB04DUQP18TZvAnel4GVp', 'Health'),
  ('RlB04DUQP18TZvAnel4GVp', 'Fitness'),
  ('RlB04DUQP18TZvAnel4GVp', 'Self-Help'),
  ('RlB04DUQP18TZvAnel4GVp', 'Productivity'),
  ('RlB04DUQP18TZvAnel4GVp', 'News'),
  ('RlB04DUQP18TZvAnel4GVp', 'Comedy'),
  
  -- Sunhuyn podcast generes
	('mFYG09aoljE31pbzsBiLxt', 'Health'),
  ('mFYG09aoljE31pbzsBiLxt', 'Fitness'),
  ('mFYG09aoljE31pbzsBiLxt', 'Self-Help'),
  ('mFYG09aoljE31pbzsBiLxt', 'Productivity'),
  ('mFYG09aoljE31pbzsBiLxt', 'Romance');
  

-- EPISODE_GENRE
INSERT INTO EPISODE_GENRE VALUES 
	('PkkLFtFS3CgZWmUY471cSC','RlB04DUQP18TZvAnel4GVp', 'Self-Help'),
  ('PkkLFtFS3CgZWmUY471cSC','RlB04DUQP18TZvAnel4GVp',  'Health'),
  
  ('plAvNcHDfDfFcHZA8hBOcb', 'RlB04DUQP18TZvAnel4GVp', 'Comedy'),
  ('plAvNcHDfDfFcHZA8hBOcb', 'RlB04DUQP18TZvAnel4GVp', 'News'),
  
  ('iD4F4h3Y4lQSNs6UjUPOAy', 'RlB04DUQP18TZvAnel4GVp', 'Self-help'),
  ('iD4F4h3Y4lQSNs6UjUPOAy', 'RlB04DUQP18TZvAnel4GVp', 'Productivity'),
  
  ('4xbvUpLK44MoumJsu0Q7H0', 'RlB04DUQP18TZvAnel4GVp','Self-help'),
  ('4xbvUpLK44MoumJsu0Q7H0', 'RlB04DUQP18TZvAnel4GVp','Productivity'),
  
  ('QyqROEPIg8FVx4eJdJBlLM', 'mFYG09aoljE31pbzsBiLxt', 'Self-help'),
  ('QyqROEPIg8FVx4eJdJBlLM', 'mFYG09aoljE31pbzsBiLxt', 'Productivity'),
  
  ('qHTRkbmemAdqIAqR7GNKjv', 'mFYG09aoljE31pbzsBiLxt', 'Self-help'),
  ('qHTRkbmemAdqIAqR7GNKjv', 'mFYG09aoljE31pbzsBiLxt', 'Productivity'),

	('k4nuhyCEtDqaIVoQQYCoVc', 'mFYG09aoljE31pbzsBiLxt','Self-help'),
  ('k4nuhyCEtDqaIVoQQYCoVc', 'mFYG09aoljE31pbzsBiLxt','Productivity');


  -- LIKE
INSERT INTO USERS_LIKE_CONTENT (L_Content_ID,               L_User_ID) VALUES 
															 ('deN10gGj0jgWjAAyh5Hndu', 'ihHTsyJMvCAHbs1jIaJ61i'),
															 ('PvXA8i2UT8KLmfjHpRrDWB', 'ihHTsyJMvCAHbs1jIaJ61i'),
															 ('sIHoFP40eCTduQgZasa0nT', 'ihHTsyJMvCAHbs1jIaJ61i'),
															 ('lMTdMcLWi59pYsnfbQ32nK', 'ihHTsyJMvCAHbs1jIaJ61i'),
                               ('d6rHSjCQkdczeGlr7okHWZ', 'ihHTsyJMvCAHbs1jIaJ61i'),
                               ('W2ExxF9KOflkJEgHrXmjM3', 'ihHTsyJMvCAHbs1jIaJ61i'),
                               ('RxvfsbvqkJhlp0Frp4AHMG', 'ihHTsyJMvCAHbs1jIaJ61i'),
                               ('2SiSFVulMWzsbNMtY10aDT', 'ihHTsyJMvCAHbs1jIaJ61i'),
                               ('mbxefgrKTWiF2hU6xBg7zh', 'ihHTsyJMvCAHbs1jIaJ61i'),
                               ('6gEcEngDztjChqPqClaKR4', 'ihHTsyJMvCAHbs1jIaJ61i'),
                               ('J5Ln7Qn352TszKuiwXXMG5', 'ihHTsyJMvCAHbs1jIaJ61i'),
                               
															 ('ujuqpuzvh3xa7NqNlhEZo6', 'eUByfMoDmM3X9qC7ocArcC'),
															 ('SbyWr9GGIrLbBz9W4ctL6h', 'eUByfMoDmM3X9qC7ocArcC'),
															 ('QQZRMwJnf1eYZfz4iqlLCE', 'eUByfMoDmM3X9qC7ocArcC'),
															 ('D7w2910SQnrGlg2tEyLRGL', 'eUByfMoDmM3X9qC7ocArcC'),
															 ('sIHoFP40eCTduQgZasa0nT', 'eUByfMoDmM3X9qC7ocArcC'),


															 ('PvXA8i2UT8KLmfjHpRrDWB', 'EclNfpBMvxWxyHJkuQeTLe'),
                               ('ujuqpuzvh3xa7NqNlhEZo6', 'EclNfpBMvxWxyHJkuQeTLe'),
                               ('sIHoFP40eCTduQgZasa0nT', 'EclNfpBMvxWxyHJkuQeTLe'),
                               ('NueHjf2LbSEmnwfyCjDwSA', 'EclNfpBMvxWxyHJkuQeTLe'),
                               ('Pp9gdWYuYELdZ0CvXw4B1U', 'EclNfpBMvxWxyHJkuQeTLe'),
                               
															 ('eqoKO58zH6tFlwNHMRkTnm', 'zbE5y24hqTKL6lPGvVAmgX'),
                               ('EllmIpJ2uDHIc0MiCgeuZu', 'zbE5y24hqTKL6lPGvVAmgX'),
                               ('wb7QnfbmYZU3NiPQbOvvow', 'zbE5y24hqTKL6lPGvVAmgX'),
                               ('RZb7OrvMGsC7OIU8qpIHkl', 'zbE5y24hqTKL6lPGvVAmgX'),
                               ('e4uxIZE6Rcdq9HS8VCL77M', 'zbE5y24hqTKL6lPGvVAmgX'),
                               
															 ('5FNzXKEsG86Ks2khi1FoBV', 'ERJqJgPmQYhv3ex35fODJ1'),
                               ('Je90WNRwJBDkifIQT1ozzs', 'ERJqJgPmQYhv3ex35fODJ1'),
                               ('yfls3CeNXoQKWDyyPbzhjN', 'ERJqJgPmQYhv3ex35fODJ1'),
                               ('RSIyHBPXPbl9oywaaVZgoR', 'ERJqJgPmQYhv3ex35fODJ1'),
                               ('PvXA8i2UT8KLmfjHpRrDWB', 'ERJqJgPmQYhv3ex35fODJ1'),
                               
															 ('deN10gGj0jgWjAAyh5Hndu', 'VSacmSRug2jenc6nblThah'),
                               ('8f9jTiSmWA06hCpOPPer4C', 'VSacmSRug2jenc6nblThah'),
                               ('3K45Ws3E1gf8aSAlkDMEQm', 'VSacmSRug2jenc6nblThah'),
                               ('garKCQTXihOe9ZESYBIXfp', 'VSacmSRug2jenc6nblThah'),
                               ('sIHoFP40eCTduQgZasa0nT', 'VSacmSRug2jenc6nblThah'),
                               
															 ('vhOrnlxprWwaiikQyb73sH', 'GVOZ6cHysyBnq25gZQv5GW'),
                               ('WDSXgn2qUA8xRGsbGp2QEu', 'GVOZ6cHysyBnq25gZQv5GW'),
                               ('3wuPm1x9xwMMEj8AtLW4M1', 'GVOZ6cHysyBnq25gZQv5GW'),
                               ('MOwZwLukreCU02jmXvKZia', 'GVOZ6cHysyBnq25gZQv5GW'),
                               ('NueHjf2LbSEmnwfyCjDwSA', 'GVOZ6cHysyBnq25gZQv5GW'),
                               
															 ('dvr3N8Kut4nf0EY7dn0Ggt', 'KjqlxOkt7vzY8NLzfbNlHu'),
                               ('eqoKO58zH6tFlwNHMRkTnm', 'KjqlxOkt7vzY8NLzfbNlHu'),
                               ('RFOgEQIZNAjF6I6hFG67oh', 'KjqlxOkt7vzY8NLzfbNlHu'),
                               ('MgulGFGqAbut2STl1EbMnP', 'KjqlxOkt7vzY8NLzfbNlHu'),
                               ('e4uxIZE6Rcdq9HS8VCL77M', 'KjqlxOkt7vzY8NLzfbNlHu'),
                               
															 ('2SiSFVulMWzsbNMtY10aDT', '3NKjcPT0mjG2HZtkG0jsF2'),
                               ('6gEcEngDztjChqPqClaKR4', '3NKjcPT0mjG2HZtkG0jsF2'),
                               ('J5Ln7Qn352TszKuiwXXMG5', '3NKjcPT0mjG2HZtkG0jsF2'),
                               ('pieCXOMz9P245V7B7fY8bP', '3NKjcPT0mjG2HZtkG0jsF2'),
                               ('AwWBv4fs33OvIJRgPngWpp', '3NKjcPT0mjG2HZtkG0jsF2'),
                               
															 ('symf6ji1wdWSBeZ6kagLmP', '8G2oicxUetr7ykVXGetWI2'),
                               ('5ZWidMVpQ2XkkCaIda9692', '8G2oicxUetr7ykVXGetWI2'),
                               ('yfls3CeNXoQKWDyyPbzhjN', '8G2oicxUetr7ykVXGetWI2'),
                               ('dTrhIK3NS5A5w4anlv6mu0', '8G2oicxUetr7ykVXGetWI2'),
                               ('RSIyHBPXPbl9oywaaVZgoR', '8G2oicxUetr7ykVXGetWI2'),
                               
															 ('xwIoqDKETTw8tcJYXib0VH', '7qSNhvIkhjXc0JmCgyNAKV'),
                               ('0OLUVluFlFg1a7U1IcItxh', '7qSNhvIkhjXc0JmCgyNAKV'),
                               ('qdrNPWd11uKUXCxmuwcZzT', '7qSNhvIkhjXc0JmCgyNAKV'),
                               ('QQZRMwJnf1eYZfz4iqlLCE', '7qSNhvIkhjXc0JmCgyNAKV'),
                               ('3wuPm1x9xwMMEj8AtLW4M1', '7qSNhvIkhjXc0JmCgyNAKV'),
                               
															 ('EO1vSYOl17UTxmFrjPq0Fd', 'doT6m44UpIAP7uUBzBOUFQ'),
                               ('dvr3N8Kut4nf0EY7dn0Ggt', 'doT6m44UpIAP7uUBzBOUFQ'),
                               ('PljlcISoEy6S7WBWAN6Otk', 'doT6m44UpIAP7uUBzBOUFQ'),
                               ('RZb7OrvMGsC7OIU8qpIHkl', 'doT6m44UpIAP7uUBzBOUFQ'),
                               ('ynXrqbRLa48MvU4bm98viS', 'doT6m44UpIAP7uUBzBOUFQ');
															 
-- FOLLOW
INSERT INTO USERS_FOLLOW_CONTENT_CREATOR (F_CC_ID, 										F_User_ID) VALUES
																				 ('p4rbkjxsF536dppiXBDWgh', 'ihHTsyJMvCAHbs1jIaJ61i'),
                                         ('yRDo5m8QOsZ3RhTXFJasgy', 'ihHTsyJMvCAHbs1jIaJ61i'),
                                         ('YwhVDpjwDjB67mZt6wgPEZ', 'ihHTsyJMvCAHbs1jIaJ61i'),
                                         ('HtJ9qM6l2XStrcfJV20no2', 'ihHTsyJMvCAHbs1jIaJ61i'),
                                         ('fQ7znASUc7Zh7AuWpUGb5C', 'ihHTsyJMvCAHbs1jIaJ61i'),
                                         ('OmXx3xCSGBsABIPE8JvtxI', 'ihHTsyJMvCAHbs1jIaJ61i'),
                                         ('iBl6jtcEUqqkEAZ5Ym8CRy', 'ihHTsyJMvCAHbs1jIaJ61i'),
                                         ('4P9pFP3dlr3kgGdF0gqX7M', 'ihHTsyJMvCAHbs1jIaJ61i'),
                                         
                                                                               
																				 ('Kx4pLbHhvYH3toNuNpzETJ', 'eUByfMoDmM3X9qC7ocArcC'),
                                         ('HtJ9qM6l2XStrcfJV20no2', 'eUByfMoDmM3X9qC7ocArcC'),
                                         ('fQ7znASUc7Zh7AuWpUGb5C', 'eUByfMoDmM3X9qC7ocArcC'),
                                         ('P2Cbsv5fS2mNtDJOx7GhK8', 'eUByfMoDmM3X9qC7ocArcC'),
                                         ('4P9pFP3dlr3kgGdF0gqX7M', 'eUByfMoDmM3X9qC7ocArcC'),
                                         ('1PJCgS1TmKJzWAuY6Icamk', 'eUByfMoDmM3X9qC7ocArcC'),
                                         ('bG95wr8CWfX9GMWfbPmgot', 'eUByfMoDmM3X9qC7ocArcC'),
                                         ('OmXx3xCSGBsABIPE8JvtxI', 'eUByfMoDmM3X9qC7ocArcC'),
                                         ('yRDo5m8QOsZ3RhTXFJasgy', 'eUByfMoDmM3X9qC7ocArcC'),
                                         ('zn1FwkId7XTLlGW39WmUOX', 'eUByfMoDmM3X9qC7ocArcC'),
                                         
                                         
																				 ('HtJ9qM6l2XStrcfJV20no2', 'EclNfpBMvxWxyHJkuQeTLe'),
                                         ('fHTWhkNO4J1UHF9A9Qsext', 'EclNfpBMvxWxyHJkuQeTLe'),
                                         ('yRDo5m8QOsZ3RhTXFJasgy', 'EclNfpBMvxWxyHJkuQeTLe'),
                                         ('YwhVDpjwDjB67mZt6wgPEZ', 'EclNfpBMvxWxyHJkuQeTLe'),
                                         ('OmXx3xCSGBsABIPE8JvtxI', 'EclNfpBMvxWxyHJkuQeTLe'),
                                         ('bG95wr8CWfX9GMWfbPmgot', 'EclNfpBMvxWxyHJkuQeTLe'),
                                         ('ZUZJUCAvy8eF48a2Jfqjo8', 'EclNfpBMvxWxyHJkuQeTLe'),
                                         
                                         
																				 ('Kx4pLbHhvYH3toNuNpzETJ', 'zbE5y24hqTKL6lPGvVAmgX'),
                                         ('YwhVDpjwDjB67mZt6wgPEZ', 'zbE5y24hqTKL6lPGvVAmgX'),
                                         ('OmXx3xCSGBsABIPE8JvtxI', 'zbE5y24hqTKL6lPGvVAmgX'),
                                         ('v1S1D5eaS1injNe0wu5syG', 'zbE5y24hqTKL6lPGvVAmgX'),
                                         
                                         
																				 ('ZUZJUCAvy8eF48a2Jfqjo8', 'ERJqJgPmQYhv3ex35fODJ1'),
                                         ('yRDo5m8QOsZ3RhTXFJasgy', 'ERJqJgPmQYhv3ex35fODJ1'),
                                         ('p4rbkjxsF536dppiXBDWgh', 'ERJqJgPmQYhv3ex35fODJ1'),
                                         ('OmXx3xCSGBsABIPE8JvtxI', 'ERJqJgPmQYhv3ex35fODJ1'),
                                         ('sP3JmsIPwFzqxLfZEqwovv', 'ERJqJgPmQYhv3ex35fODJ1'),
                                         ('v1S1D5eaS1injNe0wu5syG', 'ERJqJgPmQYhv3ex35fODJ1'),
                                         ('Wl4EEXzlzxL3Qa3YGwDsTS', 'ERJqJgPmQYhv3ex35fODJ1'),
                                         ('fQ7znASUc7Zh7AuWpUGb5C', 'ERJqJgPmQYhv3ex35fODJ1'),
                                         
                                         
																				 ('dysB4gH3vbBrIe6FtxP4EK', 'VSacmSRug2jenc6nblThah'),
                                         ('4P9pFP3dlr3kgGdF0gqX7M', 'VSacmSRug2jenc6nblThah'),
                                         ('YwhVDpjwDjB67mZt6wgPEZ', 'VSacmSRug2jenc6nblThah'),
                                         ('OmXx3xCSGBsABIPE8JvtxI', 'VSacmSRug2jenc6nblThah'),
                                         ('bG95wr8CWfX9GMWfbPmgot', 'VSacmSRug2jenc6nblThah'),
                                         
                                         
																				 ('sP3JmsIPwFzqxLfZEqwovv', 'GVOZ6cHysyBnq25gZQv5GW'),
                                         ('p4rbkjxsF536dppiXBDWgh', 'GVOZ6cHysyBnq25gZQv5GW'),
                                         ('1PJCgS1TmKJzWAuY6Icamk', 'GVOZ6cHysyBnq25gZQv5GW'),
                                         ('bG95wr8CWfX9GMWfbPmgot', 'GVOZ6cHysyBnq25gZQv5GW'),
                                         ('YNPObzYfMHs7uSISGPz8k9', 'GVOZ6cHysyBnq25gZQv5GW'),
                                         ('HtJ9qM6l2XStrcfJV20no2', 'GVOZ6cHysyBnq25gZQv5GW'),
                                         ('ZUZJUCAvy8eF48a2Jfqjo8', 'GVOZ6cHysyBnq25gZQv5GW'),
                                         ('2kbrYqc3CdscuBK4LDMNI7', 'GVOZ6cHysyBnq25gZQv5GW'),
                                         
                                         
																				 ('HtJ9qM6l2XStrcfJV20no2', 'KjqlxOkt7vzY8NLzfbNlHu'),
                                         ('Kx4pLbHhvYH3toNuNpzETJ', 'KjqlxOkt7vzY8NLzfbNlHu'),
                                         ('fQ7znASUc7Zh7AuWpUGb5C', 'KjqlxOkt7vzY8NLzfbNlHu'),
                                         
                                         
																				 ('w3wTDySMW4xu3hiyPdrDz2', '3NKjcPT0mjG2HZtkG0jsF2'),
                                         ('HCczqJsPKsISmoeVn8UW2K', '3NKjcPT0mjG2HZtkG0jsF2'),
                                				 ('ZUZJUCAvy8eF48a2Jfqjo8', '3NKjcPT0mjG2HZtkG0jsF2'),
                                         ('yRDo5m8QOsZ3RhTXFJasgy', '3NKjcPT0mjG2HZtkG0jsF2'),
                                
																				 ('1PJCgS1TmKJzWAuY6Icamk', '8G2oicxUetr7ykVXGetWI2'),
                                         ('bG95wr8CWfX9GMWfbPmgot', '8G2oicxUetr7ykVXGetWI2'),
                                         ('YNPObzYfMHs7uSISGPz8k9', '8G2oicxUetr7ykVXGetWI2'),
                                         ('yRDo5m8QOsZ3RhTXFJasgy', '8G2oicxUetr7ykVXGetWI2'),
                                         ('p4rbkjxsF536dppiXBDWgh', '8G2oicxUetr7ykVXGetWI2'),
                                         
																				 ('4P9pFP3dlr3kgGdF0gqX7M', '7qSNhvIkhjXc0JmCgyNAKV'),
                                         ('OmXx3xCSGBsABIPE8JvtxI', '7qSNhvIkhjXc0JmCgyNAKV'),
                                         ('v1S1D5eaS1injNe0wu5syG', '7qSNhvIkhjXc0JmCgyNAKV'),
                                         ('YNPObzYfMHs7uSISGPz8k9', '7qSNhvIkhjXc0JmCgyNAKV'),
                                         
																				 ('w3wTDySMW4xu3hiyPdrDz2', 'doT6m44UpIAP7uUBzBOUFQ'),
                                         ('sP3JmsIPwFzqxLfZEqwovv', 'doT6m44UpIAP7uUBzBOUFQ'),
                                         ('fQ7znASUc7Zh7AuWpUGb5C', 'doT6m44UpIAP7uUBzBOUFQ'),
                                         ('iBl6jtcEUqqkEAZ5Ym8CRy', 'doT6m44UpIAP7uUBzBOUFQ'),
                                         ('zn1FwkId7XTLlGW39WmUOX', 'doT6m44UpIAP7uUBzBOUFQ');																				 





-- TRIGGER
-- RADIO
DELIMITER //
 
CREATE TRIGGER trig_ins_radio_add_cc_id
    BEFORE INSERT ON radio 
    FOR EACH ROW
BEGIN
    INSERT INTO content_creator VALUES (NEW.R_CC_ID);
END//
 
DELIMITER ;
 
DELIMITER //
 
CREATE TRIGGER trig_del_radio_del_cc_id
    AFTER DELETE ON radio 
    FOR EACH ROW
BEGIN
    DELETE FROM content_creator WHERE content_creator.CC_ID = OLD.R_CC_ID;
END//
 
DELIMITER ;
-- END TRIGGER


DELIMITER //

CREATE TRIGGER trigger_insert_playlist_content_id
BEFORE INSERT ON playlist
FOR EACH ROW
BEGIN
	
	INSERT INTO content VALUES (new.Playlist_ID);
    
END

// DELIMITER ;

DELIMITER //

CREATE TRIGGER trigger_insert_playlist_system_playlist_id
AFTER INSERT ON playlist
FOR EACH ROW
BEGIN
	
	INSERT INTO system_playlist VALUES (new.Playlist_ID);
    
END

// DELIMITER ;

DELIMITER //

CREATE TRIGGER trigger_insert_playlist_content_id_unknown
BEFORE INSERT ON playlist
FOR EACH ROW
BEGIN

	IF NEW.Name IS NULL OR NEW.Name = '' THEN
		SET NEW.Name = "UNKNOW PLAYLIST";
    END IF;

END 

// DELIMITER ;

DELIMITER //

CREATE TRIGGER trigger_update_playlist_content_id_unknown
BEFORE UPDATE ON playlist
FOR EACH ROW
BEGIN

	IF NEW.Name IS NULL OR NEW.Name = '' THEN
		SET NEW.Name = "UNKNOW PLAYLIST";
    END IF;

END 

// DELIMITER ;