BEGIN;

-- Plan the tests
SELECT plan( 17 );

SELECT has_table( 'sample_data' );

SELECT has_column( 'sample_data', 'id' );
SELECT has_column( 'sample_data', 'stress_before_test1' );
SELECT has_column( 'sample_data', 'cognitive_task2' );
SELECT has_column( 'sample_data', 'practice_task2' );
SELECT has_column( 'sample_data', 'response_time_task2' );
SELECT has_column( 'sample_data', 'college_math' );
SELECT has_column( 'sample_data', 'score_math_course1' );
SELECT has_column( 'sample_data', 'score_math_course2' );
SELECT col_is_pk(  'sample_data', 'id' );

SELECT has_table( 'churn' );

SELECT has_column( 'churn', 'State' );
SELECT has_column( 'churn', 'Account_Length' );
SELECT has_column( 'churn', 'Area_Code' );
SELECT has_column( 'churn', 'Phone' );
SELECT has_column( 'churn', 'Intl_Plan' );
SELECT has_column( 'churn', 'Churn' );

-- Clean up
SELECT * FROM finish();
ROLLBACK;
