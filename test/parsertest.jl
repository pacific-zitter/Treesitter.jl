using Treesitter

parser = Parser()
l = set_language(parser, tree_sitter_c())

source_code = joinpath(@__DIR__, "c_samples/easystruct.h")

tree = Treesitter.parse_filewith(parser, source_code)

function _parse_string(parser::Parser, codestring)
    out_tree = ts_parser_parse_string(
        parser.ptr,
        Ptr{Cvoid}(),
        codestring,
        length(codestring),
    )

    return out_tree
end

function name(args)
    body
end

mystring = read(source_code, String)

treeptr = _parse_string(parser, mystring)
