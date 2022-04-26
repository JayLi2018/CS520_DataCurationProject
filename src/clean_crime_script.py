#!/usr/bin/env python
# coding: utf-8

# In[125]:


import pandas as pd
import psycopg2
from geopy.geocoders import Nominatim
import re
from time import sleep
import random
# In[126]:


conn = psycopg2.connect("dbname=curation_dataset user=postgres")


# In[127]:


crime_df = pd.read_sql("select * from crimes__one_year_prior_to_present", conn)
# housing_df = pd.read_sql("select * from affordable_rental_housing_developments", conn)
# cta_df = pd.read_sql("select * from cta__system_information__list_of_l_stops", conn)
# covid_df = pd.read_sql("select * from chicago_covid19_community_vulnerability_index_ccvi", conn)


# ### Crime dataset:
#     1. some crimes have latitute, longtitute missing

# In[128]:


crime_df.head()


# In[132]:


def fix_geo_loc_missing(row):
    # calling the Nominatim tool
    loc = Nominatim(user_agent="GetLoc")
    anonymized_digits = len(re.findall("X", row['BLOCK']))
    # entering the location name
    num = random.randint(0, 10*anonymized_digits)
    raw_addr = row['BLOCK'] + ' CHICAGO'
    raw_addr = raw_addr.replace('X'*anonymized_digits,f'{num}') 
    
    getLoc = loc.geocode(raw_addr)
    
    cnt=0
    while(getLoc is None and cnt<=10):
        cnt+=1
        num = random.randint(0, 10*anonymized_digits)
        raw_addr = raw_addr.replace('X'*anonymized_digits,f'{num}') 
        getLoc = loc.geocode(raw_addr)
    
    if(getLoc is None):
        print('didnt find!')
        return None, None
    return  getLoc.latitude, getLoc.longitude


if __name__ == '__main__':

#     conn = psycopg2.connect("dbname=curation_dataset user=postgres")
    loc_missing_df = pd.read_csv("still_missing_new.csv")
#     loc_missing_df = crime_df[(crime_df['LATITUDE'].isna() | crime_df['LONGITUDE'].isna())]
#     loc_missing_df = loc_missing_df.reset_index()
#     loc_missing_df.to_csv('original_w_misses.csv')
    
#     with open('fixed_crime_missing_values.csv', "a") as file_object:
    for ind, row in loc_missing_df.iterrows():
#             print(f"{row['BLOCK']}")
        try:
            est_lat, est_lon = fix_geo_loc_missing(row)
        except Exception:
            sleep(10)
            est_lat, est_lon = fix_geo_loc_missing(row)

        loc_missing_df.loc[ind, 'LATITUDE'] = est_lat
        loc_missing_df.loc[ind, 'LONGITUDE'] = est_lon
        row_df = loc_missing_df.loc[ind:ind]
#             print(row_text)
#             vals = '|'.join(row_text.split(',')) + '\n'
#             file_object.write(vals)
#             print(vals)
        print(row_df)
        row_df.to_csv('fixed_crime_missing_values.csv', index=False, mode='a', header=False)

