# TODO: Refactor
function cursor_new(node::TSNode)
    ts_tree_cursor_new(node)
end

function tree_getroot(tree::Ptr{TSTree})
    ts_tree_root_node(tree)
end

function cursor_current_node(cursor::TSTreeCursor)
    ts_tree_cursor_current_node(Ref(cursor))
end

function cursor_current_field_name(cursor::TSTreeCursor)
    s = ts_tree_cursor_current_field_name(Ref(cursor))
    s == C_NULL && return nothing
    return unsafe_string(s)
end

function cursor_current_field_id(cursor::TSTreeCursor)
    ts_tree_cursor_current_field_id(Ref(cursor))
end

function cursor_goto_parent(cursor::TSTreeCursor)
    parent_exists = ts_tree_cursor_goto_parent(Ref(cursor))
    parent_exists ? cursor : nothing
end

function cursor_next(cursor::TSTreeCursor)
    has_sibling = ts_tree_cursor_goto_next_sibling(Ref(cursor))
    has_sibling ? cursor : nothing
end

function cursor_firstchild(cursor::TSTreeCursor)
    has_child = ts_tree_cursor_goto_first_child(Ref(cursor))
    has_child ? cursor : nothing
end

function cursor_copy(cursor::TSTreeCursor)
    new_cursor = ts_tree_cursor_copy(Ref(cursor))
    return new_cursor
end
