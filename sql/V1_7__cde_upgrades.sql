ALTER TABLE cde_features_a
  RENAME COLUMN "neurogenerativescategories" TO "neurodegenerativescategories"
;
ALTER TABLE cde_features_a
  ADD COLUMN "ab1_40" numeric
;
ALTER TABLE cde_features_a
  ADD COLUMN "ab1_42" numeric
;
ALTER TABLE cde_features_a
  ADD COLUMN "p_tau" numeric
;
ALTER TABLE cde_features_a
  ADD COLUMN "t_tau" numeric
;

ALTER TABLE cde_features_b
  RENAME COLUMN "neurogenerativescategories" TO "neurodegenerativescategories"
;
ALTER TABLE cde_features_b
  ADD COLUMN "ab1_40" numeric
;
ALTER TABLE cde_features_b
  ADD COLUMN "ab1_42" numeric
;
ALTER TABLE cde_features_b
  ADD COLUMN "p_tau" numeric
;
ALTER TABLE cde_features_b
  ADD COLUMN "t_tau" numeric
;

ALTER TABLE cde_features_c
  RENAME COLUMN "neurogenerativescategories" TO "neurodegenerativescategories"
;
ALTER TABLE cde_features_c
  ADD COLUMN "ab1_40" numeric
;
ALTER TABLE cde_features_c
  ADD COLUMN "ab1_42" numeric
;
ALTER TABLE cde_features_c
  ADD COLUMN "p_tau" numeric
;
ALTER TABLE cde_features_c
  ADD COLUMN "t_tau" numeric
;

ALTER TABLE cde_features_mixed
  RENAME COLUMN "neurogenerativescategories" TO "neurodegenerativescategories"
;
ALTER TABLE cde_features_mixed
  ADD COLUMN "ab1_40" numeric
;
ALTER TABLE cde_features_mixed
  ADD COLUMN "ab1_42" numeric
;
ALTER TABLE cde_features_mixed
  ADD COLUMN "p_tau" numeric
;
ALTER TABLE cde_features_mixed
  ADD COLUMN "t_tau" numeric
;

ALTER TABLE cde_features_mixed
  RENAME TO mip_cde_features
;
