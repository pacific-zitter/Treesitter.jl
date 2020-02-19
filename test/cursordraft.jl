using Treesitter

mutable struct Cursor
    current_cursor::Union{TSTreeCursor,Nothing}
    current_node::TSNode
    next_sibling::Union{TSTreeCursor,Nothing}
    first_child::Union{TSTreeCursor,Nothing}
    text::Array{UInt8,1}
    current_text
end # struct

parser = Parser()
set_language(parser, tree_sitter_c())
tree = Treesitter.parse_filewith(
    parser,
    joinpath(@__DIR__, "corpus/easystruct.h"),
)

root_cursor = tree_getroot(tree)

root = cursor_new(root_cursor)

cursor = Cursor(
    root,
    cursor_current_node(root),
    cursor_next(root),
    cursor_firstchild(root),
    parser.buffer,
    nothing,
)
cursor.current_text = view(
    cursor.text,
    node_startbyte(cursor.current_node)+1:node_endbyte(cursor.current_node),
)

# TODO change to use nodes insea
function byterange(node::TSNode)
    start = node_startbyte(node) + 1
    stop = node_endbyte(node)
    return start:stop
end

# TODO change to use nodes instead of cursors.
function cursor_next!(cursor::Cursor)
    isnothing(cursor.next_sibling) && return

    cursor_next(cursor.current_cursor)

    cursor.current_cursor = cursor.next_sibling
    cursor.current_node = cursor_current_node(cursor.current_cursor)
    cursor.next_sibling = cursor_next(cursor.current_cursor)

    bytes = byterange(cursor.current_node)
    cursor.current_text = view(cursor.text, bytes)
end

# TODO change to use nodes instead of cursors.
function cursor_firstchild!(cursor::Cursor)
    isnothing(cursor.first_child) && return

    cursor.current_cursor = cursor.first_child

    cursor.current_node = cursor_current_node(cursor.current_cursor)

    cursor.next_sibling = cursor_next(cursor.current_cursor)
    cursor.first_child = cursor_firstchild(cursor.current_cursor)

    cursor.current_text = view
end
