using PyPlot
using LinearAlgebra

largest_evs = []

for i in 1:100
    M = Symmetric(rand(100, 100))
    println(eigvals(M)[end])
    append!(largest_evs, eigvals(M)[end])
end


# Plot
hist(largest_evs)
show()
