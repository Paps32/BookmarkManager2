# Bookmark Manager

Summary of our project:
We are building a web app which stores bookmarks in a bookmark manager using databases.

## User Stories

```
As a person,
So that I can see bookmarks I have logged,
I’d like to see a list of bookmarks on my screen.
```  

```
As a person,
So that I can keep URL's I like,
I’d like to add bookmarks to my bookmark manager.
```

```
As a person
So I can remove my bookmark from Bookmark Manager
I want to delete a bookmark
```


| Noun | Verb |
|-----|-----|
| Person | See |
| Bookmark | -  |
| List |    _    |    
| Screen |    -   |    

Bookmark <— See —> List

## How to create a database using PSQL (download Postgresql)

1.Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql
5. Run the query we have saved in the file 02_add_title_to_bookmarks.sql

## Database for Testing
1. connect to psql using the command line command `psql`.
0. create a database for testing using `CREATE DATABASE bookmark_manager_test;`.
0.  Run the query we have saved in the file 01_create_bookmarks_table.sql
0. Run the query we have saved in the file 02_add_title_to_bookmarks.sql
