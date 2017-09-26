
CREATE TABLE CHURN
(
  "state" char(2),
  "account_length" int,
  "area_code" varchar(20),
  "phone" varchar(20),
  "intl_plan" varchar(20),
  "vmail_plan" varchar(20),
  "vmail_message" varchar(20),
  "day_mins" numeric,
  "day_calls" int,
  "day_charge" numeric,
  "eve_mins" numeric,
  "eve_calls" int,
  "eve_charge" numeric,
  "night_mins" numeric,
  "night_calls" int,
  "night_charge" numeric,
  "intl_mins" numeric,
  "intl_calls" int,
  "intl_charge" numeric,
  "custserv_calls" int,
  "churn" varchar(20)
);
