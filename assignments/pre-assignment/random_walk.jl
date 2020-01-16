using CurveFit
import PyPlot
plt = PyPlot


num_simulations = 1000
max_sim_time = 120
results = zeros(Float64, max_sim_time)
x_vals = collect(1.0:max_sim_time)


function rand_walk(max_t=max_sim_time)
    steps = rand([-1, 1], max_t)
    pos = 0
    for i in 1:size(steps, 1)
        pos += steps[i]
        if pos == 0
            return i
        end
    end
    return max_t
end

for i in 1:num_simulations
    index = rand_walk()
    results[index] += 1
end

# Disregard runs reaching max_sim_time
results[max_sim_time] = 0.0


# Clean results for curve fitting
res = filter!(x -> x!=0, results)
x_fit = collect(2.0:2:2*size(res, 1))


fit = curve_fit(PowerFit, x_fit, res)
println("p(t) = a*t^b, where a and b are: ")
println(fit)


plt.bar(x_fit, res)
plt.plot(x_vals, fit.(x_vals))
plt.show()
