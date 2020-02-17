using Treesitter
function node_text(parser::Parser, node::TSNode)
    return parser.buffer[node_indices(node)] |> String
end
parser = Parser()
set_language(parser, tree_sitter_c())

source_code = joinpath(@__DIR__, "c_samples/easystruct.h")
tree = Treesitter.parse_filewith(parser, source_code)
root = ts_tree_root_node(tree)

c = node_children(root)
c2 = node_namedchildren(root)
c3 = node_namedchildren.(c2)


node_text.(parser, c3 )
