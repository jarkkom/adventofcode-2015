#!/usr/bin/env julia

using DelimitedFiles

input = joinpath(@__DIR__, "input.txt")

instructions = read(input, String)

function count_visited_house(instructions)
    map = Dict()

    x = 0
    y = 0
    map[(x, y)] = get(map, (x, y), 0) + 1

    for (pos, c) in enumerate(instructions)
        if c == '>' 
            x += 1
        end
        if c == '<' 
            x -= 1
        end
        if c == '^' 
            y -= 1
        end
        if c == 'v'
            y += 1
        end
        map[(x, y)] = get(map, (x, y), 0) + 1
    end

    map.count
end

@assert(count_visited_house(">") == 2)
@assert(count_visited_house("^>v<") == 4)
@assert(count_visited_house("^v^v^v^v^v") == 2)

println(count_visited_house(instructions))