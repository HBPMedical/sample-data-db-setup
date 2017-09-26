
CREATE TABLE CHURN
(
  "State" char(2),
  "Account_Length" int,
  "Area_Code" varchar(20),
  "Phone" varchar(20),
  "Intl_Plan" varchar(20),
  "VMail_Plan" varchar(20),
  "VMail_Message" varchar(20),
  "Day_Mins" numeric,
  "Day_Calls" int,
  "Day_Charge" numeric,
  "Eve_Mins" numeric,
  "Eve_Calls" int,
  "Eve_Charge" numeric,
  "Night_Mins" numeric,
  "Night_Calls" int,
  "Night_Charge" numeric,
  "Intl_Mins" numeric,
  "Intl_Calls" int,
  "Intl_Charge" numeric,
  "CustServ_Calls" int,
  "Churn" varchar(20)
);
