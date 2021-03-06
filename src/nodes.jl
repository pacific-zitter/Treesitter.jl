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
    node_ismissing(node::TSNode)

Check if the node is *missing*. Missing nodes are inserted by the parser in
order to recover from certain kinds of syntax errors.
"""
function node_ismissing(node::TSNode)
    ts_node_is_missing(node)
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
Get the node's immediate parent.
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

Get the node's next *named* sibling.
"""
function node_nextnamed(node::TSNode)
    next = ts_node_next_named_sibling(node)
    node_isnull(next) ? nothing : next
end

"""
    node_prevnamed(node::TSNode)

Get the node's previous *named* sibling.
"""
function node_prevnamed(node::TSNode)
    prev = ts_node_prev_named_sibling(node)
    node_isnull(prev) ? nothing : prev
end

"""
    node_namedchild_count(node::TSNode)

Get the node's number of *named* children.
"""
function node_namedchild_count(node::TSNode)
    n = ts_node_named_child_count(node)
    Int(n)
end

"""
node_namedchild(node::TSNode, index)

Get the node's *named* child at the given index.
"""
function node_namedchild(node::TSNode, index)
    cnode = ts_node_named_child(node, index - 1)
    node_isnull(cnode) ? nothing : cnode
end

"""
    node_childby_fieldname(node::TSNode, fieldname::AbstractString)

Get the node's child with the given field name.
"""
function node_childby_fieldname(node::TSNode, fieldname::AbstractString)
    child_node = ts_node_child_by_field_name(node, fieldname, length(fieldname))
    node_isnull(child_node) ? nothing : child_node
end

"""
    node_childby_fieldid(node::TSNode, id)

Get the node's child with the given numerical field id.

You can convert a field name to an id using the
`ts_language_field_id_for_name` function.
"""
function node_childby_fieldid(node::TSNode, id)
    child_node = ts_node_child_by_field_id(node, id)
    node_isnull(child_node) ? nothing : child_node
end

"""
    node_startbyte(node::TSNode)

Get the location where start of the node occurs within the source code.
The value returned by this function follows C array indexing such that
the first byte corresponds to a value of '0'.
"""
function node_startbyte(node::TSNode)
    start = ts_node_start_byte(node)
end

"""
    node_stopbyte(node::TSNode)

Get the location where the end of the node occurs within the source code.
The value returned by this function follows C array indexing such that
the first byte corresponds to a value of '0'.
"""
function node_endbyte(node::TSNode)
    stop = ts_node_end_byte(node)
end

"""
    node_children(node::TSNode)

Get an array containing all the children of the node.
Returns 'nothing' if the node does not have any children.
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

"""
    node_indices(node)
Return the range of text encapsulated by the given node.
"""
function node_indices(node::TSNode)
    start = node_startbyte(node) + 1
    stop = node_endbyte(node)
    return start:stop
end

"""
    node_text(txt, node)
Return a substring corresponding to the text that is associated with the given
node.
"""
function node_text(txt::AbstractString, node::TSNode)
    NI = node_indices(node)
    txt[NI]
end

"""
    node_rootof(tree)
Return the node corresponding to the root of the parsed syntax tree.
"""
function node_rootof(tree::Ptr{TSTree})::TSNode
    ts_tree_root_node(tree)
end

"""
    node_startpoint(node::TSNode)

Get the node's start position in terms of rows and columns.
"""
function node_startpoint(node::TSNode)
    pt = ts_node_start_point(node)
    npt = TSPoint(pt.row + 1, pt.column + 1)
end

"""
    node_endpoint(node::TSNode)

Get the node's end position in terms of rows and columns.
"""
function node_endpoint(node::TSNode)
    ts_node_end_point(node)
end
"""
    NodeLocation

Represents the start and stop location of a node within the source code.
start::TSPoint = [:row =>, :col=> ], stop::TSPoint = [:row =>, :col=> ]
"""
mutable struct NodeLocation
    start::TSPoint
    stop::TSPoint
end

function NodeLocation(node::TSNode)
    NodeLocation(node_startpoint(node), node_endpoint(node))
end
