using Treesitter

parser = Parser()
set_language(parser, tree_sitter_c())

source_code = read(joinpath(@__DIR__, "easystruct.h"), String);
source_bytes = read(joinpath(@__DIR__, "easystruct.h"))

tree = parser(source_code)
