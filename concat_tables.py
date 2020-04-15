#the originary order of tab was used

import pandas as pd
import os
os.chdir("tab_CMG")
dir_content = os.listdir()
dir_content.remove("mergingtable.py")
#dir_content.remove("results.csv")
print(dir_content)

def table_extraction(file_name):
    with open(file_name) as table:
        pandatable = pd.read_table(table, index_col=0)
    return pandatable
   
table_list = []
for name in dir_content:
    name = table_extraction(name)
    table_list.append(name)

full_table = pd.concat(table_list, axis=1, ignore_index=True )
p_indexing = list(full_table.index)
full_table.columns = p_indexing


full_table.to_csv("./results.csv")
print(full_table.head())
