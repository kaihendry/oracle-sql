-- CONNECT TEST
ALTER SESSION SET EVENTS '10150 TRACE NAME CONTEXT FOREVER, LEVEL 1';
ALTER SESSION SET EVENTS '10904 TRACE NAME CONTEXT FOREVER, LEVEL 1';
ALTER SESSION SET EVENTS '25475 TRACE NAME CONTEXT FOREVER, LEVEL 1';
ALTER SESSION SET EVENTS '10407 TRACE NAME CONTEXT FOREVER, LEVEL 1';
ALTER SESSION SET EVENTS '10851 TRACE NAME CONTEXT FOREVER, LEVEL 1';
ALTER SESSION SET EVENTS '22830 TRACE NAME CONTEXT FOREVER, LEVEL 192 ';
-- new object type path: SCHEMA_EXPORT/PRE_SCHEMA/PROCACT_SCHEMA

BEGIN 
sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'XEPDB1', inst_scn=>'2636950');
COMMIT; 
END; 
/ 
-- new object type path: SCHEMA_EXPORT/TABLE/TABLE
CREATE TABLE "TEST"."CURRENCIES_COUNTRIES" 
   (	"CURRENCY_ID" VARCHAR2(3 BYTE) NOT NULL ENABLE, 
	"COUNTRY_ID" VARCHAR2(3 BYTE) NOT NULL ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
CREATE TABLE "TEST"."REGIONS" 
   (	"REGION_ID" VARCHAR2(2 BYTE) NOT NULL ENABLE, 
	"NAME" VARCHAR2(13 BYTE) NOT NULL ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
CREATE TABLE "TEST"."CITIES" 
   (	"CITY_ID" VARCHAR2(7 BYTE) NOT NULL ENABLE, 
	"NAME" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"OFFICIAL_NAME" VARCHAR2(200 BYTE), 
	"POPULATION" NUMBER(8,0), 
	"IS_CAPITAL" CHAR(1 BYTE) DEFAULT 'N' NOT NULL ENABLE, 
	"LATITUDE" NUMBER(8,5), 
	"LONGITUDE" NUMBER(8,5), 
	"TIMEZONE" VARCHAR2(40 BYTE), 
	"COUNTRY_ID" VARCHAR2(3 BYTE) NOT NULL ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
CREATE TABLE "TEST"."COUNTRIES" 
   (	"COUNTRY_ID" VARCHAR2(3 BYTE) NOT NULL ENABLE, 
	"COUNTRY_CODE" VARCHAR2(2 BYTE) NOT NULL ENABLE, 
	"NAME" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"OFFICIAL_NAME" VARCHAR2(200 BYTE), 
	"POPULATION" NUMBER(10,0), 
	"AREA_SQ_KM" NUMBER(10,2), 
	"LATITUDE" NUMBER(8,5), 
	"LONGITUDE" NUMBER(8,5), 
	"TIMEZONE" VARCHAR2(40 BYTE), 
	"REGION_ID" VARCHAR2(2 BYTE) NOT NULL ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
CREATE TABLE "TEST"."CURRENCIES" 
   (	"CURRENCY_ID" VARCHAR2(3 BYTE) NOT NULL ENABLE, 
	"NAME" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"OFFICIAL_NAME" VARCHAR2(200 BYTE), 
	"SYMBOL" VARCHAR2(18 BYTE) NOT NULL ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
-- new object type path: SCHEMA_EXPORT/TABLE/INDEX/INDEX
CREATE UNIQUE INDEX "TEST"."CURRENCIES_COUNTRIES_PK" ON "TEST"."CURRENCIES_COUNTRIES" ("CURRENCY_ID", "COUNTRY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
CREATE UNIQUE INDEX "TEST"."REGIONS_PK" ON "TEST"."REGIONS" ("REGION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
CREATE UNIQUE INDEX "TEST"."CITIES_PK" ON "TEST"."CITIES" ("CITY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
CREATE INDEX "TEST"."CITIES_COUNTRIES_FK001" ON "TEST"."CITIES" ("COUNTRY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
CREATE UNIQUE INDEX "TEST"."COUNTRIES_PK" ON "TEST"."COUNTRIES" ("COUNTRY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
CREATE INDEX "TEST"."COUNTRIES_REGIONS_FK001" ON "TEST"."COUNTRIES" ("REGION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
CREATE UNIQUE INDEX "TEST"."CURRENCIES_PK" ON "TEST"."CURRENCIES" ("CURRENCY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
-- new object type path: SCHEMA_EXPORT/TABLE/CONSTRAINT/CONSTRAINT
ALTER TABLE "TEST"."CURRENCIES_COUNTRIES" ADD CONSTRAINT "CURRENCIES_COUNTRIES_PK" PRIMARY KEY ("CURRENCY_ID", "COUNTRY_ID")
  USING INDEX "TEST"."CURRENCIES_COUNTRIES_PK"  ENABLE;
ALTER TABLE "TEST"."REGIONS" ADD CONSTRAINT "REGIONS_PK" PRIMARY KEY ("REGION_ID")
  USING INDEX "TEST"."REGIONS_PK"  ENABLE;
ALTER TABLE "TEST"."CITIES" ADD CONSTRAINT "CITIES_PK" PRIMARY KEY ("CITY_ID")
  USING INDEX "TEST"."CITIES_PK"  ENABLE;
ALTER TABLE "TEST"."CITIES" ADD CONSTRAINT "CITIES_IS_CAPITAL_Y_N_CHECK001" CHECK (is_capital IN ('Y','N')) ENABLE;
ALTER TABLE "TEST"."COUNTRIES" ADD CONSTRAINT "COUNTRIES_PK" PRIMARY KEY ("COUNTRY_ID")
  USING INDEX "TEST"."COUNTRIES_PK"  ENABLE;
ALTER TABLE "TEST"."CURRENCIES" ADD CONSTRAINT "CURRENCIES_PK" PRIMARY KEY ("CURRENCY_ID")
  USING INDEX "TEST"."CURRENCIES_PK"  ENABLE;
-- new object type path: SCHEMA_EXPORT/TABLE/INDEX/STATISTICS/INDEX_STATISTICS
-- new object type path: SCHEMA_EXPORT/TABLE/CONSTRAINT/REF_CONSTRAINT
ALTER TABLE "TEST"."CURRENCIES_COUNTRIES" ADD CONSTRAINT "CURRENCIES_COUNTRIES_CURRENCIES_FK001" FOREIGN KEY ("CURRENCY_ID")
	  REFERENCES "TEST"."CURRENCIES" ("CURRENCY_ID") ENABLE;
ALTER TABLE "TEST"."CURRENCIES_COUNTRIES" ADD CONSTRAINT "CURRENCIES_COUNTRIES_COUNTRIES_FK002" FOREIGN KEY ("COUNTRY_ID")
	  REFERENCES "TEST"."COUNTRIES" ("COUNTRY_ID") ENABLE;
ALTER TABLE "TEST"."CITIES" ADD CONSTRAINT "CITIES_COUNTRIES_FK001" FOREIGN KEY ("COUNTRY_ID")
	  REFERENCES "TEST"."COUNTRIES" ("COUNTRY_ID") ENABLE;
ALTER TABLE "TEST"."COUNTRIES" ADD CONSTRAINT "COUNTRIES_REGIONS_FK001" FOREIGN KEY ("REGION_ID")
	  REFERENCES "TEST"."REGIONS" ("REGION_ID") ENABLE;
-- new object type path: SCHEMA_EXPORT/TABLE/STATISTICS/TABLE_STATISTICS
-- new object type path: SCHEMA_EXPORT/STATISTICS/MARKER
-- fixup virtual columns... 
-- done fixup virtual columns 
