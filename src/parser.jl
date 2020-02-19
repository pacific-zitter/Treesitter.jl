# parser.jls
#=
Parser helper functions.
=#
mutable struct Parser{L<:TSLanguage}
    ptr::Ptr{Cvoid}
    language::Ptr{L}
    function Parser{L}(lang::L) where {L<:TSLanguage}
        obj = new(ts_parser_new())
        finalizer(obj) do x
            ts_parser_delete(x.ptr)
        end
        return obj
    end
end

function set_language(P::Parser, language)
    if ts_parser_set_language(P.ptr, language)
        P.language = language
    else
        error("Error setting the parser language.")
    end
end

function parse_filewith(parser::Parser, filename::AbstractString)
    s = read(filename)
    parser.buffer = deepcopy(s)
    news = String(s)
    ts_parser_parse_string(parser.ptr, C_NULL, news, length(news))
end

function parse_string(parser::Parser, codestring)
    out_tree = ts_parser_parse_string(parser.ptr, Ptr{Cvoid}(), codestring, length(codestring))

    return out_tree
end
