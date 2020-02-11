# Parser helper functions.
mutable struct Parser
    ptr::Ptr{Cvoid}
    language::Ptr{TSLanguage}
    buffer::Union{Vector{UInt8},Nothing}
    function Parser()
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

#=
LANGUAGE
=#
"""
    language_symbol_count(language::TSLanguage)

documentation
"""
function language_symbol_count(language::Ptr{TSLanguage})
    ts_language_symbol_count(language)
end
language_symbolcount(parser::Parser) = language_symbolcount(parser.language)

"""
    language_symbolname(language::Ptr{TSLanguage}, symbol::TSSymbol)

documentation
"""
function language_symbolname(language::Ptr{TSLanguage}, symbol::TSSymbol)
    symbol_name = ts_language_symbol_name(language, symbol)
    return unsafe_string(symbol_name)
end
language_symbolname(parser::Parser, symbol::TSSymbol) =
    language_symbolname(parser.language, symbol)
