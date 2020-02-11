using Treesitter

parser = Parser()
set_language(parser, tree_sitter_c())


source_code = joinpath(@__DIR__, "c_samples/easystruct.h")
tree = Treesitter.parse_filewith(parser, source_code)
root = tree_getroot(tree)

cursor = TSTreeCursor(root)

cursor_firstchild(cursor)
cursor_current_fieldname(cursor)
cursor_next(cursor)
