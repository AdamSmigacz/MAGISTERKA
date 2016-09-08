--Database MYSQL

CREATE TABLE USERS_T(
                    ID INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT
                    , LOGIN VARCHAR(100) NOT NULL
                    , PASSWORD VARCHAR(100) NOT NULL
					, SUGGESTION_FOR_PASSWORD VARCHAR(100) NOT NULL
                    , NAME VARCHAR(100)
                    , LAST_NAME VARCHAR(100))

/

CREATE TABLE SHOPS_T(
                    ID INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT
                    , NAME VARCHAR(150) NOT NULL
                    , STREET VARCHAR(50)
                    , ADDRESS_NUMBER VARCHAR(50)
                    , POSTAL_CODE VARCHAR(50)
                    , EMAIL_ADDRESS VARCHAR(150)
                    , PHONE_NUMBER VARCHAR(50)
                    , MOBILE_NUMBER VARCHAR(50))

					/
					
CREATE TABLE USEROPINION_T ( 
                    ID INTEGER PRIMARY KEY
                    , USER_ID INTEGER 
                    , SHOP_ID INTEGER 
                    , PRODUCT_ID INTEGER 
                    , OPINION VARCHAR(3000)   
                    , RATE INTEGER 
					, FOREIGN KEY (USER_ID) references USERS_T(ID)
					, FOREIGN KEY (SHOP_ID) references SHOPS_T(ID))
                     
					 
CREATE TABLE PRODUCTS_T(
                    ID INTEGER  PRIMARY KEY NOT NULL AUTO_INCREMENT
                    , NAME VARCHAR(400) NOT NULL
                    , SHOP_ID INTEGER NOT NULL
                    , PRICE INTEGER NOT NULL
					, PRODUCTSCATEGORY_ID INTEGER NOT NULL
					, FOREIGN KEY (SHOP_ID) references SHOPS_T(ID)
					, FOREIGN KEY (PRODUCTSCATEGORY_ID) references PRODUCTSCATEGORY_ID(ID))
/

CREATE TABLE PRODUCTSCATEGORY_T( 
                    ID INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT
                    , PARENT_ID INTEGER
                    , NAME VARCHAR(1000))