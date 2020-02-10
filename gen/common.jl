# Automatically generated using Clang.jl
const TREE_SITTER_LANGUAGE_VERSION = 11
const TREE_SITTER_MIN_COMPATIBLE_LANGUAGE_VERSION = 9
const TSSymbol = UInt16
const TSFieldId = UInt16
const TSLanguage = Cvoid
const TSParser = Cvoid
const TSTree = Cvoid
const TSQuery = Cvoid
const TSQueryCursor = Cvoid

@cenum TSInputEncoding::UInt32 begin
    TSInputEncodingUTF8 = 0
    TSInputEncodingUTF16 = 1
end

@cenum TSSymbolType::UInt32 begin
    TSSymbolTypeRegular = 0
    TSSymbolTypeAnonymous = 1
    TSSymbolTypeAuxiliary = 2
end


struct TSPoint
    row::UInt32
    column::UInt32
end

struct TSRange
    start_point::TSPoint
    end_point::TSPoint
    start_byte::UInt32
    end_byte::UInt32
end

struct TSInput
    payload::Ptr{Cvoid}
    read::Ptr{Cvoid}
    encoding::TSInputEncoding
end

@cenum TSLogType::UInt32 begin
    TSLogTypeParse = 0
    TSLogTypeLex = 1
end


struct TSLogger
    payload::Ptr{Cvoid}
    log::Ptr{Cvoid}
end

struct TSInputEdit
    start_byte::UInt32
    old_end_byte::UInt32
    new_end_byte::UInt32
    start_point::TSPoint
    old_end_point::TSPoint
    new_end_point::TSPoint
end

struct TSNode
    context::NTuple{4, UInt32}
    id::Ptr{Cvoid}
    tree::Ptr{TSTree}
end

struct TSTreeCursor
    tree::Ptr{Cvoid}
    id::Ptr{Cvoid}
    context::NTuple{2, UInt32}
end

struct TSQueryCapture
    node::TSNode
    index::UInt32
end

struct TSQueryMatch
    id::UInt32
    pattern_index::UInt16
    capture_count::UInt16
    captures::Ptr{TSQueryCapture}
end

@cenum TSQueryPredicateStepType::UInt32 begin
    TSQueryPredicateStepTypeDone = 0
    TSQueryPredicateStepTypeCapture = 1
    TSQueryPredicateStepTypeString = 2
end


struct TSQueryPredicateStep
    type::TSQueryPredicateStepType
    value_id::UInt32
end

@cenum TSQueryError::UInt32 begin
    TSQueryErrorNone = 0
    TSQueryErrorSyntax = 1
    TSQueryErrorNodeType = 2
    TSQueryErrorField = 3
    TSQueryErrorCapture = 4
end
