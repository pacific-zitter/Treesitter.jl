# Treesitter.jl

This package provides Julia language wrappers of the tree-sitter language parser.  
The intention of this package is to provide a method for wrapping C headers for the
purpose of easier interoperability with those libraries. Currently, this is accomplished
with Clang.jl, but this method has some significant drawbacks.
