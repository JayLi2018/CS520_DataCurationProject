import pandas as pd
import psycopg2
from geopy.geocoders import Nominatim
import re
from shapely.geometry import shape, GeometryCollection, Point
import json
import numpy as np
import sys

geo_coor_re = re.compile('\((.*)\)')


def find_community(geofile, point_str, pos_lat, pos_lon):
    coors = geo_coor_re.search(point_str).groups(0)[0].split(',')
    lon, lat = coors[pos_lon], coors[pos_lat]
    for feature in geofile['features']:
        region = shape(feature['geometry'])
        if(region.contains(Point(float(lon), float(lat)))):
            return feature['properties']['area_numbe']
    return None


if __name__ == '__main__':

    with open('CommuAreas.geojson', 'r') as f:
        geofile = json.load(f)

    fixed_crime_df = pd.read_csv(f'fixed_crime_chunck_{sys.argv[1]}.csv')
    i=0
    fixed_crime_df['community_id'] = None
    for ind, row in fixed_crime_df.iterrows():
        i+=1
        if(i%1000==0):
            print(f"{sys.argv[1]} chunck: {i} done")
        lat = fixed_crime_df.loc[ind, 'LATITUDE']
        lon = fixed_crime_df.loc[ind, 'LONGITUDE']
        fixed_crime_df.loc[ind, 'community_id'] = find_community(geofile, f"({lon},{lat})", 1, 0)
    fixed_crime_df.to_csv(f'fixed_crime_chunck_{sys.argv[1]}_w_community.csv')