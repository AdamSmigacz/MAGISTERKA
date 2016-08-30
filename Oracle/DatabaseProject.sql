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
        vv_UsersTableName VARCHAR2(30) := 'TEST_USERS_T';
        vv_SqlQuerry VARCHAR2(4000);
        vv_TableCounter INTEGER;
                
    BEGIN

        vv_SqlQuerry := 'CREATE TABLE TEST_USERS_T(
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
        vv_ShopsTableName VARCHAR2(30) := 'TEST_SHOPS_T';
        vv_SqlQuerry VARCHAR2(4000);
        vv_TableCounter INTEGER;
    BEGIN
        vv_SqlQuerry := 'CREATE TABLE TEST_SHOPS_T(
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
        vv_UserOpinionTableName VARCHAR2(30) := 'TEST_USEROPINION_T';
        vv_SqlQuerry VARCHAR2(4000);
        vv_TableCounter INTEGER;
    
    BEGIN
    
        vv_SqlQuerry := 'CREATE TABLE TEST_USEROPINION_T ( 
                    ID INTEGER PRIMARY KEY
                    , USER_ID INTEGER CONSTRAINT fk_user_id references TEST_USERS_T(ID)
                    , SHOP_ID INTEGER CONSTRAINT fk_shop_id references TEST_SHOPS_T(ID)
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
        vv_ProductTableName VARCHAR2(30) := 'TEST_PRODUCTS_T';
        vv_SqlQuerry VARCHAR2(4000);
        vv_TableCounter INTEGER;
    BEGIN
    
        vv_SqlQuerry := 'CREATE TABLE test_products_t(
                    ID INTEGER CONSTRAINT products_pk PRIMARY KEY NOT NULL
                    , NAME VARCHAR2(400) NOT NULL
                    , SHOP_ID CONSTRAINT fk_test_shop_id REFERENCES TEST_SHOPS_T(ID) NOT NULL
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


    PROCEDURE p_CreateProductValuesTable 
    IS
        vv_ProductValuesTableName VARCHAR2(30) := 'TEST_PRODUCTVALUES_T';
        vv_SqlQuerry VARCHAR2(4000);
        vv_TableCounter INTEGER;
    BEGIN
    
        vv_SqlQuerry := 'CREATE TABLE TEST_PRODUCTVALUES_T( 
                    PRODUCT_ID INTEGER CONSTRAINT FK_PRODUCT_KEY REFERENCES TEST_PRODUCTS_T(ID)
                    , PRODUCT_VALUES VARCHAR2(1000)
                    , CATEGORY_ID INTEGER CONSTRAINT FK_PRODUCTCATEGORY_KEY REFERENCES TEST_PRODUCTSCATEGORY_T(ID))';
    
        SELECT COUNT(*) 
        INTO vv_TableCounter 
        FROM user_tables 
        WHERE 
        table_name = vv_ProductValuesTableName;
        
        dbms_output.put_line('Counter p_CreateProductValuesTable: ' || vv_TableCounter);
        
        IF vv_TableCounter = 0 THEN
            EXECUTE IMMEDIATE vv_SqlQuerry;
        END IF;
        
    END p_CreateProductValuesTable;
    
    
    PROCEDURE p_CreateProductsCategoryTable 
    IS
        vv_ProductCategoryTableName VARCHAR2(30) := 'TEST_PRODUCTSCATEGORY_T';
        vv_SqlQuerry VARCHAR2(4000);
        vv_TableCounter INTEGER;
    BEGIN
    
        vv_SqlQuerry := 'CREATE TABLE TEST_PRODUCTSCATEGORY_T( 
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
        WHERE table_name = 'TEST_USEROPINION_T';
        
        SELECT COUNT(*)
        INTO vi_TableCounterUsers
        FROM user_tables 
        WHERE table_name = 'TEST_USERS_T';
        
        SELECT COUNT(*)
        INTO vi_TableCounterShops
        FROM user_tables 
        WHERE table_name = 'TEST_SHOPS_T';
        
        SELECT COUNT(*)
        INTO vi_TableCounterProducts
        FROM user_tables 
        WHERE table_name = 'TEST_PRODUCTS_T';
        
        SELECT COUNT(*)
        INTO vi_CounterProductsCategory
        FROM user_tables 
        WHERE table_name = 'TEST_PRODUCTSCATEGORY_T';
           
        SELECT COUNT(*)
        INTO vi_CounterProductsValues
        FROM user_tables 
        WHERE table_name = 'TEST_PRODUCTVALUES_T';
        
        DBMS_OUTPUT.Put_Line( vi_TableCounterOpinion );  
        DBMS_OUTPUT.Put_Line( vi_TableCounterUsers );  
        DBMS_OUTPUT.Put_Line( vi_CounterProductsValues );  
        DBMS_OUTPUT.Put_Line( vi_TableCounterProducts );  
        DBMS_OUTPUT.Put_Line( vi_TableCounterShops );  
        DBMS_OUTPUT.Put_Line( vi_CounterProductsCategory );  

        
        IF vi_TableCounterOpinion != 0 THEN
            EXECUTE IMMEDIATE 'DROP TABLE TEST_USEROPINION_T PURGE';
        END IF;
        
        IF vi_TableCounterUsers != 0 THEN
            EXECUTE IMMEDIATE 'DROP TABLE TEST_USERS_T PURGE';
        END IF;
        
        IF vi_CounterProductsValues != 0 THEN
            EXECUTE IMMEDIATE 'DROP TABLE  TEST_PRODUCTVALUES_T PURGE';
        END IF;
        
        IF vi_TableCounterProducts != 0 THEN
            EXECUTE IMMEDIATE 'DROP TABLE  TEST_PRODUCTS_T PURGE';
        END IF;
        
        IF vi_TableCounterShops != 0 THEN
            EXECUTE IMMEDIATE 'DROP TABLE  TEST_SHOPS_T PURGE';
        END IF;
        
        IF vi_CounterProductsCategory != 0 THEN
            EXECUTE IMMEDIATE 'DROP TABLE TEST_PRODUCTSCATEGORY_T PURGE';
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
        p_CreateProductValuesTable;
        
    END p_CreateDatabase;

END DatabaseProjectMGR; 
/


BEGIN 

DatabaseProjectMGR.p_CreateDatabase;
--DatabaseProjectMGR.p_deletealldata;
END;

/

