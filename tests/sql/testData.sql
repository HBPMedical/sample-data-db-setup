BEGIN;

-- Plan the tests
SELECT plan( 3 );

SELECT is(count(*)::INT, 1, 'Sample #150 should be present')
  FROM sample_data where id=150;

SELECT is(count(*)::INT, 3333, 'Churn table does not have the expected number of rows')
  FROM churn;

SELECT is(count(*)::INT, 150, 'Iris table does not have the expected number of rows')
  FROM iris;
-- Clean up
SELECT * FROM finish();
ROLLBACK;
