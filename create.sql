begin;

create table landsat (
sceneID	char(30),
sensor char(20),
acquisitionDate	date,
dateUpdated date,
browseAvailable	char(1),
browseURL char(240),
path int,
row int,
upperLeftCornerLatitude	float,
upperLeftCornerLongitude float,	
upperRightCornerLatitude float,	
upperRightCornerLongitude float,
lowerLeftCornerLatitude	float,
lowerLeftCornerLongitude float,
lowerRightCornerLatitude float,
lowerRightCornerLongitude float,
sceneCenterLatitude float,
sceneCenterLongitude float,
cloudCover int,
cloudCoverFull float,
FULL_UL_QUAD_CCA float,
FULL_UR_QUAD_CCA float,
FULL_LL_QUAD_CCA float,
FULL_LR_QUAD_CCA float,
dayOrNight char(10),
flightPath char(10),
sunElevation float,
sunAzimuth float,
receivingStation char(10),
sceneStartTime char(30),
sceneStopTime char(30),
lookAngle char(10),
imageQuality1 int,
imageQuality2 int,
gainBand1 char(10),
gainBand2 char(10),
gainBand3 char(10),
gainBand4 char(10),
gainBand5 char(10),
gainBand6H char(10),
gainBand6L char(10),
gainBand7 char(10),
gainBand8 char(10),
gainChangeBand1	char(10),
gainChangeBand2	char(10),
gainChangeBand3	char(10),
gainChangeBand4	char(10),
gainChangeBand5	char(10),
gainChangeBand6H char(10),
gainChangeBand6L char(10),
gainChangeBand7	char(10),
gainChangeBand8	char(10), 
satelliteNumber char(10),
DATA_TYPE_L1 char(20),
cartURL	char(240),
DATE_ACQUIRED_GAP_FILL float,
DATA_TYPE_L0RP char(10),
DATUM char(10),
ELEVATION_SOURCE char(10),
ELLIPSOID CHAR(10),
EPHEMERIS_TYPE char(10),
FALSE_EASTING float,
FALSE_NORTHING float,
GAP_FILL float,
GROUND_CONTROL_POINTS_MODEL float,
GROUND_CONTROL_POINTS_VERIFY float,
GEOMETRIC_RMSE_MODEL float,
GEOMETRIC_RMSE_MODEL_X float,
GEOMETRIC_RMSE_MODEL_Y float,
GEOMETRIC_RMSE_VERIFY float,
GRID_CELL_SIZE_PANCHROMATIC float,
GRID_CELL_SIZE_REFLECTIVE float,
GRID_CELL_SIZE_THERMAL float,
MAP_PROJECTION_L1 char(10),
MAP_PROJECTION_L0RA char(10),
ORIENTATION char(10),
OUTPUT_FORMAT char(10),
PANCHROMATIC_LINES float,
PANCHROMATIC_SAMPLES float,
L1_AVAILABLE char(1),
REFLECTIVE_LINES float,
REFLECTIVE_SAMPLES float,
RESAMPLING_OPTION char(20),
SCAN_GAP_INTERPOLATION float,
THERMAL_LINES float,
THERMAL_SAMPLES	float,
TRUE_SCALE_LAT float,
UTM_ZONE int,
VERTICAL_LON_FROM_POLE float,
PRESENT_BAND_1 char(1),
PRESENT_BAND_2 char(1),
PRESENT_BAND_3 char(1),
PRESENT_BAND_4 char(1),
PRESENT_BAND_5 char(1),
PRESENT_BAND_6 char(1),
PRESENT_BAND_7 char(1),
PRESENT_BAND_8 char(1)
);

COPY landsat FROM '/tmp/LANDSAT_8.csv' HEADER DELIMITER ',' CSV;
COPY landsat FROM '/tmp/LANDSAT_ETM.csv' HEADER DELIMITER ',' CSV;
COPY landsat FROM '/tmp/LANDSAT_ETM_SLC_OFF.csv' HEADER DELIMITER ',' CSV;
COPY landsat FROM '/tmp/LANDSAT_MSS1.csv' HEADER DELIMITER ',' CSV;
COPY landsat FROM '/tmp/LANDSAT_MSS2.csv' HEADER DELIMITER ',' CSV;
COPY landsat FROM '/tmp/LANDSAT_TM-1980-1989.csv' HEADER DELIMITER ',' CSV;
COPY landsat FROM '/tmp/LANDSAT_TM-1990-1999.csv' HEADER DELIMITER ',' CSV;
COPY landsat FROM '/tmp/LANDSAT_TM-2000-2009.csv' HEADER DELIMITER ',' CSV;
COPY landsat FROM '/tmp/LANDSAT_TM-2010-2012.csv' HEADER DELIMITER ',' CSV;

commit;

