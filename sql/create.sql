SET datestyle to 'European';

CREATE TABLE MERGED_DATA
(
  "id" varchar(256),
  "stress_before_test1" numeric,
  "score_test1" numeric,
  "iq" numeric,
  "cognitive_task2" numeric,
  "practice_task2" numeric,
  "response_time_task2" numeric,
  "college_math" numeric,
  "score_math_course1" numeric,
  "score_math_course2" numeric,

  CONSTRAINT pk_merged_data PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
