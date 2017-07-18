BEGIN;

-- Plan the tests
SELECT plan( 10 );

SELECT has_table( 'merged_data' );

SELECT has_column( 'merged_data', 'id' );
SELECT has_column( 'merged_data', 'stress_before_test1' );
SELECT has_column( 'merged_data', 'cognitive_task2' );
SELECT has_column( 'merged_data', 'practice_task2' );
SELECT has_column( 'merged_data', 'response_time_task2' );
SELECT has_column( 'merged_data', 'college_math' );
SELECT has_column( 'merged_data', 'score_math_course1' );
SELECT has_column( 'merged_data', 'score_math_course2' );
SELECT col_is_pk(  'merged_data', 'id' );

-- Clean up
SELECT * FROM finish();
ROLLBACK;
