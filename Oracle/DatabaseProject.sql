CREATE OR REPLACE PACKAGE DatabaseProjectMGR
IS
    PROCEDURE p_CreateUserTable;
    PROCEDURE p_CreateShopsTable;
    PROCEDURE p_CrateUserOpinionTable;
    PROCEDURE p_CreateProductsTable;
    PROCEDURE p_CreateProductsCategoryTable;
    
    PROCEDURE p_DeleteAllData;
    PROCEDURE p_CreateDatabase;

END DatabaseProjectMGR;
/

CREATE OR REPLACE PACKAGE BODY DatabaseProjectMGR
AS
    PROCEDURE p_CreateUserTable
    IS
        vv_UsersTableName VARCHAR2(30) := 'USERS_T';
        vv_SqlQuerry VARCHAR2(4000);
        vv_TableCounter INTEGER;
                
    BEGIN

        vv_SqlQuerry := 'CREATE TABLE USERS_T(
                    ID INTEGER CONSTRAINT pk_users_id PRIMARY KEY NOT NULL
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
        vv_ShopsTableName VARCHAR2(30) := 'SHOPS_T';
        vv_SqlQuerry VARCHAR2(4000);
        vv_TableCounter INTEGER;
    BEGIN
        vv_SqlQuerry := 'CREATE TABLE SHOPS_T(
                    ID INTEGER CONSTRAINT pk_shops_id PRIMARY KEY NOT NULL
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

    PROCEDURE p_CrateUserOpinionTable
    IS
        vv_UserOpinionTableName VARCHAR2(30) := 'USEROPINION_T';
        vv_SqlQuerry VARCHAR2(4000);
        vv_TableCounter INTEGER;
    
    BEGIN
    
        vv_SqlQuerry := 'CREATE TABLE USEROPINION_T ( 
                    ID INTEGER PRIMARY KEY
                    , USER_ID INTEGER CONSTRAINT fk_user_id references USERS_T(ID)
                    , SHOP_ID INTEGER CONSTRAINT fk_shop_id references SHOPS_T(ID)
                    , PRODUCT_ID INTEGER --do zmiany jak bedzie gotowa tabela produktow
                    , OPINION VARCHAR2(3000)   
                    , RATE INTEGER 
                    , CONSTRAINT check_rate
                      CHECK (RATE between 0 and 10))';
                    
        SELECT COUNT(*) 
        INTO vv_TableCounter 
        FROM user_tables 
        WHERE 
        table_name = vv_UserOpinionTableName;
        
        dbms_output.put_line('Counter p_CrateUserOpinionTable: ' || vv_TableCounter);
        
        IF vv_TableCounter = 0 THEN
            EXECUTE IMMEDIATE vv_SqlQuerry;
        END IF;
    
    END p_CrateUserOpinionTable;
  
    PROCEDURE p_CreateProductsTable 
    IS
        vv_ProductTableName VARCHAR2(30) := 'PRODUCTS_T';
        vv_SqlQuerry VARCHAR2(4000);
        vv_TableCounter INTEGER;
    BEGIN
    
        vv_SqlQuerry := 'CREATE TABLE PRODUCTS_T(
                    ID INTEGER CONSTRAINT products_pk PRIMARY KEY NOT NULL
                    , NAME VARCHAR2(400) NOT NULL
                    , SHOP_ID CONSTRAINT fk_shop_id REFERENCES SHOPS_T(ID) NOT NULL
                    , PRICE NUMBER(9,2) NOT NULL)';
    
        SELECT COUNT(*) 
        INTO vv_TableCounter 
        FROM user_tables 
        WHERE 
        table_name = vv_ProductTableName;
        
        dbms_output.put_line('Counter p_CreateProductsTable: ' || vv_TableCounter);
        
        IF vv_TableCounter = 0 THEN
            EXECUTE IMMEDIATE vv_SqlQuerry;
        END IF;
        
    END p_CreateProductsTable;

    
    
    PROCEDURE p_CreateProductsCategoryTable 
    IS
        vv_ProductCategoryTableName VARCHAR2(30) := 'PRODUCTSCATEGORY_T';
        vv_SqlQuerry VARCHAR2(4000);
        vv_TableCounter INTEGER;
    BEGIN
    
        vv_SqlQuerry := 'CREATE TABLE PRODUCTSCATEGORY_T( 
                    ID INTEGER CONSTRAINT PK_productsCategory_t PRIMARY KEY
                    , PARENT_ID INTEGER
                    , NAME VARCHAR2(1000))';
    
        SELECT COUNT(*) 
        INTO vv_TableCounter 
        FROM user_tables 
        WHERE 
        table_name = vv_ProductCategoryTableName;
        
        dbms_output.put_line('Counter p_CreateProductsCategoryTable: ' || vv_TableCounter);
        
        IF vv_TableCounter = 0 THEN
            EXECUTE IMMEDIATE vv_SqlQuerry;
        END IF;
        
    END p_CreateProductsCategoryTable;
     
    PROCEDURE p_DeleteAllData
    IS
        vi_TableCounterUsers INTEGER;
        vi_TableCounterShops INTEGER;
        vi_TableCounterOpinion INTEGER;
        vi_TableCounterProducts INTEGER;
        vi_CounterProductsCategory INTEGER;
        vi_CounterProductsValues INTEGER;
    BEGIN
    
        SELECT COUNT(*)
        INTO vi_TableCounterOpinion
        FROM user_tables 
        WHERE table_name = 'USEROPINION_T';
        
        SELECT COUNT(*)
        INTO vi_TableCounterUsers
        FROM user_tables 
        WHERE table_name = 'USERS_T';
        
        SELECT COUNT(*)
        INTO vi_TableCounterShops
        FROM user_tables 
        WHERE table_name = 'SHOPS_T';
        
        SELECT COUNT(*)
        INTO vi_TableCounterProducts
        FROM user_tables 
        WHERE table_name = 'PRODUCTS_T';
        
        SELECT COUNT(*)
        INTO vi_CounterProductsCategory
        FROM user_tables 
        WHERE table_name = 'PRODUCTSCATEGORY_T';
           

        
        DBMS_OUTPUT.Put_Line( vi_TableCounterOpinion );  
        DBMS_OUTPUT.Put_Line( vi_TableCounterUsers );  
        DBMS_OUTPUT.Put_Line( vi_TableCounterProducts );  
        DBMS_OUTPUT.Put_Line( vi_TableCounterShops );  
        DBMS_OUTPUT.Put_Line( vi_CounterProductsCategory );  

        
        IF vi_TableCounterOpinion != 0 THEN
            EXECUTE IMMEDIATE 'DROP TABLE USEROPINION_T PURGE';
        END IF;
        
        IF vi_TableCounterUsers != 0 THEN
            EXECUTE IMMEDIATE 'DROP TABLE USERS_T PURGE';
        END IF;
        
        IF vi_TableCounterProducts != 0 THEN
            EXECUTE IMMEDIATE 'DROP TABLE PRODUCTS_T PURGE';
        END IF;
        
        IF vi_TableCounterShops != 0 THEN
            EXECUTE IMMEDIATE 'DROP TABLE SHOPS_T PURGE';
        END IF;
        
        IF vi_CounterProductsCategory != 0 THEN
            EXECUTE IMMEDIATE 'DROP TABLE PRODUCTSCATEGORY_T PURGE';
        END IF;
    END p_DeleteAllData;

    PROCEDURE p_CreateDatabase
    IS

    BEGIN
        p_CreateUserTable;
        p_CreateShopsTable;
        p_CrateUserOpinionTable;
        p_CreateProductsTable;
        p_CreateProductsCategoryTable;
     
    END p_CreateDatabase;

END DatabaseProjectMGR; 
/


BEGIN 

DatabaseProjectMGR.p_CreateDatabase; -- stworzenie tabel uzytkownika MGR
--DatabaseProjectMGR.p_deletealldata;  -- usuniecie tabel uzytkownika MGR
END;

/

