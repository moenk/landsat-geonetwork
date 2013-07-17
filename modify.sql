
select AddGeometryColumn('public','landsat','the_geom','4326','MULTIPOLYGON',2);

CREATE INDEX wrs1_gix ON wrs2 USING GIST (the_geom);
CREATE INDEX wrs2_gix ON wrs1 USING GIST (the_geom);
CREATE INDEX countries_gix ON countries USING GIST (the_geom);
CREATE INDEX landsat_gix ON landsat USING GIST (the_geom);
VACUUM ANALYZE landsat;

update landsat set the_geom=ST_GeomFromText(
'MULTIPOLYGON(( (' 
|| "upperleftcornerlongitude" || ' ' || "upperleftcornerlatitude" || ',' 
|| "upperrightcornerlongitude" || ' ' || "upperrightcornerlatitude" || ',' 
|| "lowerrightcornerlongitude" || ' ' || "lowerrightcornerlatitude" || ',' 
|| "lowerleftcornerlongitude" || ' ' || "lowerleftcornerlatitude" || ','  
|| "upperleftcornerlongitude" || ' ' || "upperleftcornerlatitude"
|| ') ))'                                
,4326
);
alter table landsat add column year int;
update landsat set year=extract(year from acquisitiondate);

ALTER TABLE landsat ADD PRIMARY KEY (sceneid);

alter table wrs2 add column country varchar(80);
update wrs2 as w set country=trim(cntry_name) from countries as c where st_intersects(st_centroid(w.the_geom),c.the_geom);

alter table wrs1 add column country varchar(80);
update wrs1 as w set country=trim(cntry_name) from countries as c where st_intersects(st_setsrid(st_point(w.ctrlon,ctrlat),4326),c.the_geom);

alter table landsat add column country char(80);
