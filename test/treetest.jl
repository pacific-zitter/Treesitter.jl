using Treesitter

parser = Parser()
l = set_language(parser, tree_sitter_c())
tree = Treesitter.parse_filewith(parser,joinpath(@__DIR__,"c_samples/easystruct.h"))

function _tree_copy(tree::Ptr{TSTree})
    new_treeptr = ts_tree_copy(tree)
    return new_treeptr
end

function _tree_delete(tree::Ptr{TSTree})
    ts_tree_delete(tree)
end

function _tree_root_node(tree::Ptr{TSTree})
    root_node = ts_tree_root_node(tree)
    return root_node
end

function _tree_language(tree::Ptr{TSTree})
    tree_language::Ptr{TSLanguage} = ts_tree_language(tree)
    return tree_language
end

tlang = _tree_language(tree)
