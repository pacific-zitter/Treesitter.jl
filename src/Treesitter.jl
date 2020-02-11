module Treesitter
using Reexport
export Parser, set_language, tree_sitter_c

include("LibTreesitter.jl")

@reexport using .LibTreesitter

tree_sitter_c() = ccall((:tree_sitter_c, libtreesitter_c), Ptr{Cvoid}, ())

include("parser.jl")
include("nodes.jl")
foreach(names(@__MODULE__, all = true)) do s
    if startswith(string(s), r"node"i)
        @eval export $s
    end

end
include("language.jl")
include("treecursor.jl")

end # module Treesitter
