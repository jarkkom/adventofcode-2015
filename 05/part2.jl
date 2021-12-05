#!/usr/bin/env julia

function is_nice(s)
    match(r"(..).*\1{1,}", s) !== nothing && match(r"(.).\1{1,}", s) !== nothing
end

@assert(is_nice("qjhvhtzxzqqjkmpb") == true)
@assert(is_nice("xxyxx") == true)
@assert(is_nice("uurcxstgmygtbstg") == false)
@assert(is_nice("ieodomkazucvgmuy") == false)

input = joinpath(@__DIR__, "input.txt")

lines = readlines(input)

println(length(filter(b -> b == true, map(is_nice, lines))))
