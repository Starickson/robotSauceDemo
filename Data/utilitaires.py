import random
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager
from robot.api.deco import keyword




@keyword
def get_sorted_desc(list=[]):
    for i in range(len(list)):
        if float(list[i]) < float(list[i+1]):
            return False
        else:
            return True
        

@keyword
def get_sorted_asc(list=[]):
    for i in range(len(list)):
        if float(list[i]) > float(list[i+1]):
            return False
        else:
            return True
        
        
