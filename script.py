import numpy as np
import random
import time
from tqdm import tqdm

start_time = time.time()
param_list = np.linspace(0,1,1000)
iterations =1000
op_arr = np.array([])

for i in tqdm(range(0,len(param_list)), desc = "Progress"):
    for _ in range(iterations):
        np.append(op_arr,random.choices([0,1],[param_list[i],(1-param_list[i])]))
    title_str = "Data/data_param=" + str(param_list[i]) + "_iterations=" + str(iterations) +".txt"
    np.savetxt(title_str,op_arr)

print("--- %s Total time taken ---" % (time.time() - start_time))
print('Done')