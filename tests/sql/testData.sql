BEGIN;

-- Plan the tests
SELECT plan( 2 );

SELECT is(count(*)::INT, 1, 'Sample #150 should be present')
  FROM sample_data where id=150;

SELECT is(count(*)::INT, 3333, 'Churn table does not have the expected number of rows')
  FROM churn;

-- Clean up
SELECT * FROM finish();
ROLLBACK;
