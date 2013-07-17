REVOKE CREATE ON SCHEMA public FROM PUBLIC;
REVOKE USAGE ON SCHEMA public FROM PUBLIC;
create role landsat with NOSUPERUSER NOCREATEDB NOCREATEROLE INHERIT LOGIN;
GRANT USAGE ON SCHEMA public TO landsat;
grant select on wrs1 to landsat;
grant select on wrs2 to landsat;
grant select on landsat to landsat;
grant select on countries to landsat;
grant select on geometry_columns to landsat;
