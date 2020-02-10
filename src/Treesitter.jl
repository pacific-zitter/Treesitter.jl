module Treesitter
using Reexport
export Parser, set_language, tree_sitter_c, children
export TSTreeCursor, current_node, current_fieldname, current_fieldid, goto_parent,
goto_first_child, goto_next_sibling, deepcopy, getcursor

include("LibTreesitter.jl")

@reexport using .LibTreesitter

tree_sitter_c() = ccall((:tree_sitter_c, libtreesitter_c), Ptr{Cvoid}, ())

include("parser.jl")
include("treecursor.jl")

end # module Treesitter
