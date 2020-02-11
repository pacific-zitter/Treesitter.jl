"""
    isequal(node1,node2)
Check if two nodes are identical.
"""
Base.isequal(x::TSNode, y::TSNode) = ts_node_eq(x, y)

"""
    node_isnull(node::TSNode)

Check if the node is null. Functions like `ts_node_child` and
`ts_node_next_sibling` will return a null node to indicate that no such node
was found.
"""
function node_isnull(node::TSNode)
    ts_node_is_null(node)
end

"""
    node_type(node::TSNode)
Get the node's type as a string
"""
function node_type(node::TSNode)
    type_string = ts_node_type(node)
    return unsafe_string(type_string)
end

"""
    node_type(node::TSNode)
Get the node's type as a numerical id.
"""
function node_symbol(node::TSNode)
    ts_node_symbol(node)
end

"""
    node_string(node::TSNode)

Get an S-expression representing the node as a string.

This string is allocated with `malloc` and the caller is responsible for
freeing it using `free`.
"""
function node_string(node::TSNode)
    s = ts_node_string(node)
    unsafe_string(s)
end

"""
    node_isnamed(node::TSNode)

Check if the node is *named*. Named nodes correspond to named rules in the
grammar, whereas *anonymous* nodes correspond to string literals in the
grammar.
"""
function node_isnamed(node::TSNode)
    ts_node_is_named(node)
end

"""
    node_isextra(node::TSNode)

Check if the node is *extra*. Extra nodes represent things like comments,
which are not required the grammar, but can appear anywhere.
"""
function node_isextra(node::TSNode)
    ts_node_is_extra(node)
end

"""
    node_parent(node::TSNode)
documentation
"""
function node_parent(node::TSNode)
    parent = ts_node_parent(node)
    node_isnull(parent) ? nothing : parent
end

"""
    node_child(node, index)

Get a child of the node at a particular index. Use Julian indexing with '1' being
the first child. Returns 'nothing' if the given node does not exist.
"""
function node_child(node::TSNode, index)
    c = ts_node_child(node, index - 1)
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

Return the previous sibling of a node if it exists. Nothing otherwise.
"""
function node_prev(node::TSNode)
    prev = ts_node_prev_sibling(node)
    node_isnull(prev) ? nothing : prev
end

"""
    node_nextnamed(node::TSNode)

documentation
"""
function node_nextnamed(node::TSNode)
    next = ts_node_next_named_sibling(node)
    node_isnull(next) ? nothing : next
end

"""
    node_prevnamed(node::TSNode)

documentation
"""
function node_prevnamed(node::TSNode)
    prev = ts_node_prev_named_sibling(node)
    node_isnull(prev) ? nothing : prev
end

"""
    node_namedchild_count(node::TSNode)

documentation
"""
function node_namedchild_count(node::TSNode)
    n = ts_node_named_child_count(node)
    Int(n)
end

"""
node_namedchild(node::TSNode, index)

documentation
"""
function node_namedchild(node::TSNode, index)
    cnode = ts_node_named_child(node, index - 1)
    node_isnull(cnode) ? nothing : cnode
end

"""
    node_childby_fieldname(node::TSNode, fieldname::AbstractString)

documentation
"""
function node_childby_fieldname(node::TSNode, fieldname::AbstractString)
    child_node = ts_node_child_by_field_name(node, fieldname, length(fieldname))
    node_isnull(child_node) ? nothing : child_node
end

"""
    node_childby_fieldid(node::TSNode, id)

documentation
"""
function node_childby_fieldid(node::TSNode, id)
    child_node = ts_node_child_by_field_id(node, id)
    node_isnull(child_node) ? nothing : child_node
end


"""
    node_startbyte(node::TSNode)

documentation
"""
function node_startbyte(node::TSNode)
    start = ts_node_start_byte(node)
end

"""
    node_stopbyte(node::TSNode)

documentation
"""
function node_endbyte(node::TSNode)
    stop = ts_node_end_byte(node)
end


"""
    node_children(node::TSNode)

documentation
"""
function node_children(node::TSNode)
    l = ts_node_child_count(node)
    l == 0 && return nothing

    c = Vector{TSNode}(undef, l)
    @inbounds for i = 1:l
        c[i] = node_child(node, i)
    end
    c
end

"""
    node_namedchildren(node::TSNode)

Return all children for which there exists a token name.
"""
function node_namedchildren(node::TSNode)
    n = node_namedchild_count(node)
    n == 0 && return nothing

    result = Vector{TSNode}(undef, n)
    @inbounds for i = 1:n
        result[i] = node_namedchild(node, i)
    end
    return result
end
