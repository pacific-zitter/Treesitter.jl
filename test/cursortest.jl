using Treesitter

parser = Parser()
set_language(parser, tree_sitter_c())

source_code = joinpath(@__DIR__, "c_samples/easystruct.h")
tree = Treesitter.parse_filewith(parser, source_code)

root_node = tree_getroot(tree)

cursor = cursor_new(root_node)

C = cursor_firstchild(cursor)
