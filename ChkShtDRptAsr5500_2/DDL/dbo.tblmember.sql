CREATE TABLE [dbo].[tblmember] (
    [id]             INT           NOT NULL,
    [team]           TINYINT       NULL,
    [username]       VARCHAR (50)  NULL,
    [username_kanji] VARCHAR (50)  NULL,
    [show]           VARCHAR (50)  NOT NULL,
    [mailaddress]    VARCHAR (100) NULL
);

