from selenium import webdriver
import warnings
warnings.filterwarnings("ignore", category=DeprecationWarning) 
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
import pickle
import time 
import pandas as pd 


def url_gen(page_num):
    return f"https://data.cityofchicago.org/browse?&page={page_num}"


if __name__ == '__main__':
    chrome_options = Options()
    chrome_options.add_argument("--headless");
    driver = webdriver.Chrome("./chromedriver", chrome_options=chrome_options)

    for i in range(1,66):
        driver.get(url_gen(i))
        categories = driver.find_elements(By.XPATH, "//span[text()='Dataset']/../../../..")
        for c in categories:
            data_name = c.find_element_by_xpath('./div[1]/div[1]/div[1]/h2/a').get_attribute('text')
            link = c.find_element_by_xpath('./div[2]/div[3]/a').get_attribute('href')
            print(data_name)
            file_name = data_name.replace(' ', '_').replace(',', '-')
            print(f"page:{i} \n file_name:{file_name}")
            print(link)
            code = link.split('/')[-1]
            urllib.request.urlretrieve(f"https://data.cityofchicago.org/api/views/{code}/rows.csv?accessType=DOWNLOAD&api_foundry=true", f"{file_name}.csv")
            print('\n')

