
COPY MERGED_DATA FROM '/docker-entrypoint-initdb.d/values.csv' CSV HEADER;
