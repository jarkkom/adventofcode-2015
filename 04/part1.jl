#!/usr/bin/env julia

using MD5


function find_hash(key)
    i = 0
    while !startswith(bytes2hex(md5("$(key)$(i)")), "00000")
        i += 1
    end

    i
end

@assert(find_hash("abcdef") == 609043)
@assert(find_hash("pqrstuv") == 1048970)

println(find_hash("yzbqklnj"))