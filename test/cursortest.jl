using Treesitter

parser = Parser()
set_language(parser, tree_sitter_c())

source_code = read(joinpath(@__DIR__,"rationals.h"),String)

tree = parser(source_code)
root = ts_tree_root_node(tree)

cursor = getcursor(root)
c1 = children(current_node(cursor))
c2 = children(children(current_node(cursor))[1])

y = []
foreach(c2) do node
    type = ts_node_type(node) |> unsafe_string
    node_children = children(node) .|> ts_node_type .|> unsafe_string
    node_string = ts_node_string(node) |> unsafe_string
    push!(y, (type,node_children,node_string))
end
