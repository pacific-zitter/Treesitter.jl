module LibTreesitter
using Reexport
@reexport using libtreesitter_jll

using CEnum

include(joinpath(@__DIR__, "..", "gen", "common.jl"))
include(joinpath(@__DIR__, "..", "gen", "api.jl"))

# export everything
foreach(names(@__MODULE__, all=true)) do s
   if startswith(string(s), r"ts"i)
       @eval export $s
   end
end

end # module LibTreesitter
