#!/usr/bin/env julia

using DelimitedFiles

input = joinpath(@__DIR__, "input.txt")

dimensions = readdlm(input, 'x', Int, '\n')

function calc_area(l, w, h)
    s1 = l*w
    s2 = w*h
    s3 = h*l

    extra = min(s1, s2, s3)

    2*s1 + 2*s2 + 2*s3 + extra
end

@assert(calc_area(2, 3, 4) == 58)
@assert(calc_area(1, 1, 10) == 43)

function sum_dims(dimensions)
    s = 0
    for r in eachrow(dimensions)
        t = s + calc_area(r[1], r[2], r[3])
        s = t
    end
    
    s        
end

println(sum_dims(dimensions))
