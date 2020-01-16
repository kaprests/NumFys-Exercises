import PyPlot
println("Done getting pyplot")
plt = PyPlot

N = 1000 # Number of species
sim_time = 100000 # Simulation time
t_vec = collect(1:sim_time)
species = rand(N)
mins = zeros(sim_time)


for t in t_vec
    b_min = min(species...)
    idxs = findall(x -> x == b_min, species)
    idx = idxs[1]
    i, j, k = rand(3)
    species[idx] = i
    if idx == 1
        species[N] = j
        species[idx+1] = k
    elseif idx == N
        species[1] = k
        species[idx-1] = j
    else
        species[idx-1] = j
        species[idx+1] = k
    end
    mins[t] = idx
end

plt.scatter(mins, t_vec, s=0.1)
plt.show()
