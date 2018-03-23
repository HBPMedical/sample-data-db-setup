BEGIN;

-- Plan the tests
SELECT plan( 6 );

SELECT is(count(*)::INT, 1, 'Sample #150 should be present')
  FROM sample_data where id=150;

SELECT is(count(*)::INT, 3333, 'Churn table does not have the expected number of rows')
  FROM churn;

SELECT is(count(*)::INT, 150, 'Iris table does not have the expected number of rows')
  FROM iris;

SELECT is(count(*)::INT, 1000, 'cde_features_mixed table does not have the expected number of rows for dataset desd-synthdata')
  FROM cde_features_mixed where dataset = 'desd-synthdata';

SELECT is(count(*)::INT, 1000, 'cde_features_mixed table does not have the expected number of rows for dataset nida-synthdata')
  FROM cde_features_mixed where dataset = 'nida-synthdata';

SELECT is(count(*)::INT, 1000, 'cde_features_mixed table does not have the expected number of rows for dataset qqni-synthdata')
  FROM cde_features_mixed where dataset = 'qqni-synthdata';

-- Clean up
SELECT * FROM finish();
ROLLBACK;
