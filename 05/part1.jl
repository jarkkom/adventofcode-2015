#!/usr/bin/env julia

function is_nice(s)
    match(r"[aeiou].*[aeiou].*[aeiou]", s) !== nothing && match(r"([a-z])\1{1}", s) !== nothing && match(r"(ab|cd|pq|xy)", s) === nothing
end

@assert(is_nice("ugknbfddgicrmopn") == true)
@assert(is_nice("aaa") == true)
@assert(is_nice("jchzalrnumimnmhp") == false)
@assert(is_nice("haegwjzuvuyypxyu") == false)
@assert(is_nice("dvszwmarrgswjxmb") == false)

input = joinpath(@__DIR__, "input.txt")

lines = readlines(input)

println(length(filter(b -> b == true, map(is_nice, lines))))
