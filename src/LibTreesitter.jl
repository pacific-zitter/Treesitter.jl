module LibTreesitter
import Libdl

const libtreesitter = joinpath(dirname(@__DIR__),"deps/usr/lib/libtreesitter.so")
using CEnum

include(joinpath(@__DIR__, "..", "gen", "common.jl"))
include(joinpath(@__DIR__, "..", "gen", "api.jl"))

# export everything
foreach(names(@__MODULE__, all=true)) do s
   if startswith(string(s), r"ts"i)
       @eval export $s
   end
end
export TSTreeCursor
end # module LibTreesitter
