using Treesitter

function node_isnull(node::TSNode)
    ts_node_is_null(node)
end
function node_type(node::TSNode)
    type_string = ts_node_type(node)
    return unsafe_string(type_string)
end

function node_symbol(node::TSNode)
    ts_node_symbol(node)
end

"""
    node_string(node::TSNode)

documentation
"""
function node_string(node::TSNode)
    s = ts_node_string(node)
    unsafe_string(s)
end

function node_isnamed(node::TSNode)
    ts_node_is_named(node)
end

function node_parent(node::TSNode)
    ts_node_parent(node)
end

"""
    node_child(node, index)

Get a child of the node at a particular index. Use Julian indexing with '1' being
the first child. Returns 'nothing' if the given node does not exist.
"""
function node_child(node::TSNode, index)
    c = ts_node_child(node, index-1)
    node_isnull(c) ? nothing : c
end

"""
    node_childcount(node)

Return the number of child nodes of a particular node. Can be zero.
"""
function node_childcount(node::TSNode)
    n = ts_node_child_count(node)
    Int(n)
end

"""
    node_next(args)

Return the next sibling of a node if it exists. Nothing otherwise.
"""
function node_next(node::TSNode)
    next = ts_node_next_sibling(node)
    node_isnull(next) ? nothing : next
end

"""
    node_prev(node::TSNode)

documentation
"""
function node_prev(node::TSNode)
    prev = ts_node_prev_sibling(node)
    node_isnull(prev) ? nothing : prev
end # function



parser = Parser()
set_language(parser, tree_sitter_c())

source_code = read(joinpath(@__DIR__,"rationals.h"),String);

tree = parser(source_code)
root = ts_tree_root_node(tree)

n1 = node_child(root,1)
node_type(n1)
node_symbol(n1)
node_
