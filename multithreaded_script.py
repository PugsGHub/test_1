import numpy as np
import random
import time
from tqdm import tqdm
import concurrent.futures

start_time = time.time()
param_list = np.linspace(0,1,1000)
iterations =1000
op_arr = np.array([])

def process_param(i):
    arr = []
    for _ in range(iterations):
        arr.append(random.choices([0,1],[param_list[i],(1-param_list[i])]))
    title_str = "Data/data_param=" + str(param_list[i]) + "_iterations=" + str(iterations) +".txt"
    np.savetxt(title_str, np.array(arr))
    return arr

with concurrent.futures.ThreadPoolExecutor() as executor:
    results = list(tqdm(executor.map(process_param, range(len(param_list))), total=len(param_list), desc="Progress"))

op_arr = np.concatenate(results)
print("--- %s Total time taken ---" % (time.time() - start_time))
print('Done')