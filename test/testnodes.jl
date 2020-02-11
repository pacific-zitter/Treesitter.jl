using Treesitter

parser = Parser()
set_language(parser, tree_sitter_c())

source_code = joinpath(@__DIR__, "c_samples/easystruct.h")
tree = Treesitter.parse_filewith(parser, source_code)

function text_for_node(parser::Parser, node::TSNode)
    b1 = node_startbyte(node)
    b2 = node_endbyte(node)
    s = parser.buffer[b1+1:b2-1]
end

root = ts_tree_root_node(tree)
c_named = node_namedchildren(root)
c = node_children(root)

foreach(c_named) do node
    t = text_for_node(parser, node) |> String
    s = node_string(node)
    @show t, s
end
