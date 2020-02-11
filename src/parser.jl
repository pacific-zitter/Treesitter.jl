# Parser helper functions.
mutable struct Parser
    ptr::Ptr{Cvoid}
    language::Ptr{TSLanguage}
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

function (P::Parser)(s::AbstractString)
    ts_parser_parse_string(P.ptr, C_NULL, s, length(s))
end
