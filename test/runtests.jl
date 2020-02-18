using Treesitter
# using Test

parser = Treesitter.Parser()
Treesitter.set_language(parser, tree_sitter_c())
source_code = read(joinpath(@__DIR__, "c_samples/easystruct.h"), String)

tree = parse_string(parser, source_code)
rootnode = node_rootof(tree)

Base.show(io::IO, ::MIME"text/plain", node::TSNode) =
    println(io, node_type(node), Int.(node.context))

Base.show(io::IO, ::MIME"application/prs.juno.inline", pt::TSPoint) =
    show(io, (row = Int(pt.row), col = Int(pt.column)))

srtpt = node_startpoint(rootnode)
endpt = node_endpoint(rootnode)
