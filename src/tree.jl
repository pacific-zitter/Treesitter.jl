mutable struct Tree
    ptr::Ptr{TSTree}
    root_node::TSNode
    language::Ptr{TSLanguage}
    Tree() = new()
end

getroot(🌲::Tree) = 🌲.root_node
getlanguage(🌲::Tree) = 🌲.language
