# Parser helper functions.
mutable struct Parser
    ptr::Ptr{Cvoid}
    function Parser()
        obj = new(ts_parser_new())
        finalizer(obj) do x
            ts_parser_delete(x.ptr)
        end
        return obj
    end
end

function set_language(P::Parser, language)
 ts_parser_set_language(P.ptr, language)
end

function (P::Parser)(s::AbstractString)
    ts_parser_parse_string(P.ptr, C_NULL, s, length(s))
end

function children(node)
    l = ts_node_child_count(node)
    l == 0 && return TSNode[]

    c = Vector{TSNode}(undef, l)
    for i in 1:l
        c[i] = ts_node_child(node, i-1)
    end
    c
end
