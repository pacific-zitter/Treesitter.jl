using Treesitter

parser = Parser()
set_language(parser, tree_sitter_c())

source_code = read(joinpath(@__DIR__,"rationals.h"),String);

tree = parser(source_code)
root = ts_tree_root_node(tree)

n1 = node_child(root,1)
node_type(n1)
node_symbol(n1)
node_
