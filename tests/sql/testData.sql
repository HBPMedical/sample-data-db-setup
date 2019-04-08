BEGIN;

-- Plan the tests
SELECT plan( 9 );

SELECT is(count(*)::INT, 1, 'Sample #150 should be present')
  FROM sample_data where id=150;

SELECT is(count(*)::INT, 3333, 'Churn table does not have the expected number of rows')
  FROM churn;

SELECT is(count(*)::INT, 147, 'Iris table does not have the expected number of rows')
  FROM iris;

SELECT is(count(*)::INT, 1000, 'cde_features_a table does not have the expected number of rows for dataset desd-synthdata')
  FROM cde_features_a where dataset = 'desd-synthdata';

SELECT is(count(*)::INT, 1000, 'cde_features_b table does not have the expected number of rows for dataset nida-synthdata')
  FROM cde_features_b where dataset = 'nida-synthdata';

SELECT is(count(*)::INT, 1000, 'cde_features_c table does not have the expected number of rows for dataset qqni-synthdata')
  FROM cde_features_c where dataset = 'qqni-synthdata';

SELECT is(count(*)::INT, 1000, 'mip_cde_features table does not have the expected number of rows for dataset desd-synthdata')
  FROM mip_cde_features where dataset = 'desd-synthdata';

SELECT is(count(*)::INT, 1000, 'mip_cde_features table does not have the expected number of rows for dataset nida-synthdata')
  FROM mip_cde_features where dataset = 'nida-synthdata';

SELECT is(count(*)::INT, 1000, 'mip_cde_features table does not have the expected number of rows for dataset qqni-synthdata')
  FROM mip_cde_features where dataset = 'qqni-synthdata';

-- Clean up
SELECT * FROM finish();
ROLLBACK;
