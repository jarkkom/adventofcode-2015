#!/usr/bin/env julia

using DelimitedFiles

input = joinpath(@__DIR__, "input.txt")

instructions = read(input, String)

function count_instructions(instructions)
    up = count(i->(i == '('), instructions)
    down = count(i->(i == ')'), instructions)

    up - down
end

@assert(count_instructions("(())") == 0)
@assert(count_instructions("()()") == 0)

@assert(count_instructions("))(((((") == 3)
@assert(count_instructions("(()(()(") == 3)

@assert(count_instructions("())") == -1)
@assert(count_instructions("))(") == -1)

@assert(count_instructions(")))") == -3)
@assert(count_instructions(")())())") == -3)

println(count_instructions(instructions))