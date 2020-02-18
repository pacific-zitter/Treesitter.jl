Base.cconvert(::Type{Ptr{TSTreeCursor}}, cursor::TSTreeCursor) =
    Base.cconvert(Ptr{TSTreeCursor}, Ref(cursor))

function cursor_new(node::TSNode)
    ts_tree_cursor_new(node)
end

function cursor_current_node(cursor::TSTreeCursor)
    ts_tree_cursor_current_node(cursor)
end

function cursor_current_field_name(cursor::TSTreeCursor)
    s = ts_tree_cursor_current_field_name(cursor)
    s == C_NULL && return nothing
    return unsafe_string(s)
end

function cursor_current_field_id(cursor::TSTreeCursor)
    ts_tree_cursor_current_field_id(cursor)
end

function cursor_goto_parent!(cursor::TSTreeCursor)
    parent_exists = ts_tree_cursor_goto_parent(cursor)
    parent_exists && return cursor
end

function cursor_goto_next!(cursor::TSTreeCursor)
    has_sibling = ts_tree_cursor_goto_next_sibling(cursor)
    has_sibling && return cursor
end

function cursor_goto_child!(cursor::TSTreeCursor)
    has_child = ts_tree_cursor_goto_first_child(cursor)
    has_child && return cursor
end

function cursor_copy(cursor::TSTreeCursor)
    new_cursor = ts_tree_cursor_copy(cursor)
    return new_cursor
end

function cursor_reset(cursor::TSTreeCursor, node::TSNode)
    ncursor::TSTreeCursor = ts_tree_cursor_reset(cursor, node)
    return ncursor
end

function node_type(cursor::TSTreeCursor)
    node_type(cursor_current_node(cursor))
end
