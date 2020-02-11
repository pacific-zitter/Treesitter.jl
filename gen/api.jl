# Julia wrapper for header: api.h
# Automatically generated using Clang.jl

function ts_parser_new()
    ccall((:ts_parser_new, libtreesitter), Ptr{TSParser}, ())
end

function ts_parser_delete(parser)
    ccall((:ts_parser_delete, libtreesitter), Cvoid, (Ptr{TSParser},), parser)
end

function ts_parser_set_language(self, language)
    ccall(
        (:ts_parser_set_language, libtreesitter),
        Bool,
        (Ptr{TSParser}, Ptr{TSLanguage}),
        self,
        language,
    )
end

function ts_parser_language(self)
    ccall(
        (:ts_parser_language, libtreesitter),
        Ptr{TSLanguage},
        (Ptr{TSParser},),
        self,
    )
end

function ts_parser_set_included_ranges(self, ranges, length)
    ccall(
        (:ts_parser_set_included_ranges, libtreesitter),
        Bool,
        (Ptr{TSParser}, Ptr{TSRange}, UInt32),
        self,
        ranges,
        length,
    )
end

function ts_parser_included_ranges(self, length)
    ccall(
        (:ts_parser_included_ranges, libtreesitter),
        Ptr{TSRange},
        (Ptr{TSParser}, Ptr{UInt32}),
        self,
        length,
    )
end

function ts_parser_parse(self, old_tree, input)
    ccall(
        (:ts_parser_parse, libtreesitter),
        Ptr{TSTree},
        (Ptr{TSParser}, Ptr{TSTree}, TSInput),
        self,
        old_tree,
        input,
    )
end

function ts_parser_parse_string(self, old_tree, string, length)
    ccall(
        (:ts_parser_parse_string, libtreesitter),
        Ptr{TSTree},
        (Ptr{TSParser}, Ptr{TSTree}, Cstring, UInt32),
        self,
        old_tree,
        string,
        length,
    )
end

function ts_parser_parse_string_encoding(
    self,
    old_tree,
    string,
    length,
    encoding,
)
    ccall(
        (:ts_parser_parse_string_encoding, libtreesitter),
        Ptr{TSTree},
        (Ptr{TSParser}, Ptr{TSTree}, Cstring, UInt32, TSInputEncoding),
        self,
        old_tree,
        string,
        length,
        encoding,
    )
end

function ts_parser_reset(self)
    ccall((:ts_parser_reset, libtreesitter), Cvoid, (Ptr{TSParser},), self)
end

function ts_parser_set_timeout_micros(self, timeout)
    ccall(
        (:ts_parser_set_timeout_micros, libtreesitter),
        Cvoid,
        (Ptr{TSParser}, UInt64),
        self,
        timeout,
    )
end

function ts_parser_timeout_micros(self)
    ccall(
        (:ts_parser_timeout_micros, libtreesitter),
        UInt64,
        (Ptr{TSParser},),
        self,
    )
end

function ts_parser_set_cancellation_flag(self, flag)
    ccall(
        (:ts_parser_set_cancellation_flag, libtreesitter),
        Cvoid,
        (Ptr{TSParser}, Ptr{Csize_t}),
        self,
        flag,
    )
end

function ts_parser_cancellation_flag(self)
    ccall(
        (:ts_parser_cancellation_flag, libtreesitter),
        Ptr{Csize_t},
        (Ptr{TSParser},),
        self,
    )
end

function ts_parser_set_logger(self, logger)
    ccall(
        (:ts_parser_set_logger, libtreesitter),
        Cvoid,
        (Ptr{TSParser}, TSLogger),
        self,
        logger,
    )
end

function ts_parser_logger(self)
    ccall((:ts_parser_logger, libtreesitter), TSLogger, (Ptr{TSParser},), self)
end

function ts_parser_print_dot_graphs(self, file)
    ccall(
        (:ts_parser_print_dot_graphs, libtreesitter),
        Cvoid,
        (Ptr{TSParser}, Cint),
        self,
        file,
    )
end

function ts_tree_copy(self)
    ccall((:ts_tree_copy, libtreesitter), Ptr{TSTree}, (Ptr{TSTree},), self)
end

function ts_tree_delete(self)
    ccall((:ts_tree_delete, libtreesitter), Cvoid, (Ptr{TSTree},), self)
end

function ts_tree_root_node(self)
    ccall((:ts_tree_root_node, libtreesitter), TSNode, (Ptr{TSTree},), self)
end

function ts_tree_language(arg1)
    ccall(
        (:ts_tree_language, libtreesitter),
        Ptr{TSLanguage},
        (Ptr{TSTree},),
        arg1,
    )
end

function ts_tree_edit(self, edit)
    ccall(
        (:ts_tree_edit, libtreesitter),
        Cvoid,
        (Ptr{TSTree}, Ptr{TSInputEdit}),
        self,
        edit,
    )
end

function ts_tree_get_changed_ranges(old_tree, new_tree, length)
    ccall(
        (:ts_tree_get_changed_ranges, libtreesitter),
        Ptr{TSRange},
        (Ptr{TSTree}, Ptr{TSTree}, Ptr{UInt32}),
        old_tree,
        new_tree,
        length,
    )
end

function ts_tree_print_dot_graph(arg1, arg2)
    ccall((:ts_tree_print_dot_graph, libtreesitter), Cvoid, (Ptr{TSTree}, Ptr{Libc.FILE}), arg1, arg2)
end

function ts_node_type(arg1)
    ccall((:ts_node_type, libtreesitter), Cstring, (TSNode,), arg1)
end

function ts_node_symbol(arg1)
    ccall((:ts_node_symbol, libtreesitter), TSSymbol, (TSNode,), arg1)
end

function ts_node_start_byte(arg1)
    ccall((:ts_node_start_byte, libtreesitter), UInt32, (TSNode,), arg1)
end

function ts_node_start_point(arg1)
    ccall((:ts_node_start_point, libtreesitter), TSPoint, (TSNode,), arg1)
end

function ts_node_end_byte(arg1)
    ccall((:ts_node_end_byte, libtreesitter), UInt32, (TSNode,), arg1)
end

function ts_node_end_point(arg1)
    ccall((:ts_node_end_point, libtreesitter), TSPoint, (TSNode,), arg1)
end

function ts_node_string(arg1)
    ccall((:ts_node_string, libtreesitter), Cstring, (TSNode,), arg1)
end

function ts_node_is_null(arg1)
    ccall((:ts_node_is_null, libtreesitter), Bool, (TSNode,), arg1)
end

function ts_node_is_named(arg1)
    ccall((:ts_node_is_named, libtreesitter), Bool, (TSNode,), arg1)
end

function ts_node_is_missing(arg1)
    ccall((:ts_node_is_missing, libtreesitter), Bool, (TSNode,), arg1)
end

function ts_node_is_extra(arg1)
    ccall((:ts_node_is_extra, libtreesitter), Bool, (TSNode,), arg1)
end

function ts_node_has_changes(arg1)
    ccall((:ts_node_has_changes, libtreesitter), Bool, (TSNode,), arg1)
end

function ts_node_has_error(arg1)
    ccall((:ts_node_has_error, libtreesitter), Bool, (TSNode,), arg1)
end

function ts_node_parent(arg1)
    ccall((:ts_node_parent, libtreesitter), TSNode, (TSNode,), arg1)
end

function ts_node_child(arg1, arg2)
    ccall((:ts_node_child, libtreesitter), TSNode, (TSNode, UInt32), arg1, arg2)
end

function ts_node_child_count(arg1)
    ccall((:ts_node_child_count, libtreesitter), UInt32, (TSNode,), arg1)
end

function ts_node_named_child(arg1, arg2)
    ccall(
        (:ts_node_named_child, libtreesitter),
        TSNode,
        (TSNode, UInt32),
        arg1,
        arg2,
    )
end

function ts_node_named_child_count(arg1)
    ccall((:ts_node_named_child_count, libtreesitter), UInt32, (TSNode,), arg1)
end

function ts_node_child_by_field_name(self, field_name, field_name_length)
    ccall(
        (:ts_node_child_by_field_name, libtreesitter),
        TSNode,
        (TSNode, Cstring, UInt32),
        self,
        field_name,
        field_name_length,
    )
end

function ts_node_child_by_field_id(arg1, arg2)
    ccall(
        (:ts_node_child_by_field_id, libtreesitter),
        TSNode,
        (TSNode, TSFieldId),
        arg1,
        arg2,
    )
end

function ts_node_next_sibling(arg1)
    ccall((:ts_node_next_sibling, libtreesitter), TSNode, (TSNode,), arg1)
end

function ts_node_prev_sibling(arg1)
    ccall((:ts_node_prev_sibling, libtreesitter), TSNode, (TSNode,), arg1)
end

function ts_node_next_named_sibling(arg1)
    ccall((:ts_node_next_named_sibling, libtreesitter), TSNode, (TSNode,), arg1)
end

function ts_node_prev_named_sibling(arg1)
    ccall((:ts_node_prev_named_sibling, libtreesitter), TSNode, (TSNode,), arg1)
end

function ts_node_first_child_for_byte(arg1, arg2)
    ccall(
        (:ts_node_first_child_for_byte, libtreesitter),
        TSNode,
        (TSNode, UInt32),
        arg1,
        arg2,
    )
end

function ts_node_first_named_child_for_byte(arg1, arg2)
    ccall(
        (:ts_node_first_named_child_for_byte, libtreesitter),
        TSNode,
        (TSNode, UInt32),
        arg1,
        arg2,
    )
end

function ts_node_descendant_for_byte_range(arg1, arg2, arg3)
    ccall(
        (:ts_node_descendant_for_byte_range, libtreesitter),
        TSNode,
        (TSNode, UInt32, UInt32),
        arg1,
        arg2,
        arg3,
    )
end

function ts_node_descendant_for_point_range(arg1, arg2, arg3)
    ccall(
        (:ts_node_descendant_for_point_range, libtreesitter),
        TSNode,
        (TSNode, TSPoint, TSPoint),
        arg1,
        arg2,
        arg3,
    )
end

function ts_node_named_descendant_for_byte_range(arg1, arg2, arg3)
    ccall(
        (:ts_node_named_descendant_for_byte_range, libtreesitter),
        TSNode,
        (TSNode, UInt32, UInt32),
        arg1,
        arg2,
        arg3,
    )
end

function ts_node_named_descendant_for_point_range(arg1, arg2, arg3)
    ccall(
        (:ts_node_named_descendant_for_point_range, libtreesitter),
        TSNode,
        (TSNode, TSPoint, TSPoint),
        arg1,
        arg2,
        arg3,
    )
end

function ts_node_edit(arg1, arg2)
    ccall(
        (:ts_node_edit, libtreesitter),
        Cvoid,
        (Ptr{TSNode}, Ptr{TSInputEdit}),
        arg1,
        arg2,
    )
end

function ts_node_eq(arg1, arg2)
    ccall((:ts_node_eq, libtreesitter), Bool, (TSNode, TSNode), arg1, arg2)
end

function ts_tree_cursor_new(arg1)
    ccall((:ts_tree_cursor_new, libtreesitter), TSTreeCursor, (TSNode,), arg1)
end

function ts_tree_cursor_delete(arg1)
    ccall(
        (:ts_tree_cursor_delete, libtreesitter),
        Cvoid,
        (Ptr{TSTreeCursor},),
        arg1,
    )
end

function ts_tree_cursor_reset(arg1, arg2)
    ccall(
        (:ts_tree_cursor_reset, libtreesitter),
        Cvoid,
        (Ptr{TSTreeCursor}, TSNode),
        arg1,
        arg2,
    )
end

function ts_tree_cursor_current_node(arg1)
    ccall(
        (:ts_tree_cursor_current_node, libtreesitter),
        TSNode,
        (Ptr{TSTreeCursor},),
        arg1,
    )
end

function ts_tree_cursor_current_field_name(arg1)
    ccall(
        (:ts_tree_cursor_current_field_name, libtreesitter),
        Cstring,
        (Ptr{TSTreeCursor},),
        arg1,
    )
end

function ts_tree_cursor_current_field_id(arg1)
    ccall(
        (:ts_tree_cursor_current_field_id, libtreesitter),
        TSFieldId,
        (Ptr{TSTreeCursor},),
        arg1,
    )
end

function ts_tree_cursor_goto_parent(arg1)
    ccall(
        (:ts_tree_cursor_goto_parent, libtreesitter),
        Bool,
        (Ptr{TSTreeCursor},),
        arg1,
    )
end

function ts_tree_cursor_goto_next_sibling(arg1)
    ccall(
        (:ts_tree_cursor_goto_next_sibling, libtreesitter),
        Bool,
        (Ptr{TSTreeCursor},),
        arg1,
    )
end

function ts_tree_cursor_goto_first_child(arg1)
    ccall(
        (:ts_tree_cursor_goto_first_child, libtreesitter),
        Bool,
        (Ptr{TSTreeCursor},),
        arg1,
    )
end

function ts_tree_cursor_goto_first_child_for_byte(arg1, arg2)
    ccall(
        (:ts_tree_cursor_goto_first_child_for_byte, libtreesitter),
        Int64,
        (Ptr{TSTreeCursor}, UInt32),
        arg1,
        arg2,
    )
end

function ts_tree_cursor_copy(arg1)
    ccall(
        (:ts_tree_cursor_copy, libtreesitter),
        TSTreeCursor,
        (Ptr{TSTreeCursor},),
        arg1,
    )
end

function ts_query_new(language, source, source_len, error_offset, error_type)
    ccall(
        (:ts_query_new, libtreesitter),
        Ptr{TSQuery},
        (Ptr{TSLanguage}, Cstring, UInt32, Ptr{UInt32}, Ptr{TSQueryError}),
        language,
        source,
        source_len,
        error_offset,
        error_type,
    )
end

function ts_query_delete(arg1)
    ccall((:ts_query_delete, libtreesitter), Cvoid, (Ptr{TSQuery},), arg1)
end

function ts_query_pattern_count(arg1)
    ccall(
        (:ts_query_pattern_count, libtreesitter),
        UInt32,
        (Ptr{TSQuery},),
        arg1,
    )
end

function ts_query_capture_count(arg1)
    ccall(
        (:ts_query_capture_count, libtreesitter),
        UInt32,
        (Ptr{TSQuery},),
        arg1,
    )
end

function ts_query_string_count(arg1)
    ccall(
        (:ts_query_string_count, libtreesitter),
        UInt32,
        (Ptr{TSQuery},),
        arg1,
    )
end

function ts_query_start_byte_for_pattern(arg1, arg2)
    ccall(
        (:ts_query_start_byte_for_pattern, libtreesitter),
        UInt32,
        (Ptr{TSQuery}, UInt32),
        arg1,
        arg2,
    )
end

function ts_query_predicates_for_pattern(self, pattern_index, length)
    ccall(
        (:ts_query_predicates_for_pattern, libtreesitter),
        Ptr{TSQueryPredicateStep},
        (Ptr{TSQuery}, UInt32, Ptr{UInt32}),
        self,
        pattern_index,
        length,
    )
end

function ts_query_capture_name_for_id(arg1, id, length)
    ccall(
        (:ts_query_capture_name_for_id, libtreesitter),
        Cstring,
        (Ptr{TSQuery}, UInt32, Ptr{UInt32}),
        arg1,
        id,
        length,
    )
end

function ts_query_string_value_for_id(arg1, id, length)
    ccall(
        (:ts_query_string_value_for_id, libtreesitter),
        Cstring,
        (Ptr{TSQuery}, UInt32, Ptr{UInt32}),
        arg1,
        id,
        length,
    )
end

function ts_query_disable_capture(arg1, arg2, arg3)
    ccall(
        (:ts_query_disable_capture, libtreesitter),
        Cvoid,
        (Ptr{TSQuery}, Cstring, UInt32),
        arg1,
        arg2,
        arg3,
    )
end

function ts_query_disable_pattern(arg1, arg2)
    ccall(
        (:ts_query_disable_pattern, libtreesitter),
        Cvoid,
        (Ptr{TSQuery}, UInt32),
        arg1,
        arg2,
    )
end

function ts_query_cursor_new()
    ccall((:ts_query_cursor_new, libtreesitter), Ptr{TSQueryCursor}, ())
end

function ts_query_cursor_delete(arg1)
    ccall(
        (:ts_query_cursor_delete, libtreesitter),
        Cvoid,
        (Ptr{TSQueryCursor},),
        arg1,
    )
end

function ts_query_cursor_exec(arg1, arg2, arg3)
    ccall(
        (:ts_query_cursor_exec, libtreesitter),
        Cvoid,
        (Ptr{TSQueryCursor}, Ptr{TSQuery}, TSNode),
        arg1,
        arg2,
        arg3,
    )
end

function ts_query_cursor_set_byte_range(arg1, arg2, arg3)
    ccall(
        (:ts_query_cursor_set_byte_range, libtreesitter),
        Cvoid,
        (Ptr{TSQueryCursor}, UInt32, UInt32),
        arg1,
        arg2,
        arg3,
    )
end

function ts_query_cursor_set_point_range(arg1, arg2, arg3)
    ccall(
        (:ts_query_cursor_set_point_range, libtreesitter),
        Cvoid,
        (Ptr{TSQueryCursor}, TSPoint, TSPoint),
        arg1,
        arg2,
        arg3,
    )
end

function ts_query_cursor_next_match(arg1, match)
    ccall(
        (:ts_query_cursor_next_match, libtreesitter),
        Bool,
        (Ptr{TSQueryCursor}, Ptr{TSQueryMatch}),
        arg1,
        match,
    )
end

function ts_query_cursor_remove_match(arg1, id)
    ccall(
        (:ts_query_cursor_remove_match, libtreesitter),
        Cvoid,
        (Ptr{TSQueryCursor}, UInt32),
        arg1,
        id,
    )
end

function ts_query_cursor_next_capture(arg1, match, capture_index)
    ccall(
        (:ts_query_cursor_next_capture, libtreesitter),
        Bool,
        (Ptr{TSQueryCursor}, Ptr{TSQueryMatch}, Ptr{UInt32}),
        arg1,
        match,
        capture_index,
    )
end

function ts_language_symbol_count(arg1)
    ccall(
        (:ts_language_symbol_count, libtreesitter),
        UInt32,
        (Ptr{TSLanguage},),
        arg1,
    )
end

function ts_language_symbol_name(arg1, arg2)
    ccall(
        (:ts_language_symbol_name, libtreesitter),
        Cstring,
        (Ptr{TSLanguage}, TSSymbol),
        arg1,
        arg2,
    )
end

function ts_language_symbol_for_name(self, string, length, is_named)
    ccall(
        (:ts_language_symbol_for_name, libtreesitter),
        TSSymbol,
        (Ptr{TSLanguage}, Cstring, UInt32, Bool),
        self,
        string,
        length,
        is_named,
    )
end

function ts_language_field_count(arg1)
    ccall(
        (:ts_language_field_count, libtreesitter),
        UInt32,
        (Ptr{TSLanguage},),
        arg1,
    )
end

function ts_language_field_name_for_id(arg1, arg2)
    ccall(
        (:ts_language_field_name_for_id, libtreesitter),
        Cstring,
        (Ptr{TSLanguage}, TSFieldId),
        arg1,
        arg2,
    )
end

function ts_language_field_id_for_name(arg1, arg2, arg3)
    ccall(
        (:ts_language_field_id_for_name, libtreesitter),
        TSFieldId,
        (Ptr{TSLanguage}, Cstring, UInt32),
        arg1,
        arg2,
        arg3,
    )
end

function ts_language_symbol_type(arg1, arg2)
    ccall(
        (:ts_language_symbol_type, libtreesitter),
        TSSymbolType,
        (Ptr{TSLanguage}, TSSymbol),
        arg1,
        arg2,
    )
end

function ts_language_version(arg1)
    ccall(
        (:ts_language_version, libtreesitter),
        UInt32,
        (Ptr{TSLanguage},),
        arg1,
    )
end
