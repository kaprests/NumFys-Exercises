using LinearAlgebra
using IterativeSolvers
import PyPlot
plt = PyPlot


N = 100
V1 = 1
conductivities = rand(N) # Resistors in series (conductance)
x = collect(1:N+1)


# Analytical solution
#########################################################

R_resistors = 1 ./ conductivities
R_eff = sum(R_resistors)
I = V1 / R_eff # Current flowing through the chain
V_drops = R_resistors .* I
V_analyt = zeros(N+1)
V_analyt[1] = V1

for i in 1:size(V_drops, 1)
    V_analyt[i+1] = V_analyt[i] - V_drops[i]
end


#########################################################


# Iterative methods
#########################################################

diag = conductivities[1:end-1] + conductivities[2:end]
off_diag = conductivities[2:end-1]*(-1)
A = SymTridiagonal(diag, off_diag)
b = zeros(N-1)
b[1] = conductivities[1]

println("##################################")
println("Analytic A*v:")
println(norm(A*V_analyt[2:end-1] - b))


V_jacobi = append!(pushfirst!(jacobi(A, b, maxiter=100), 1), 0)
V_gs = append!(pushfirst!(gauss_seidel(A, b, maxiter=100), 1), 0)
V_sor = append!(pushfirst!(ssor(A, b, 1.0, maxiter=100), 1), 0)

V_cg = rand(N-1)
cg!(V_cg, A, b)

B = copy(b)
d1 = copy(off_diag)
d2 = copy(off_diag)
d = copy(diag)
V_gtsv = LAPACK.gtsv!(d1, d, d2, B)


println(norm(A*V_analyt[2:end-1] - b))


#println("##################################")
#println("Jacobi A*v:")
#println(A * V_jacobi[2:end-1])
#println("##################################")
#println("conj gradient A*v:")
#println(A*V_cg)
#println(b)
#println(summary(A))
#println(summary(V_jacobi))

#########################################################


# Plotting
########################################################
plt.plot(x, V_analyt, label="analytical")
plt.plot(x, V_jacobi, label="Jacobi")
plt.plot(x, V_gs, label="Gauss Seidel")
plt.plot(x, V_sor, label="SOR")
plt.plot(x[2:end-1], V_gtsv, label="gtsv - direct solver")
plt.plot(x[2:end-1], V_cg, label="conjugate gradient")
plt.legend()
plt.show()


