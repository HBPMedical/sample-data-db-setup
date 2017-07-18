BEGIN;

-- Plan the tests
SELECT plan( 6 );

SELECT has_table( 'merged_data' );

SELECT has_column( 'merged_data', 'ID' );
SELECT has_column( 'merged_data', 'stress.before.test1' );
SELECT has_column( 'merged_data', 'cognitive.task2"' );
SELECT has_column( 'merged_data', 'practice.task2' );
SELECT has_column( 'merged_data', 'response.time.task2' );
SELECT has_column( 'merged_data', 'college.math' );
SELECT has_column( 'merged_data', 'score.math.course1' );
SELECT has_column( 'merged_data', 'score.math.course2' );
SELECT col_is_pk(  'merged_data', 'ID' );

-- Clean up
SELECT * FROM finish();
ROLLBACK;
