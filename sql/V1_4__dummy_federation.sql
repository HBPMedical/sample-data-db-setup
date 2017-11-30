-- Collection of tables imported from the tests previously used in algorithm-repository

CREATE TABLE job_result_nodes
(
  job_id character varying(128) NOT NULL,
  node character varying(32) NOT NULL,
  timestamp timestamp default now(),
  data text,
  error character varying(256),
  shape character varying(256),
  function character varying(256),

  CONSTRAINT pk_job_result_nodes PRIMARY KEY (job_id, node)
)
WITH (
  OIDS=FALSE
);

-- Intermediate results taken from selecting the left then the right Hippocampus

insert into job_result_nodes values (
    '001',
    'left',
    now(),
    '[{"tissue1_volume":0.0068206,"_row":"min"},{"tissue1_volume":0.00854425,"_row":"q1"},{"tissue1_volume":0.00931945,"_row":"median"},{"tissue1_volume":0.00988832,"_row":"q3"},{"tissue1_volume":0.011463,"_row":"max"},{"tissue1_volume":0.00919402,"_row":"mean"},{"tissue1_volume":0.00091985,"_row":"std"},{"tissue1_volume":0.4597012,"_row":"sum"},{"tissue1_volume":50,"_row":"count"}]',
    NULL,
    'r_dataframe_intermediate',
    'linear-regression-local'
  );
insert into job_result_nodes values (
    '001',
    'right',
    now(),
    '[{"tissue1_volume":0.0073848,"_row":"min"},{"tissue1_volume":0.00873188,"_row":"q1"},{"tissue1_volume":0.009281,"_row":"median"},{"tissue1_volume":0.00979248,"_row":"q3"},{"tissue1_volume":0.011352,"_row":"max"},{"tissue1_volume":0.00918817,"_row":"mean"},{"tissue1_volume":0.00084669,"_row":"std"},{"tissue1_volume":0.4594084,"_row":"sum"},{"tissue1_volume":50,"_row":"count"}]',
    NULL,
    'r_dataframe_intermediate',
    'linear-regression-local'
  );

-- Intermediate results taken selecting even then odd IDs

-- select feature_name, tissue1_volume from brain_feature where mod(id::int, 2) = 0 order by tissue1_volume
insert into job_result_nodes values (
    '002',
    'even',
    now(),
    '{"beta":[{"coefficients":1.27349187,"_row":"(Intercept)"},{"coefficients":24.69966216,"_row":"tissue1_volume"}],"sigma":[{"_row":"(Intercept)"},{"_row":"tissue1_volume"}]}',
    NULL,
    'r_other',
    'linear-regression-local'
  );
-- select feature_name, tissue1_volume from brain_feature where mod(id::int, 2) = 1 order by tissue1_volume
insert into job_result_nodes values (
    '002',
    'odd',
    now(),
    '{"beta":[{"coefficients":1.66529776,"_row":"(Intercept)"},{"coefficients":-17.95771987,"_row":"tissue1_volume"}],"sigma":[{"_row":"(Intercept)"},{"_row":"tissue1_volume"}]}',
    NULL,
    'r_other',
    'linear-regression-local'
  );
