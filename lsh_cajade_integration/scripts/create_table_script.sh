#!/bin/bash
psql -U postgres -d lsh_cajade_data_lake -c "CREATE TABLE IF NOT EXISTS foia_request_log__community_development__historical 
(REQUESTOR_NAME VARCHAR,
ORGANIZATION VARCHAR,
DESCRIPTION_OF_REQUEST VARCHAR,
DATE_RECEIVED VARCHAR,
DUE_DATE VARCHAR);"

psql -U postgres -d lsh_cajade_data_lake -c "CREATE TABLE IF NOT EXISTS foia_request_log__budget__management 
(REQUESTOR_NAME VARCHAR,
ORGANIZATION VARCHAR,
DESCRIPTION_OF_REQUEST VARCHAR,
DATE_RECEIVED VARCHAR,
DUE_DATE VARCHAR);"

psql -U postgres -d lsh_cajade_data_lake -c "CREATE TABLE IF NOT EXISTS debarred_firms_and_individuals 
(ENTITY_INDIVIDUAL VARCHAR,
STREET_ADDRESS VARCHAR,
CITY VARCHAR,
STATE VARCHAR,
ZIP_CODE VARCHAR,
DEBARMENT_DATE VARCHAR,
LENGTH_OF_DEBARMENT VARCHAR,
REASON VARCHAR,
TYPE VARCHAR);"

psql -U postgres -d lsh_cajade_data_lake -c "CREATE TABLE IF NOT EXISTS speed_camera_locations 
(ADDRESS VARCHAR,
FIRST_APPROACH VARCHAR,
SECOND_APPROACH VARCHAR,
GO_LIVE_DATE VARCHAR,
LATITUDE VARCHAR,
LONGITUDE VARCHAR,
LOCATION VARCHAR);"

psql -U postgres -d lsh_cajade_data_lake -c "CREATE TABLE IF NOT EXISTS house_share_restricted_residential_zone_precincts 
(Ward VARCHAR,
Precinct VARCHAR,
Submission_Date VARCHAR,
Comment_Period_End_Date VARCHAR,
Ordinance_Introduction_Date VARCHAR,
Ordinance_Effective_Date VARCHAR,
Scope_of_Restriction VARCHAR,
Enacting_Ordinance VARCHAR,
Repeal_Submission_Date VARCHAR,
Repeal_Comment_Period_End_Date VARCHAR,
Repeal_Ordinance_Introduction_Date VARCHAR,
Repeal_Ordinance_Effective_Date VARCHAR,
Repeal_Ordinance VARCHAR);"

psql -U postgres -d lsh_cajade_data_lake -c "CREATE TABLE IF NOT EXISTS condom_distribution_sites__historical 
(Venue_Type VARCHAR,
Name VARCHAR,
Address VARCHAR,
City_ VARCHAR,
State VARCHAR,
ZIP_Code VARCHAR,
Location VARCHAR);"

psql -U postgres -d lsh_cajade_data_lake -c "CREATE TABLE IF NOT EXISTS public_health_statistics__asthma_hospitalizations_in_chicago_by 
(ZIP_code__or_aggregate_ VARCHAR,
Hospitalizations_2000 VARCHAR,
Crude_Rate_2000 VARCHAR,
Crude_Rate_2000_Lower_CI VARCHAR,
Crude_Rate_2000_Upper_CI VARCHAR,
Adjusted_Rate_2000__Ages_5_64_only_ VARCHAR,
Adjusted_Rate_2000_Lower_CI VARCHAR,
Adjusted_Rate_2000_Upper_CI VARCHAR,
Hospitalizations_2001 VARCHAR,
Crude_Rate_2001 VARCHAR,
Crude_Rate_2001_Lower_CI VARCHAR,
Crude_Rate_2001_Upper_CI VARCHAR,
Adjusted_Rate_2001__Ages_5_64_only_ VARCHAR,
Adjusted_Rate_2001_Lower_CI VARCHAR,
Adjusted_Rate_2001_Upper_CI VARCHAR,
Hospitalizations_2002 VARCHAR,
Crude_Rate_2002 VARCHAR,
Crude_Rate_2002_Lower_CI VARCHAR,
Crude_Rate_2002_Upper_CI VARCHAR,
Adjusted_Rate_2002__Ages_5_64_only_ VARCHAR,
Adjusted_Rate_2002_Lower_CI VARCHAR,
Adjusted_Rate_2002_Upper_CI VARCHAR,
Hospitalizations_2003 VARCHAR,
Crude_Rate_2003 VARCHAR,
Crude_Rate_2003_Lower_CI VARCHAR,
Crude_Rate_2003_Upper_CI VARCHAR,
Adjusted_Rate_2003__Ages_5_64_only_ VARCHAR,
Adjusted_Rate_2003_Lower_CI VARCHAR,
Adjusted_Rate_2003_Upper_CI VARCHAR,
Hospitalizations_2004 VARCHAR,
Crude_Rate_2004 VARCHAR,
Crude_Rate_2004_Lower_CI VARCHAR,
Crude_Rate_2004_Upper_CI VARCHAR,
Adjusted_Rate_2004__Ages_5_64_only_ VARCHAR,
Adjusted_Rate_2004_Lower_CI VARCHAR,
Adjusted_Rate_2004_Upper_CI VARCHAR,
Hospitalizations_2005 VARCHAR,
Crude_Rate_2005 VARCHAR,
Crude_Rate_2005_Lower_CI VARCHAR,
Crude_Rate_2005_Upper_CI VARCHAR,
Adjusted_Rate_2005__Ages_5_64_only_ VARCHAR,
Adjusted_Rate_2005_Lower_CI VARCHAR,
Adjusted_Rate_2005_Upper_CI VARCHAR,
Hospitalizations_2006 VARCHAR,
Crude_Rate_2006 VARCHAR,
Crude_Rate_2006_Lower_CI VARCHAR,
Crude_Rate_2006_Upper_CI VARCHAR,
Adjusted_Rate_2006__Ages_5_64_only_ VARCHAR,
Adjusted_Rate_2006_Lower_CI VARCHAR,
Adjusted_Rate_2006_Upper_CI VARCHAR,
Hospitalizations_2007 VARCHAR,
Crude_Rate_2007 VARCHAR,
Crude_Rate_2007_Lower_CI VARCHAR,
Crude_Rate_2007_Upper_CI VARCHAR,
Adjusted_Rate_2007__Ages_5_64_only_ VARCHAR,
Adjusted_Rate_2007_Lower_CI VARCHAR,
Adjusted_Rate_2007_Upper_CI VARCHAR,
Hospitalizations_2008 VARCHAR,
Crude_Rate_2008 VARCHAR,
Crude_Rate_2008_Lower_CI VARCHAR,
Crude_Rate_2008_Upper_CI VARCHAR,
Adjusted_Rate_2008__Ages_5_64_only_ VARCHAR,
Adjusted_Rate_2008_Lower_CI VARCHAR,
Adjusted_Rate_2008_Upper_CI VARCHAR,
Hospitalizations_2009 VARCHAR,
Crude_Rate_2009 VARCHAR,
Crude_Rate_2009_Lower_CI VARCHAR,
Crude_Rate_2009_Upper_CI VARCHAR,
Adjusted_Rate_2009__Ages_5_64_only_ VARCHAR,
Adjusted_Rate_2009_Lower_CI VARCHAR,
Adjusted_Rate_2009_Upper_CI VARCHAR,
Hospitalizations_2010 VARCHAR,
Crude_Rate_2010 VARCHAR,
Crude_Rate_2010_Lower_CI VARCHAR,
Crude_Rate_2010_Upper_CI VARCHAR,
Adjusted_Rate_2010__Ages_5_64_only_ VARCHAR,
Adjusted_Rate_2010_Lower_CI VARCHAR,
Adjusted_Rate_2010_Upper_CI VARCHAR,
Hospitalizations_2011 VARCHAR,
Crude_Rate_2011 VARCHAR,
Crude_Rate_2011_Lower_CI VARCHAR,
Crude_Rate_2011_Upper_CI VARCHAR,
Adjusted_Rate_2011__Ages_5_64_only_ VARCHAR,
Adjusted_Rate_2011_Lower_CI VARCHAR,
Adjusted_Rate_2011_Upper_CI VARCHAR);"

psql -U postgres -d lsh_cajade_data_lake -c "CREATE TABLE IF NOT EXISTS public_health_statistics__gonorrhea_cases_for_females_aged_1544 
(Community_Area VARCHAR,
Community_Area_Name VARCHAR,
Cases_2000_Female_15_44 VARCHAR,
Incidence_Rate_2000 VARCHAR,
Incidence_Rate_2000_Lower_CI VARCHAR,
Incidence_Rate_2000_Upper_CI VARCHAR,
Cases_2001_Female_15_44 VARCHAR,
Incidence_Rate_2001 VARCHAR,
Incidence_Rate_2001_Lower_CI VARCHAR,
Incidence_Rate_2001_Upper_CI VARCHAR,
Cases_2002_Female_15_44 VARCHAR,
Incidence_Rate_2002 VARCHAR,
Incidence_Rate_2002_Lower_CI VARCHAR,
Incidence_Rate_2002_Upper_CI VARCHAR,
Cases_2003_Female_15_44 VARCHAR,
Incidence_Rate_2003 VARCHAR,
Incidence_Rate_2003_Lower_CI VARCHAR,
Incidence_Rate_2003_Upper_CI VARCHAR,
Cases_2004_Female_15_44 VARCHAR,
Incidence_Rate_2004 VARCHAR,
Incidence_Rate_2004_Lower_CI VARCHAR,
Incidence_Rate_2004_Upper_CI VARCHAR,
Cases_2005_Female_15_44 VARCHAR,
Incidence_Rate_2005 VARCHAR,
Incidence_Rate_2005_Lower_CI VARCHAR,
Incidence_Rate_2005_Upper_CI VARCHAR,
Cases_2006_Female_15_44 VARCHAR,
Incidence_Rate_2006 VARCHAR,
Incidence_Rate_2006_Lower_CI VARCHAR,
Incidence_Rate_2006_Upper_CI VARCHAR,
Cases_2007_Female_15_44 VARCHAR,
Incidence_Rate_2007 VARCHAR,
Incidence_Rate_2007_Lower_CI VARCHAR,
Incidence_Rate_2007_Upper_CI VARCHAR,
Cases_2008_Female_15_44 VARCHAR,
Incidence_Rate_2008 VARCHAR,
Incidence_Rate_2008_Lower_CI VARCHAR,
Incidence_Rate_2008_Upper_CI VARCHAR,
Cases_2009_Female_15_44 VARCHAR,
Incidence_Rate_2009 VARCHAR,
Incidence_Rate_2009_Lower_CI VARCHAR,
Incidence_Rate_2009_Upper_CI VARCHAR,
Cases_2010_Female_15_44 VARCHAR,
Incidence_Rate_2010 VARCHAR,
Incidence_Rate_2010_Lower_CI VARCHAR,
Incidence_Rate_2010_Upper_CI VARCHAR,
Cases_2011_Female_15_44 VARCHAR,
Incidence_Rate_2011 VARCHAR,
Incidence_Rate_2011_Lower_CI VARCHAR,
Incidence_Rate_2011_Upper_CI VARCHAR,
Cases_2012_Female_15_44 VARCHAR,
Incidence_Rate_2012 VARCHAR,
Incidence_Rate_2012_Lower_CI VARCHAR,
Incidence_Rate_2012_Upper_CI VARCHAR,
Cases_2013_Female_15_44 VARCHAR,
Incidence_Rate_2013 VARCHAR,
Incidence_Rate_2013_Lower_CI VARCHAR,
Incidence_Rate_2013_Upper_CI VARCHAR,
Cases_2014_Female_15_44 VARCHAR,
Incidence_Rate_2014 VARCHAR,
Incidence_Rate_2014_Lower_CI VARCHAR,
Incidence_Rate_2014_Upper_CI VARCHAR,
WARNING VARCHAR);"

psql -U postgres -d lsh_cajade_data_lake -c "CREATE TABLE IF NOT EXISTS chicago_police_department__illinois_uniform_crime_reporting_iuc 
(IUCR VARCHAR,
PRIMARY_DESCRIPTION VARCHAR,
SECONDARY_DESCRIPTION VARCHAR,
INDEX_CODE VARCHAR,
ACTIVE VARCHAR);"

psql -U postgres -d lsh_cajade_data_lake -c "CREATE TABLE IF NOT EXISTS performance_metrics__311_call_center 
(Sort VARCHAR,
Dates VARCHAR,
Average_Number_of_Operators__Mon_Fri___7_00AM_3_00PM__ VARCHAR,
Average_Number_of_Operators__Mon_Fri___3_00PM_11_00PM__ VARCHAR,
Average_Number_of_Operators__Mon_Fri___11_00PM_7_00AM__ VARCHAR,
Average_Number_of_Operators__Sat_Sun___7_00AM_3_00PM__ VARCHAR,
Average_Number_of_Operators__Sat_Sun___3_00PM_11_00PM__ VARCHAR,
Average_Number_of_Operators__Sat_Sun___11_00PM_7_00AM__ VARCHAR,
Call_Volume__7_00AM_3_00PM__ VARCHAR,
Call_Volume__3_00PM_11_00PM__ VARCHAR,
Call_Volume__11_00PM_7_00AM__ VARCHAR,
Efficiency__7_00AM_3_00PM__ VARCHAR,
Efficiency__3_00PM_11_00PM__ VARCHAR,
Efficiency__11_00PM_7_00AM__ VARCHAR,
Utilization__7_00AM_3_00PM__ VARCHAR,
Utilization__3_00PM_11_00PM__ VARCHAR,
Utilization__11_00PM_7_00AM__ VARCHAR,
Abandoned__7_00AM_3_00PM__ VARCHAR,
Abandoned__3_00PM_11_00PM__ VARCHAR,
Abandoned__11_00PM_7_00AM__ VARCHAR,
Average_Wait_Time__seconds___7_00AM_3_00PM VARCHAR,
Average_Wait_Time__seconds___3_00PM_11_00PM VARCHAR,
Average_Wait_Time__seconds___11_00PM_7_00AM VARCHAR);"

psql -U postgres -d lsh_cajade_data_lake -c "CREATE TABLE IF NOT EXISTS public_health_services_chicago_primary_care_community_health_ce 
(Facility VARCHAR,
Community_Area____ VARCHAR,
Phone VARCHAR,
FQHC__Look_alike__or_Neither__Special_Notes VARCHAR,
Address VARCHAR);"

psql -U postgres -d lsh_cajade_data_lake -c "CREATE TABLE IF NOT EXISTS public_health_statistics__chlamydia_cases_among_males_aged_1544 
(Community_Area VARCHAR,
Community_Area_Name VARCHAR,
CASES_2000_Male_15_44 VARCHAR,
Incidence_Rate_2000 VARCHAR,
Incidence_Rate_2000_Lower_CI VARCHAR,
Incidence_Rate_2000_Upper_CI VARCHAR,
CASES_2001_Male_15_44 VARCHAR,
Incidence_Rate_2001 VARCHAR,
Incidence_Rate_2001_Lower_CI VARCHAR,
Incidence_Rate_2001_Upper_CI VARCHAR,
CASES_2002_Male_15_44 VARCHAR,
Incidence_Rate_2002 VARCHAR,
Incidence_Rate_2002_Lower_CI VARCHAR,
Incidence_Rate_2002_Upper_CI VARCHAR,
CASES_2003_Male_15_44 VARCHAR,
Incidence_Rate_2003 VARCHAR,
Incidence_Rate_2003_Lower_CI VARCHAR,
Incidence_Rate_2003_Upper_CI VARCHAR,
CASES_2004_Male_15_44 VARCHAR,
Incidence_Rate_2004 VARCHAR,
Incidence_Rate_2004_Lower_CI VARCHAR,
Incidence_Rate_2004_Upper_CI VARCHAR,
CASES_2005_Male_15_44 VARCHAR,
Incidence_Rate_2005 VARCHAR,
Incidence_Rate_2005_Lower_CI VARCHAR,
Incidence_Rate_2005_Upper_CI VARCHAR,
CASES_2006_Male_15_44 VARCHAR,
Incidence_Rate_2006 VARCHAR,
Incidence_Rate_2006_Lower_CI VARCHAR,
Incidence_Rate_2006_Upper_CI VARCHAR,
CASES_2007_Male_15_44 VARCHAR,
Incidence_Rate_2007 VARCHAR,
Incidence_Rate_2007_Lower_CI VARCHAR,
Incidence_Rate_2007_Upper_CI VARCHAR,
CASES_2008_Male_15_44 VARCHAR,
Incidence_Rate_2008 VARCHAR,
Incidence_Rate_2008_Lower_CI VARCHAR,
Incidence_Rate_2008_Upper_CI VARCHAR,
CASES_2009_Male_15_44 VARCHAR,
Incidence_Rate_2009 VARCHAR,
Incidence_Rate_2009_Lower_CI VARCHAR,
Incidence_Rate_2009_Upper_CI VARCHAR,
CASES_2010_Male_15_44 VARCHAR,
Incidence_Rate_2010 VARCHAR,
Incidence_Rate_2010_Lower_CI VARCHAR,
Incidence_Rate_2010_Upper_CI VARCHAR,
CASES_2011_Male_15_44 VARCHAR,
Incidence_Rate_2011 VARCHAR,
Incidence_Rate_2011_Lower_CI VARCHAR,
Incidence_Rate_2011_Upper_CI VARCHAR,
CASES_2012_MALE_15_44 VARCHAR,
Incidence_Rate_2012 VARCHAR,
Incidence_Rate_2012_Lower_CI VARCHAR,
Incidence_Rate_2012_Upper_CI VARCHAR,
CASES_2013_Male_15_44 VARCHAR,
Incidence_Rate_2013 VARCHAR,
Incidence_Rate_2013_Lower_CI VARCHAR,
Incidence_Rate_2013_Upper_CI VARCHAR,
CASES_2014_Male_15_44 VARCHAR,
Incidence_Rate_2014 VARCHAR,
Incidence_Rate_2014_Lower_CI VARCHAR,
Incidence_Rate_2014_Upper_CI VARCHAR,
WARNING VARCHAR);"

psql -U postgres -d lsh_cajade_data_lake -c "CREATE TABLE IF NOT EXISTS public_health_statistics__preterm_births_in_chicago_by_year_199 
(Community_Area_Number VARCHAR,
Community_Area_Name VARCHAR,
Pre_term_Births_1999 VARCHAR,
Percent_1999 VARCHAR,
Percent_1999_Lower_CI VARCHAR,
Percent_1999_Upper_CI VARCHAR,
Pre_term_Births_2000 VARCHAR,
Percent_2000 VARCHAR,
Percent_2000_Lower_CI VARCHAR,
Percent_2000_Upper_CI VARCHAR,
Pre_term_Births_2001 VARCHAR,
Percent_2001 VARCHAR,
Percent_2001_Lower_CI VARCHAR,
Percent_2001_Upper_CI VARCHAR,
Pre_term_Births_2002 VARCHAR,
Percent_2002 VARCHAR,
Percent_2002_Lower_CI VARCHAR,
Percent_2002_Upper_CI VARCHAR,
Pre_term_Births_2003 VARCHAR,
Percent_2003 VARCHAR,
Percent_2003_Lower_CI VARCHAR,
Percent_2003_Upper_CI VARCHAR,
Pre_term_Births_2004 VARCHAR,
Percent_2004 VARCHAR,
Percent_2004_Lower_CI VARCHAR,
Percent_2004_Upper_CI VARCHAR,
Pre_term_Births_2005 VARCHAR,
Percent_2005 VARCHAR,
Percent_2005_Lower_CI VARCHAR,
Percent_2005_Upper_CI VARCHAR,
Pre_term_Births_2006 VARCHAR,
Percent_2006 VARCHAR,
Percent_2006_Lower_CI VARCHAR,
Percent_2006_Upper_CI VARCHAR,
Pre_term_Births_2007 VARCHAR,
Percent_2007 VARCHAR,
Percent_2007_Lower_CI VARCHAR,
Percent_2007_Upper_CI VARCHAR,
Pre_term_Births_2008 VARCHAR,
Percent_2008 VARCHAR,
Percent_2008_Lower_CI VARCHAR,
Percent_2008_Upper_CI VARCHAR,
Pre_term_Births_2009 VARCHAR,
Percent_2009 VARCHAR,
Percent_2009_Lower_CI VARCHAR,
Percent_2009_Upper_CI VARCHAR,
Warning VARCHAR);"

psql -U postgres -d lsh_cajade_data_lake -c "CREATE TABLE IF NOT EXISTS public_health_statistics__gonorrhea_cases_for_males_aged_1544_i 
(Community_Area VARCHAR,
Community_Area_Name VARCHAR,
Cases_2000_Male_15_44 VARCHAR,
Incidence_Rate_2000 VARCHAR,
Incidence_Rate_2000_Lower_CI VARCHAR,
Incidence_Rate_2000_Upper_CI VARCHAR,
Cases_2001_Male_15_44 VARCHAR,
Incidence_Rate_2001 VARCHAR,
Incidence_Rate_2001_Lower_CI VARCHAR,
Incidence_Rate_2001_Upper_CI VARCHAR,
Cases_2002_Male_15_44 VARCHAR,
Incidence_Rate_2002 VARCHAR,
Incidence_Rate_2002_Lower_CI VARCHAR,
Incidence_Rate_2002_Upper_CI VARCHAR,
Cases_2003_Male_15_44 VARCHAR,
Incidence_Rate_2003 VARCHAR,
Incidence_Rate_2003_Lower_CI VARCHAR,
Incidence_Rate_2003_Upper_CI VARCHAR,
Cases_2004_Male_15_44 VARCHAR,
Incidence_Rate_2004 VARCHAR,
Incidence_Rate_2004_Lower_CI VARCHAR,
Incidence_Rate_2004_Upper_CI VARCHAR,
Cases_2005_Male_15_44 VARCHAR,
Incidence_Rate_2005 VARCHAR,
Incidence_Rate_2005_Lower_CI VARCHAR,
Incidence_Rate_2005_Upper_CI VARCHAR,
Cases_2006_Male_15_44 VARCHAR,
Incidence_Rate_2006 VARCHAR,
Incidence_Rate_2006_Lower_CI VARCHAR,
Incidence_Rate_2006_Upper_CI VARCHAR,
Cases_2007_Male_15_44 VARCHAR,
Incidence_Rate_2007 VARCHAR,
Incidence_Rate_2007_Lower_CI VARCHAR,
Incidence_Rate_2007_Upper_CI VARCHAR,
Cases_2008_Male_15_44 VARCHAR,
Incidence_Rate_2008 VARCHAR,
Incidence_Rate_2008_Lower_CI VARCHAR,
Incidence_Rate_2008_Upper_CI VARCHAR,
Cases_2009_Male_15_44 VARCHAR,
Incidence_Rate_2009 VARCHAR,
Incidence_Rate_2009_Lower_CI VARCHAR,
Incidence_Rate_2009_Upper_CI VARCHAR,
Cases_2010_Male_15_44 VARCHAR,
Incidence_Rate_2010 VARCHAR,
Incidence_Rate_2010_Lower_CI VARCHAR,
Incidence_Rate_2010_Upper_CI VARCHAR,
Cases_2011_Male_15_44 VARCHAR,
Incidence_Rate_2011 VARCHAR,
Incidence_Rate_2011_Lower_CI VARCHAR,
Incidence_Rate_2011_Upper_CI VARCHAR,
Cases_2012_Male_15_44 VARCHAR,
Incidence_Rate_2012 VARCHAR,
Incidence_Rate_2012_Lower_CI VARCHAR,
Incidence_Rate_2012_Upper_CI VARCHAR,
Cases_2013_Male_15_44 VARCHAR,
Incidence_Rate_2013 VARCHAR,
Incidence_Rate_2013_Lower_CI VARCHAR,
Incidence_Rate_2013_Upper_CI VARCHAR,
Cases_2014_Male_15_44 VARCHAR,
Incidence_Rate_2014 VARCHAR,
Incidence_Rate_2014_Lower_CI VARCHAR,
Incidence_Rate_2014_Upper_CI VARCHAR,
WARNING VARCHAR);"

psql -U postgres -d lsh_cajade_data_lake -c "CREATE TABLE IF NOT EXISTS covidlike_illness_cli_and_covid19_diagnosis_emergency_departmen 
(Date VARCHAR,
Total_CLI___Daily VARCHAR,
Total_ED_Visits___Daily VARCHAR,
CLI_Count___7_day_average VARCHAR,
CLI_Percent___Daily VARCHAR,
CLI_Percent___7_day_average VARCHAR,
Total_COVID___Daily VARCHAR,
COVID_Count___7_day_average VARCHAR,
COVID_Percent___Daily VARCHAR,
COVID_Percent___7_day_average VARCHAR);"

psql -U postgres -d lsh_cajade_data_lake -c "CREATE TABLE IF NOT EXISTS public_health_statistics__chlamydia_cases_among_females_aged_15 
(Community_Area VARCHAR,
Community_Area_Name VARCHAR,
Cases_2000_Female_15_44 VARCHAR,
Incidence_Rate_2000 VARCHAR,
Incidence_Rate_2000_Lower_CI VARCHAR,
Incidence_Rate_2000_Upper_CI VARCHAR,
Cases_2001_Female_15_44 VARCHAR,
Incidence_Rate_2001 VARCHAR,
Incidence_Rate_2001_Lower_CI VARCHAR,
Incidence_Rate_2001_Upper_CI VARCHAR,
Cases_2002_Female_15_44 VARCHAR,
Incidence_Rate_2002 VARCHAR,
Incidence_Rate_2002_Lower_CI VARCHAR,
Incidence_Rate_2002_Upper_CI VARCHAR,
Cases_2003_Female_15_44 VARCHAR,
Incidence_Rate_2003 VARCHAR,
Incidence_Rate_2003_Lower_CI VARCHAR,
Incidence_Rate_2003_Upper_CI VARCHAR,
Cases_2004_Female_15_44 VARCHAR,
Incidence_Rate_2004 VARCHAR,
Incidence_Rate_2004_Lower_CI VARCHAR,
Incidence_Rate_2004_Upper_CI VARCHAR,
Cases_2005_Female_15_44 VARCHAR,
Incidence_Rate_2005 VARCHAR,
Incidence_Rate_2005_Lower_CI VARCHAR,
Incidence_Rate_2005_Upper_CI VARCHAR,
Cases_2006_Female_15_44 VARCHAR,
Incidence_Rate_2006 VARCHAR,
Incidence_Rate_2006_Lower_CI VARCHAR,
Incidence_Rate_2006_Upper_CI VARCHAR,
Cases_2007_Female_15_44 VARCHAR,
Incidence_Rate_2007 VARCHAR,
Incidence_Rate_2007_Lower_CI VARCHAR,
Incidence_Rate_2007_Upper_CI VARCHAR,
Cases_2008_Female_15_44 VARCHAR,
Incidence_Rate_2008 VARCHAR,
Incidence_Rate_2008_Lower_CI VARCHAR,
Incidence_Rate_2008_Upper_CI VARCHAR,
Cases_2009_Female_15_44 VARCHAR,
Incidence_Rate_2009 VARCHAR,
Incidence_Rate_2009_Lower_CI VARCHAR,
Incidence_Rate_2009_Upper_CI VARCHAR,
Cases_2010_Female_15_44 VARCHAR,
Incidence_Rate_2010 VARCHAR,
Incidence_Rate_2010_Lower_CI VARCHAR,
Incidence_Rate_2010_Upper_CI VARCHAR,
Cases_2011_Female_15_44 VARCHAR,
Incidence_Rate_2011 VARCHAR,
Incidence_Rate_2011_Lower_CI VARCHAR,
Incidence_Rate_2011_Upper_CI VARCHAR,
Cases_2012_Female_15_44 VARCHAR,
Incidence_Rate_2012 VARCHAR,
Incidence_Rate_2012_Lower_CI VARCHAR,
Incidence_Rate_2012_Upper_CI VARCHAR,
Cases_2013_Female_15_44 VARCHAR,
Incidence_Rate_2013 VARCHAR,
Incidence_Rate_2013_Lower_CI VARCHAR,
Incidence_Rate_2013_Upper_CI VARCHAR,
Cases_2014_Female_15_44 VARCHAR,
Incidence_Rate_2014 VARCHAR,
Incidence_Rate_2014_Lower_CI VARCHAR,
Incidence_Rate_2014_Upper_CI VARCHAR,
WARNING VARCHAR);"

psql -U postgres -d lsh_cajade_data_lake -c "CREATE TABLE IF NOT EXISTS street_sweeping_schedule__2015__aprilmay 
(WARD_SECTION__CONCATENATED_ VARCHAR,
WARD VARCHAR,
SECTION VARCHAR,
MONTH_NAME VARCHAR,
MONTH_NUMBER VARCHAR,
DATES VARCHAR);"

psql -U postgres -d lsh_cajade_data_lake -c "CREATE TABLE IF NOT EXISTS public_health_statistics__diabetes_hospitalizations_in_chicago_ 
(ZIP_code__or_aggregate_ VARCHAR,
Hospitalizations_2000 VARCHAR,
Crude_Rate_2000 VARCHAR,
Crude_Rate_2000_Lower_CI VARCHAR,
Crude_Rate_2000_Upper_CI VARCHAR,
Adjusted_Rate_2000 VARCHAR,
Adjusted_Rate_2000_Lower_CI VARCHAR,
Adjusted_Rate_2000_Upper_CI VARCHAR,
Hospitalizations_2001 VARCHAR,
Crude_Rate_2001 VARCHAR,
Crude_Rate_2001_Lower_CI VARCHAR,
Crude_Rate_2001_Upper_CI VARCHAR,
Adjusted_Rate_2001 VARCHAR,
Adjusted_Rate_2001_Lower_CI VARCHAR,
Adjusted_Rate_2001_Upper_CI VARCHAR,
Hospitalizations_2002 VARCHAR,
Crude_Rate_2002 VARCHAR,
Crude_Rate_2002_Lower_CI VARCHAR,
Crude_Rate_2002_Upper_CI VARCHAR,
Adjusted_Rate_2002 VARCHAR,
Adjusted_Rate_2002_Lower_CI VARCHAR,
Adjusted_Rate_2002_Upper_CI VARCHAR,
Hospitalizations_2003 VARCHAR,
Crude_Rate_2003 VARCHAR,
Crude_Rate_2003_Lower_CI VARCHAR,
Crude_Rate_2003_Upper_CI VARCHAR,
Adjusted_Rate_2003 VARCHAR,
Adjusted_Rate_2003_Lower_CI VARCHAR,
Adjusted_Rate_2003_Upper_CI VARCHAR,
Hospitalizations_2004 VARCHAR,
Crude_Rate_2004 VARCHAR,
Crude_Rate_2004_Lower_CI VARCHAR,
Crude_Rate_2004_Upper_CI VARCHAR,
Adjusted_Rate_2004 VARCHAR,
Adjusted_Rate_2004_Lower_CI VARCHAR,
Adjusted_Rate_2004_Upper_CI VARCHAR,
Hospitalizations_2005 VARCHAR,
Crude_Rate_2005 VARCHAR,
Crude_Rate_2005_Lower_CI VARCHAR,
Crude_Rate_2005_Upper_CI VARCHAR,
Adjusted_Rate_2005 VARCHAR,
Adjusted_Rate_2005_Lower_CI VARCHAR,
Adjusted_Rate_2005_Upper_CI VARCHAR,
Hospitalizations_2006 VARCHAR,
Crude_Rate_2006 VARCHAR,
Crude_Rate_2006_Lower_CI VARCHAR,
Crude_Rate_2006_Upper_CI VARCHAR,
Adjusted_Rate_2006 VARCHAR,
Adjusted_Rate_2006_Lower_CI VARCHAR,
Adjusted_Rate_2006_Upper_CI VARCHAR,
Hospitalizations_2007 VARCHAR,
Crude_Rate_2007 VARCHAR,
Crude_Rate_2007_Lower_CI VARCHAR,
Crude_Rate_2007_Upper_CI VARCHAR,
Adjusted_Rate_2007 VARCHAR,
Adjusted_Rate_2007_Lower_CI VARCHAR,
Adjusted_Rate_2007_Upper_CI VARCHAR,
Hospitalizations_2008 VARCHAR,
Crude_Rate_2008 VARCHAR,
Crude_Rate_2008_Lower_CI VARCHAR,
Crude_Rate_2008_Upper_CI VARCHAR,
Adjusted_Rate_2008 VARCHAR,
Adjusted_Rate_2008_Lower_CI VARCHAR,
Adjusted_Rate_2008_Upper_CI VARCHAR,
Hospitalizations_2009 VARCHAR,
Crude_Rate_2009 VARCHAR,
Crude_Rate_2009_Lower_CI VARCHAR,
Crude_Rate_2009_Upper_CI VARCHAR,
Adjusted_Rate_2009 VARCHAR,
Adjusted_Rate_2009_Lower_CI VARCHAR,
Adjusted_Rate_2009_Upper_CI VARCHAR,
Hospitalizations_2010 VARCHAR,
Crude_Rate_2010 VARCHAR,
Crude_Rate_2010_Lower_CI VARCHAR,
Crude_Rate_2010_Upper_CI VARCHAR,
Adjusted_Rate_2010 VARCHAR,
Adjusted_Rate_2010_Lower_CI VARCHAR,
Adjusted_Rate_2010_Upper_CI VARCHAR,
Hospitalizations_2011 VARCHAR,
Crude_Rate_2011 VARCHAR,
Crude_Rate_2011_Lower_CI VARCHAR,
Crude_Rate_2011_Upper_CI VARCHAR,
Adjusted_Rate_2011 VARCHAR,
Adjusted_Rate_2011_Lower_CI VARCHAR,
Adjusted_Rate_2011_Upper_CI VARCHAR);"

psql -U postgres -d lsh_cajade_data_lake -c "CREATE TABLE IF NOT EXISTS covid19_testing_sites 
(Facility VARCHAR,
Phone VARCHAR,
Address VARCHAR,
Web_Site VARCHAR,
Location VARCHAR);"
