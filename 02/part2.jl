#!/usr/bin/env julia

using DelimitedFiles

input = joinpath(@__DIR__, "input.txt")

dimensions = readdlm(input, 'x', Int, '\n')

function calc_ribbon(l, w, h)
    s = [l, w, h]
    ss = sort(s)

    wrap = ss[1]*2 + ss[2]*2
    bow = l * w * h

    wrap + bow
end

@assert(calc_ribbon(2, 3, 4) == 34)
@assert(calc_ribbon(1, 1, 10) == 14)

function sum_dims(dimensions)
    s = 0
    for r in eachrow(dimensions)
        t = s + calc_ribbon(r[1], r[2], r[3])
        s = t
    end
    
    s        
end

println(sum_dims(dimensions))
