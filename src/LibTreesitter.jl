module LibTreesitter
using CEnum
using tree_sitter_c_jll

include(joinpath(@__DIR__, "..", "gen", "libtreesitter_h.jl"))
include(joinpath(@__DIR__, "..", "gen", "libtreesitter_c.jl"))

# export everything
foreach(names(@__MODULE__, all = true)) do s
    if startswith(string(s), r"ts"i)
        @eval export $s
    end
end

end # module LibTreesitter
