
using Distributed

addprocs(4)

@everywhere begin
    using ProgressMeter
    using Random, RandomNumbers, LinearAlgebra, Statistics, LoopVectorization
    using DelimitedFiles, Printf, StatsBase, Distributions    

start_time = time()
param_list = range(0, 1, length=1000)

function generate_data(param)
    op_arr = []
    iterations = 1000
    for _ in 1:iterations
        prob_weights = weights([param, 1-param])
        push!(op_arr, sample(0:1, prob_weights))
    end
    title_str = "Data/data_param=$(param)_iterations=$(iterations).txt"
    writedlm(title_str, op_arr)
end

end

# Use pmap to apply the function to each element of param_list in parallel
@showprogress 1 "Progress:" pmap(generate_data, param_list)

println("--- $(time() - start_time) Total time taken ---")
println("Done")