function getcursor(node::TSNode)
    ts_tree_cursor_new(node)
end

function current_node(ts::TSTreeCursor)
    ts_tree_cursor_current_node(Ref(ts))
end

function current_fieldname(T::TSTreeCursor)
    s = ts_tree_cursor_current_field_name(Ref(T))
    s == C_NULL && return nothing
    return unsafe_string(s)
end

function current_fieldid(T::TSTreeCursor)
    ts_tree_cursor_current_field_id(Ref(T))
end

function goto_parent(T::TSTreeCursor)
    parent_exists = ts_tree_cursor_goto_parent(Ref(T))
    parent_exists ? current_node(T) : nothing
end

function goto_next_sibling(T::TSTreeCursor)
    has_sibling = ts_tree_cursor_goto_next_sibling(Ref(T))
    has_sibling ? current_node(T) : nothing
end

function goto_first_child(T::TSTreeCursor)
    has_child = ts_tree_cursor_goto_first_child(Ref(T))
    has_child ? current_node(T) : nothing
end

function Base.deepcopy(T::TSTreeCursor)
    new_cursor = ts_tree_cursor_copy(Ref(T))
    return new_cursor
end
