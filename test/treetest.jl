using Treesitter

p = Parser(tree_sitter_c())
tree = parse_string(p, "typedef int* jeff;")

sexp = repr("text/plain",tree.root_node)

l1 = node_children(tree.root_node)
l2 = node_children.(l1)
