module NormalCopula
    using Distributions
    using LinearAlgebra

    export normcopula_density

    const stdnormal = Normal()
    function normcopula_density(u, R)
        pvec = similar(u)
        for i = 1:length(u)
            pvec[i] = quantile(stdnormal, u[i])
        end
        RmI = inv(R)
        for i = 1:length(u)
            RmI[i,i] -= 1.
        end
        return 1/sqrt(det(R)) * exp(-0.5 * dot(pvec, RmI*pvec))
    end


end # module
