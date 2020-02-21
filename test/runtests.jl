using NormalCopula
using Test
using LinearAlgebra

@testset "NormalCopula.jl" begin
    ndim = 5
    R = diagm(0=>ones(ndim))
    us = [rand(ndim) for i = 1:10]
    for u in us
        @test 1.0 ≈ normcopula_density(u, R)
    end
end


@testset "NormalCopula.jl - logdensity" begin
    ndim = 5
    R = diagm(0=>ones(ndim))
    us = [rand(ndim) for i = 1:10]
    for u in us
        @test 0.0 ≈ normcopula_logdensity(u, R)
    end
end
