BEGIN;

-- Plan the tests
SELECT plan( 23);

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

SELECT has_column( 'churn', 'state' );
SELECT has_column( 'churn', 'account_length' );
SELECT has_column( 'churn', 'area_code' );
SELECT has_column( 'churn', 'phone' );
SELECT has_column( 'churn', 'intl_plan' );
SELECT has_column( 'churn', 'churn' );

SELECT has_table( 'iris' );

SELECT has_column( 'iris', 'Name' );
SELECT has_column( 'iris', 'SepalLength' );
SELECT has_column( 'iris', 'SepalWidth' );
SELECT has_column( 'iris', 'PetalLength' );
SELECT has_column( 'iris', 'PetalWidth' );

-- Clean up
SELECT * FROM finish();
ROLLBACK;
