#!/usr/bin/env julia

using MD5


function find_hash(key)
    i = 0
    while !startswith(bytes2hex(md5("$(key)$(i)")), "000000")
        i += 1
    end

    i
end

println(find_hash("yzbqklnj"))