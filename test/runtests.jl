using Treesitter
# using Test

parser = Treesitter.Parser()
Treesitter.set_language(parser, tree_sitter_c())
source_code = read(joinpath(@__DIR__, "corpus/easystruct.h"), String)

tree = parse_string(parser, source_code)
rootnode = node_rootof(tree)


srtpt = node_startpoint(rootnode)
endpt = node_endpoint(rootnode)
