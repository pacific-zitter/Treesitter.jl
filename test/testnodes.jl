using Treesitter

parser = Parser()
set_language(parser, tree_sitter_c())

source_code = joinpath(@__DIR__, "c_samples/rationals.h")
tree = Treesitter.parse_filewith(parser, source_code)
root = ts_tree_root_node(tree)

root_children = node_children(root)
