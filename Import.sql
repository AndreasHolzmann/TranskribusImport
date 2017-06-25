-- SCHEMA: transkribusimport

-- ######
-- NOTE:
-- ######

-- Please adjust the AUTHORIZATION user and the TABLESPACE specification to your requirements!!!
-- you can search for "-- change"




-- DROP SCHEMA transkribusimport ;
CREATE SCHEMA transkribusimport
    AUTHORIZATION postgres;     -- change
    
    
    
-- Table: transkribusimport.documents
-- ==================================

-- DROP TABLE transkribusimport.documents;
CREATE TABLE transkribusimport.documents
(
    docid bigint NOT NULL,
    title text COLLATE pg_catalog."default" NOT NULL,
    author text COLLATE pg_catalog."default" NOT NULL,
    uploadtimestamp timestamp without time zone NOT NULL,
    genre text COLLATE pg_catalog."default" NOT NULL,
    writer text COLLATE pg_catalog."default" NOT NULL,
    scripttype text COLLATE pg_catalog."default" NOT NULL,
    uploader text COLLATE pg_catalog."default" NOT NULL,
    uploaderid bigint NOT NULL,
    nrofpages integer NOT NULL,
    mainlanguage text COLLATE pg_catalog."default" NOT NULL DEFAULT ''::text,
    status text COLLATE pg_catalog."default" NOT NULL DEFAULT ''::text,
    fimgstorecoll text COLLATE pg_catalog."default" NOT NULL DEFAULT ''::text,
    createdfromtimestamp timestamp without time zone NOT NULL,
    createdtotimestamp timestamp without time zone NOT NULL,
    colid bigint NOT NULL,
    CONSTRAINT documents_pkey PRIMARY KEY (docid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;   -- change

ALTER TABLE transkribusimport.documents
    OWNER to postgres;   -- change
    
    
    
-- Table: transkribusimport.pages
--===============================

-- DROP TABLE transkribusimport.pages;

CREATE TABLE transkribusimport.pages
(
    docid bigint NOT NULL,
    pagenr integer NOT NULL,
    pageid bigint NOT NULL,
    imgfilename text COLLATE pg_catalog."default" NOT NULL,
    imgurl text COLLATE pg_catalog."default" NOT NULL,
    imgwidth integer NOT NULL,
    imgheight integer NOT NULL,
    imgcoords text COLLATE pg_catalog."default" NOT NULL,
    imgcreated timestamp without time zone NOT NULL,
    transcribedid bigint NOT NULL,
    transcribedstatus text COLLATE pg_catalog."default" NOT NULL,
    nroftranscribedregions integer NOT NULL,
    nroftranscribedlines integer NOT NULL,
    nroftranscribedwords integer NOT NULL,
    transcribednote text COLLATE pg_catalog."default",
    transcribedtime timestamp without time zone NOT NULL,
    transcribedurl text COLLATE pg_catalog."default" NOT NULL,
    transcribeduserid bigint NOT NULL,
    transcribedusername text COLLATE pg_catalog."default" NOT NULL,
    checked boolean NOT NULL DEFAULT false,
    checkremark text COLLATE pg_catalog."default" NOT NULL DEFAULT ''::text,
    checkuser text COLLATE pg_catalog."default" NOT NULL DEFAULT ''::text,
    CONSTRAINT pages_pkey PRIMARY KEY (docid, pagenr),
    CONSTRAINT pagerefdocumentfk FOREIGN KEY (docid)
        REFERENCES transkribusimport.documents (docid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;   -- change

ALTER TABLE transkribusimport.pages
    OWNER to postgres;  --change
    
    
-- Table: transkribusimport.textregions
-- ====================================

-- DROP TABLE transkribusimport.textregions;
CREATE TABLE transkribusimport.textregions
(
    docid bigint NOT NULL,
    pagenr integer NOT NULL,
    regionid text COLLATE pg_catalog."default" NOT NULL,
    regiontype text COLLATE pg_catalog."default" NOT NULL,
    structure text COLLATE pg_catalog."default" NOT NULL,
    readingorder integer NOT NULL,
    unicodetext text COLLATE pg_catalog."default" NOT NULL,
    plaintext text COLLATE pg_catalog."default" NOT NULL,
    coords text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT textregions_pkey PRIMARY KEY (docid, pagenr, regionid),
    CONSTRAINT textregionrefpagefk FOREIGN KEY (docid, pagenr)
        REFERENCES transkribusimport.pages (docid, pagenr) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;  -- change

ALTER TABLE transkribusimport.textregions
    OWNER to postgres;   -- change
    


-- Table: transkribusimport.lines
--===============================

-- DROP TABLE transkribusimport.lines;
CREATE TABLE transkribusimport.lines
(
    docid bigint NOT NULL,
    pagenr integer NOT NULL,
    regionid text COLLATE pg_catalog."default" NOT NULL,
    lineid text COLLATE pg_catalog."default" NOT NULL,
    structure text COLLATE pg_catalog."default",
    readingorder integer NOT NULL,
    unicodetext text COLLATE pg_catalog."default" NOT NULL,
    plaintext text COLLATE pg_catalog."default" NOT NULL,
    coords text COLLATE pg_catalog."default" NOT NULL,
    baseline text COLLATE pg_catalog."default" NOT NULL,
    primarylanguage text COLLATE pg_catalog."default" NOT NULL DEFAULT 'german'::text,
    CONSTRAINT lines_pkey PRIMARY KEY (docid, pagenr, regionid, lineid),
    CONSTRAINT linereftextregionfk FOREIGN KEY (pagenr, regionid, docid)
        REFERENCES transkribusimport.textregions (pagenr, regionid, docid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;   -- change

ALTER TABLE transkribusimport.lines
    OWNER to postgres;   -- change
    
    
    
-- Table: transkribusimport.version
-- =================================

-- DROP TABLE transkribusimport.version;

CREATE TABLE transkribusimport.version
(
    version text COLLATE pg_catalog."default" NOT NULL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;  -- change

ALTER TABLE transkribusimport.version
    OWNER to postgres;  -- change