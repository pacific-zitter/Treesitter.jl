using Treesitter

parser = Parser()
set_language(parser, tree_sitter_c())

ts_language_symbol_count(parser.language)

source_code = read(joinpath(@__DIR__,"c_samples/rationals.h"),String)
