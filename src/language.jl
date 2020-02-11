"""
    language_symbolcount(language::TSLanguage)

documentation
"""
function language_symbolcount(language)
    ts_language_symbol_count(language)
end

"""
    language_nameof(parser::Parser,node::TSNode)

documentation
"""
function language_nameof(parser::Parser,node::TSNode)
    id = node_symbol(node)
    s = ts_language_symbol_name(parser.language, id)
    unsafe_string(s)
end
