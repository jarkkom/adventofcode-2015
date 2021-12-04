#!/usr/bin/env julia

input = joinpath(@__DIR__, "input.txt")

instructions = read(input, String)

function find_basement_position(instructions)
    curr_floor = 0
    for (pos, c) in enumerate(instructions)
        if c == '('
            curr_floor += 1
        elseif c == ')'
            curr_floor -= 1
        end

        if curr_floor == -1
            return pos
        end
    end
end

@assert(find_basement_position(")") == 1)
@assert(find_basement_position("()())") == 5)

println(find_basement_position(instructions))