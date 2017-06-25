This file describes what is necessary, to run ImporterToDB 
##########################################################


Before you can start, you have to:
============================================
1) Setup the database: File: Import.sql
---------------------------------------
Note:
If you want to use a different DB owner (used: postgres), 
or if you want to use different tablespaces (used: pg_default),
you have to edit the script.

Connect to your postgres DB, create a database and run the script: "Import.sql"
The script creates a DB schema "transkribusimport"
and it creates 5 tables:
    - "documents"
    - "pages"
    - "textregions"
    - "lines"
    - "version".


2) You need a Transkribus account. 
----------------------------------
If you do not have one, please contact Guenter.

3) Create your own login.properties file:
------------------------------------------

RUN: java -jar ImportToDB.jar -c login.properties -l logger.properties -s
Example:
--------
2017-06-25 03:48:01.875 - INFO => Use logger properties: logger.properties
2017-06-25 03:48:01.892 - INFO => Use login properties: login.properties
Transkribus URL: https://transkribus.eu/TrpServer                          
Transkribus Username: andreas.holzmann@chello.at
Transkribus Password: 
Postgres URL: jdbc:postgresql://localhost/woody
Postgres use SSL (true /false): false
Postgres Username: woody
Postgres Password: 

If you cannot login sucessfully,  an error message is shown:

On success your login.properties file look like:
------------------------------------------------
#Sun Jun 25 15:49:00 CEST 2017
postgresUseSLL=false
databaseLogin=woody
transkribusPassword=UGE1NVdvcnQ\=
transkribusLogin=andreas.holzmann@chello.at
databasePassword=d29vZHk\=
postgresUrl=jdbc\:postgresql\://localhost/woody
transkribusUrl=https\://transkribus.eu/TrpServer


4) Adjust the "logger.properties" file according to your needs.
The JAVA logger class is used. Currently WARNING and PageImport information is shown within the log.

5) The command to start the importer is:
========================================
incremental:
-------------
java -jar ImportToDB.jar -c login.properties -l logger.properties

You can use "forced" import: all documents are loaded again
------------------------------------------------------------
java -jar ImportToDB.jar -c login.properties -l logger.properties -f


to import only a specific document (the number is the document id) use:
-----------------------------------------------------------------------
java -jar ImportToDB.jar -c login.properties -l logger.properties -d 917

to force an import of a specific document (the number is the document id) use:
-------------------------------------------------------------------------------
java -jar ImportToDB.jar -c login.properties -l logger.properties -d 917


your should get an output like:
java -jar ImportToDB.jar -c login.properties -l lger.properties -f -d 917
2017-06-25 04:18:09.639 - INFO => Use logger properties: logger.properties
2017-06-25 04:18:09.660 - INFO => Use login properties: login.properties
2017-06-25 04:18:09.660 - INFO => Force synchronization 
2017-06-25 04:18:09.661 - INFO => Document: Id = 917
2017-06-25 04:18:11.612 - INFO => start of synchronization
2017-06-25 04:18:11.615 - INFO => synchronize document starts
2017-06-25 04:18:12.479 - INFO => CHECKING DOCUMENT: Wiennerisches Diarium Num. 784, 4.-6.2.1711
2017-06-25 04:18:12.501 - INFO => FORCED UPDATE, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 1, transcribtionId = 139774
2017-06-25 04:18:12.501 - INFO => READING PAGE CONTENT, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 1
2017-06-25 04:18:14.325 - INFO => FORCED UPDATE, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 2, transcribtionId = 144499
2017-06-25 04:18:14.326 - INFO => READING PAGE CONTENT, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 2
2017-06-25 04:18:15.130 - INFO => FORCED UPDATE, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 3, transcribtionId = 144505
2017-06-25 04:18:15.131 - INFO => READING PAGE CONTENT, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 3
2017-06-25 04:18:15.817 - INFO => FORCED UPDATE, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 4, transcribtionId = 144507
2017-06-25 04:18:15.817 - INFO => READING PAGE CONTENT, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 4
2017-06-25 04:18:16.389 - INFO => FORCED UPDATE, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 5, transcribtionId = 144510
2017-06-25 04:18:16.389 - INFO => READING PAGE CONTENT, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 5
2017-06-25 04:18:16.950 - INFO => FORCED UPDATE, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 6, transcribtionId = 144511
2017-06-25 04:18:16.950 - INFO => READING PAGE CONTENT, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 6
2017-06-25 04:18:17.511 - INFO => FORCED UPDATE, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 7, transcribtionId = 144512
2017-06-25 04:18:17.511 - INFO => READING PAGE CONTENT, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 7
2017-06-25 04:18:18.163 - INFO => FORCED UPDATE, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 8, transcribtionId = 144513
2017-06-25 04:18:18.163 - INFO => READING PAGE CONTENT, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 8
2017-06-25 04:18:18.695 - INFO => FORCED UPDATE, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 9, transcribtionId = 144515
2017-06-25 04:18:18.695 - INFO => READING PAGE CONTENT, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 9
2017-06-25 04:18:19.271 - INFO => FORCED UPDATE, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 10, transcribtionId = 144516
2017-06-25 04:18:19.272 - INFO => READING PAGE CONTENT, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 10
2017-06-25 04:18:19.833 - INFO => FORCED UPDATE, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 11, transcribtionId = 144518
2017-06-25 04:18:19.833 - INFO => READING PAGE CONTENT, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 11
2017-06-25 04:18:20.374 - INFO => FORCED UPDATE, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 12, transcribtionId = 144519
2017-06-25 04:18:20.374 - INFO => READING PAGE CONTENT, title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917, page number = 12
2017-06-25 04:18:20.909 - INFO => SAVING DATA: title = Wiennerisches Diarium Num. 784, 4.-6.2.1711, docId = 917: pages : 12, textRegions: 322, lines: 700
2017-06-25 04:18:21.355 - INFO => DOCUMENT UPDATED: Wiennerisches Diarium Num. 784, 4.-6.2.1711
2017-06-25 04:18:21.355 - INFO => synchronize document ends
2017-06-25 04:18:21.355 - INFO => end of synchronization




P.S.:
Last time (Skype) I used the following SQL command to 
retrieve the data for the example:

select '{ "data": ' || array_to_json(array_agg(row_to_json(t))) || '}'
    from (
      select d.docid as id
        , d.title as Titel
        , d.createdfromtimestamp::date as Datum
        , p.pagenr as Seite        
        , p.transcribedstatus as status
        , p.nroftranscribedregions as regions
        , p.nroftranscribedlines as lines
        , p.nroftranscribedwords as words 
        from transkribusimport.documents d JOIN transkribusimport.pages p using (docid)
    ) t;
    

