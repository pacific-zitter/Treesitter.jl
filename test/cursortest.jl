using Treesitter

parser = Parser()
set_language(parser, tree_sitter_c())
codestring = read(joinpath(@__DIR__, "c_samples/easystruct.h"), String)

tree =
    ts_parser_parse_string(parser.ptr, C_NULL, codestring, length(codestring))
root_node = node_rootof(tree)

tc = cursor_new(root_node)

nodecurr = cursor_current_node(tc)

node_type(nodecurr)

crs = cursor_goto_parent!(crs)

node_type(crs)
