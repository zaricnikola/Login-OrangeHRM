from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time
from selenium.webdriver.support.select import Select
from selenium.webdriver import ActionChains

chrome_options = Options()

chrome_options.add_argument('--detach')

serv_obj=Service('C:\\Users\\nikola.m.zaric\\OneDrive - Kuehne+Nagel\\Desktop\\Sandbox\\driver\\chromedriver.exe')

driver=webdriver.Chrome(service=serv_obj, options=chrome_options)
driver.implicitly_wait(10)

driver.get("https://opensource-demo.orangehrmlive.com/web/index.php/auth/login")
driver.maximize_window()

# Find the username and password fields, and login button
username_field = driver.find_element(By.XPATH,'//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/div[2]/input')
password_field = driver.find_element(By.XPATH,'//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[2]/div/div[2]/input')
login_button = driver.find_element(By.XPATH,'//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button')

# Enter the username and password
username_field.send_keys("Admin")
password_field.send_keys("admin123")

# Click the login button
login_button.click()

# Wait for a moment to see the result
driver.implicitly_wait(5)

# Verify if login was successful by checking the URL or a specific element on the dashboard
if "dashboard" in driver.current_url:
    print("Login Successful!")
else:
    print("Login Failed!")

time.sleep(20)

# Close the browser
#driver.quit()
