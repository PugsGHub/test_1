using ProgressMeter
using Random, RandomNumbers, LinearAlgebra, Statistics, LoopVectorization
using DelimitedFiles, Printf, StatsBase, Distributions
#type whatever 
start_time = time()
param_list = range(0, 1, length=1000)
iterations = 1000
op_arr = []

@showprogress for i in 1:length(param_list)
    for _ in 1:iterations
        prob_weights = weights([param_list[i],1-param_list[i]])
        push!(op_arr, sample(0:1, prob_weights))
    end
    title_str = "Data/data_param=$(param_list[i])_iterations=$(iterations).txt"
    writedlm(title_str, op_arr)
end

println("--- $(time() - start_time) Total time taken ---")
println("Done")
