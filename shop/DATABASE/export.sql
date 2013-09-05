--------------------------------------------------------
--  File created - Thursday-September-05-2013   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BILLING_ENTRY
--------------------------------------------------------

  CREATE TABLE "BILLING_ENTRY" ("BILL_ID" NUMBER, "CUST_ID" NUMBER, "ITEM_ID" NUMBER, "QUANTITY" NUMBER, "TOTAL_AMOUNT" NUMBER, "DISCOUNT" NUMBER, "TRANS_TYPE_ID" NUMBER)
--------------------------------------------------------
--  DDL for Table CUSTOMER_ACCOUNTS
--------------------------------------------------------

  CREATE TABLE "CUSTOMER_ACCOUNTS" ("CUST_ID" NUMBER, "CUST_NAME" VARCHAR2(20), "CONTACT_NO" NUMBER, "TRANS_TYPE_ID" NUMBER, "DATE" DATE)
--------------------------------------------------------
--  DDL for Table ITEM_DETAILS
--------------------------------------------------------

  CREATE TABLE "ITEM_DETAILS" ("ITEM_ID" NUMBER, "ITEM_NAME" VARCHAR2(20), "ITEM_DESC" VARCHAR2(20), "BUY" NUMBER, "SALE" NUMBER, "DATE" DATE)
--------------------------------------------------------
--  DDL for Table LOGIN
--------------------------------------------------------

  CREATE TABLE "LOGIN" ("USER_NAME" VARCHAR2(20), "PASSWORD" VARCHAR2(20), "NAME" VARCHAR2(20), "CONTACT_NO" NUMBER, "COMPANY" VARCHAR2(20), "ADDRESS" VARCHAR2(20), "EMAIL" VARCHAR2(20), "OWNER_ID" NUMBER)
--------------------------------------------------------
--  DDL for Table TRANSCATION_TYPE
--------------------------------------------------------

  CREATE TABLE "TRANSCATION_TYPE" ("TRANS_TYPE_ID" NUMBER, "TRANS_TYPE_DESC" VARCHAR2(20))
--------------------------------------------------------
--  Constraints for Table BILLING_ENTRY
--------------------------------------------------------

  ALTER TABLE "BILLING_ENTRY" ADD CONSTRAINT "BILLING_ENTRY_PK" PRIMARY KEY ("BILL_ID") ENABLE
 
  ALTER TABLE "BILLING_ENTRY" MODIFY ("BILL_ID" NOT NULL ENABLE)
 
  ALTER TABLE "BILLING_ENTRY" MODIFY ("CUST_ID" NOT NULL ENABLE)
 
  ALTER TABLE "BILLING_ENTRY" MODIFY ("ITEM_ID" NOT NULL ENABLE)
 
  ALTER TABLE "BILLING_ENTRY" MODIFY ("QUANTITY" NOT NULL ENABLE)
 
  ALTER TABLE "BILLING_ENTRY" MODIFY ("TOTAL_AMOUNT" NOT NULL ENABLE)
 
  ALTER TABLE "BILLING_ENTRY" MODIFY ("DISCOUNT" NOT NULL ENABLE)
 
  ALTER TABLE "BILLING_ENTRY" MODIFY ("TRANS_TYPE_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table TRANSCATION_TYPE
--------------------------------------------------------

  ALTER TABLE "TRANSCATION_TYPE" MODIFY ("TRANS_TYPE_ID" NOT NULL ENABLE)
 
  ALTER TABLE "TRANSCATION_TYPE" ADD CONSTRAINT "TRANSCATION_TYPE_PK" PRIMARY KEY ("TRANS_TYPE_ID") ENABLE
--------------------------------------------------------
--  Constraints for Table CUSTOMER_ACCOUNTS
--------------------------------------------------------

  ALTER TABLE "CUSTOMER_ACCOUNTS" ADD CONSTRAINT "CUSTOMER_ACCOUNTS_PK" PRIMARY KEY ("CUST_ID") ENABLE
 
  ALTER TABLE "CUSTOMER_ACCOUNTS" MODIFY ("CUST_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table LOGIN
--------------------------------------------------------

  ALTER TABLE "LOGIN" ADD CONSTRAINT "LOGIN_PK" PRIMARY KEY ("OWNER_ID") ENABLE
 
  ALTER TABLE "LOGIN" MODIFY ("USER_NAME" NOT NULL ENABLE)
 
  ALTER TABLE "LOGIN" MODIFY ("PASSWORD" NOT NULL ENABLE)
 
  ALTER TABLE "LOGIN" MODIFY ("OWNER_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table ITEM_DETAILS
--------------------------------------------------------

  ALTER TABLE "ITEM_DETAILS" ADD CONSTRAINT "ITEM_DETAILS_PK" PRIMARY KEY ("ITEM_ID") ENABLE
 
  ALTER TABLE "ITEM_DETAILS" MODIFY ("ITEM_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  DDL for Index TRANSCATION_TYPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TRANSCATION_TYPE_PK" ON "TRANSCATION_TYPE" ("TRANS_TYPE_ID")
--------------------------------------------------------
--  DDL for Index ITEM_DETAILS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ITEM_DETAILS_PK" ON "ITEM_DETAILS" ("ITEM_ID")
--------------------------------------------------------
--  DDL for Index BILLING_ENTRY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BILLING_ENTRY_PK" ON "BILLING_ENTRY" ("BILL_ID")
--------------------------------------------------------
--  DDL for Index LOGIN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LOGIN_PK" ON "LOGIN" ("OWNER_ID")
--------------------------------------------------------
--  DDL for Index CUSTOMER_ACCOUNTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CUSTOMER_ACCOUNTS_PK" ON "CUSTOMER_ACCOUNTS" ("CUST_ID")
--------------------------------------------------------
--  Ref Constraints for Table BILLING_ENTRY
--------------------------------------------------------

  ALTER TABLE "BILLING_ENTRY" ADD CONSTRAINT "BILLING_ENTRY_CUSTOMER_AC_FK1" FOREIGN KEY ("CUST_ID") REFERENCES "CUSTOMER_ACCOUNTS" ("CUST_ID") ENABLE
 
  ALTER TABLE "BILLING_ENTRY" ADD CONSTRAINT "BILLING_ENTRY_ITEM_DETAIL_FK1" FOREIGN KEY ("ITEM_ID") REFERENCES "ITEM_DETAILS" ("ITEM_ID") ENABLE
 
  ALTER TABLE "BILLING_ENTRY" ADD CONSTRAINT "BILLING_ENTRY_TRANSCATION_FK1" FOREIGN KEY ("TRANS_TYPE_ID") REFERENCES "TRANSCATION_TYPE" ("TRANS_TYPE_ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table CUSTOMER_ACCOUNTS
--------------------------------------------------------

  ALTER TABLE "CUSTOMER_ACCOUNTS" ADD CONSTRAINT "TRANS_TYPE_ID_FK" FOREIGN KEY ("TRANS_TYPE_ID") REFERENCES "TRANSCATION_TYPE" ("TRANS_TYPE_ID") ENABLE



