function LibTreesitter.TSTreeCursor(node::TSNode)
    return ts_tree_cursor_new(node)
end

function tree_getroot(tree::Ptr{TSTree})
    ts_tree_root_node(tree)
end

function cursor_currentnode(ts::TSTreeCursor)
    ts_tree_cursor_current_node(Ref(ts))
end

function cursor_current_fieldname(T::TSTreeCursor)
    s = ts_tree_cursor_current_field_name(Ref(T))
    s == C_NULL && return nothing
    return unsafe_string(s)
end

function cursor_current_fieldid(T::TSTreeCursor)
    ts_tree_cursor_current_field_id(Ref(T))
end

function cursor_parent(T::TSTreeCursor)
    parent_exists = ts_tree_cursor_goto_parent(Ref(T))
    parent_exists ? cursor_currentnode(T) : nothing
end

function cursor_next(T::TSTreeCursor)
    has_sibling = ts_tree_cursor_goto_next_sibling(Ref(T))
    has_sibling ? cursor_currentnode(T) : nothing
end

function cursor_firstchild(T::TSTreeCursor)
    has_child = ts_tree_cursor_goto_first_child(Ref(T))
    has_child ? cursor_currentnode(T) : nothing
end

function cursor_copy(T::TSTreeCursor)
    new_cursor = ts_tree_cursor_copy(Ref(T))
    return new_cursor
end

# Iterator interface.
function Base.iterate(tree_cursor::TSTreeCursor)
    cursor_next(tree_cursor)
end
