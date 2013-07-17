#!/bin/sh
rm /tmp/*.csv
wget http://landsat.usgs.gov/metadata_service/bulk_metadata_files/LANDSAT_MSS1.csv
wget http://landsat.usgs.gov/metadata_service/bulk_metadata_files/LANDSAT_MSS2.csv
wget http://landsat.usgs.gov/metadata_service/bulk_metadata_files/LANDSAT_TM-2010-2012.csv
wget http://landsat.usgs.gov/metadata_service/bulk_metadata_files/LANDSAT_TM-2000-2009.csv
wget http://landsat.usgs.gov/metadata_service/bulk_metadata_files/LANDSAT_TM-1990-1999.csv
wget http://landsat.usgs.gov/metadata_service/bulk_metadata_files/LANDSAT_TM-1980-1989.csv
wget http://landsat.usgs.gov/metadata_service/bulk_metadata_files/LANDSAT_ETM_SLC_OFF.csv
wget http://landsat.usgs.gov/metadata_service/bulk_metadata_files/LANDSAT_ETM.csv
wget http://landsat.usgs.gov/metadata_service/bulk_metadata_files/LANDSAT_8.csv
mv *.csv /tmp

psql -d landsat -f remove.sql -U postgres
createdb landsat -U postgres
createlang plpgsql landsat -U postgres
psql -d landsat -f /usr/share/postgresql/8.4/contrib/postgis-1.5/postgis.sql -U postgres
psql -d landsat -f /usr/share/postgresql/8.4/contrib/postgis-1.5/spatial_ref_sys.sql -U postgres

wget http://geocommons.com/overlays/33578.zip
unzip 33578.zip -d /tmp world_country*
shp2pgsql -s 4326 /tmp/world_country_admin_boundary_shapefile_with_fips_codes public.countries landsat > /tmp/world_country_admin_boundary_shapefile_with_fips_codes.sql
psql -d landsat -U postgres -f /tmp/world_country_admin_boundary_shapefile_with_fips_codes.sql
rm /tmp//world_country*

wget http://landsat.usgs.gov/documents/wrs1_descending.zip
unzip wrs1_descending.zip -d /tmp
shp2pgsql -s 4326 /tmp/wrs1_descending public.wrs1 landsat > /tmp/wrs1_descending.sql 
psql -d landsat -U postgres -f /tmp/wrs1_descending.sql
rm /tmp/wrs1*

wget http://landsat.usgs.gov/documents/wrs2_descending.zip
unzip wrs2_descending.zip -d /tmp
shp2pgsql -s 4326 /tmp/wrs2_descending public.wrs2 landsat > /tmp/wrs2_descending.sql 
psql -d landsat -U postgres -f /tmp/wrs2_descending.sql
rm /tmp/wrs2*

psql -d landsat -f create.sql -U postgres
psql -d landsat -f modify.sql -U postgres
psql -d landsat -f makeuser.sql -U postgres
