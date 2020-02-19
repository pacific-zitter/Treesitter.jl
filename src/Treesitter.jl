module Treesitter
using Reexport
export Parser, parse_filewith, parse_string, set_language, tree_sitter_c
export show, NodeLocation
include("LibTreesitter.jl")

@reexport using .LibTreesitter

tree_sitter_c() = ccall((:tree_sitter_c, LibTreesitter.libtreesitter_c), Ptr{Cvoid}, ())

include("parser.jl")
include("nodes.jl")
include("treecursor.jl")

include("debug.jl")

# Export all names starting with node, language, cursor, or tree.
foreach(names(@__MODULE__, all = true)) do s
    if startswith(string(s), r"node|language|cursor|tree"i)
        @eval export $s
    end
end

end # module Treesitter
