CREATE OR REPLACE PACKAGE DatabaseProjectMGR
IS
    PROCEDURE p_CreateUserTable;
    PROCEDURE p_CreateShopsTable;
    PROCEDURE p_DeleteAllData;
    PROCEDURE p_CreateDatabase;

END DatabaseProjectMGR;
/

CREATE OR REPLACE PACKAGE BODY DatabaseProjectMGR
AS
    PROCEDURE p_CreateUserTable
    IS
        vv_UsersTableName VARCHAR2(30) := 'TEST_USERS_T';
        vv_SqlQuerry VARCHAR2(4000);
        vv_TableCounter INTEGER;
                
    BEGIN

        vv_SqlQuerry := 'CREATE TABLE TEST_USERS_T(
                    ID INTEGER PRIMARY KEY NOT NULL
                    , LOGIN VARCHAR2(100) NOT NULL
                    , PASSWORD VARCHAR2(100) NOT NULL
                    , NAME VARCHAR2(100)
                    , LAST_NAME VARCHAR2(100))';
        
        SELECT COUNT(*) 
        INTO vv_TableCounter 
        FROM user_tables 
        WHERE 
        table_name = vv_UsersTableName;
        
        dbms_output.put_line('Counter p_CreateUserTable: ' || vv_TableCounter);

        IF vv_TableCounter = 0 THEN
            EXECUTE IMMEDIATE vv_SqlQuerry;
        END IF;
    END p_CreateUserTable;

    PROCEDURE p_CreateShopsTable
    IS
        vv_ShopsTableName VARCHAR2(30) := 'TEST_SHOPS_T';
        vv_SqlQuerry VARCHAR2(4000);
        vv_TableCounter INTEGER;
    BEGIN
        vv_SqlQuerry := 'CREATE TABLE TEST_SHOPS_T(
                    ID INTEGER PRIMARY KEY NOT NULL
                    , NAME VARCHAR2(150) NOT NULL
                    , STREET VARCHAR2(50)
                    , ADDRESS_NUMBER VARCHAR2(50)
                    , POSTAL_CODE VARCHAR(50)
                    , EMAIL_ADDRESS VARCHAR2(150)
                    , PHONE_NUMBER VARCHAR2(50)
                    , MOBILE_NUMBER VARCHAR2(50))';
                    
        SELECT COUNT(*) 
        INTO vv_TableCounter 
        FROM user_tables 
        WHERE 
        table_name = vv_ShopsTableName;
        
        dbms_output.put_line('Counter p_CreateShopsTable: ' || vv_TableCounter);

        IF vv_TableCounter = 0 THEN
            EXECUTE IMMEDIATE vv_SqlQuerry;
        END IF;

    END p_CreateShopsTable; 

    PROCEDURE p_DeleteAllData
    IS

    BEGIN

        EXECUTE IMMEDIATE 'DROP TABLE TEST_USERS_T PURGE';
        EXECUTE IMMEDIATE 'DROP TABLE  TEST_SHOPS_T PURGE';
    END p_DeleteAllData;

    PROCEDURE p_CreateDatabase
    IS

    BEGIN
    p_CreateUserTable;
    p_CreateShopsTable;
    END p_CreateDatabase;

END DatabaseProjectMGR; 
/


BEGIN 

DatabaseProjectMGR.p_CreateDatabase;

END;

/
