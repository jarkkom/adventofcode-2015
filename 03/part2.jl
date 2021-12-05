#!/usr/bin/env julia

using DelimitedFiles

input = joinpath(@__DIR__, "input.txt")

instructions = read(input, String)

function count_visited_house(instructions, map)
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

    map
end

function split_instructions(instructions)
    m = Dict()

    i1 = map((x) -> x[2], Iterators.filter(((x) -> x[1] % 2 == 0), enumerate(instructions)))
    i2 = map((x) -> x[2], Iterators.filter(((x) -> x[1] % 2 != 0), enumerate(instructions)))

    count_visited_house(i1, m)
    count_visited_house(i2, m)

    m.count
end

@assert(split_instructions("^v") == 3)
@assert(split_instructions("^>v<") == 3)
@assert(split_instructions("^v^v^v^v^v") == 11)

println(split_instructions(instructions))