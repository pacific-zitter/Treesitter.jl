using Treesitter

parser = Parser()
set_language(parser, tree_sitter_c())

source_code = joinpath(@__DIR__, "c_samples/easystruct.h")
tree = Treesitter.parse_filewith(parser, source_code)

function text_for_node(parser::Parser, node::TSNode)
    b1 = node_startbyte(node)
    b2 = node_endbyte(node)
    s = parser.buffer[b1 + 1:b2 - 1]
end

root = ts_tree_root_node(tree)

function walknodes(node)
    content = nothing
    try
        content = node_children(node)
    catch err

    end # try

    function _it(chnl)
        put!(chnl,content)
        for n in content
            for node_l in walknodes(n)
                put!(chnl, node_l)
            end
        end
    end
    return Channel(_it)
end

y = walknodes(root)

take!(y)
