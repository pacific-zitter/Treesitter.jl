using Treesitter

parser = Parser()
l = set_language(parser, tree_sitter_c())
tree = Treesitter.parse_filewith(
    parser,
    joinpath(@__DIR__, "c_samples/easystruct.h"),
)
rnode = tree_getroot(tree)

nodetype = node_type(rnode)
nodesym = node_symbol(rnode)
nbstart = node_startbyte(rnode)
nbstop = node_endbyte(rnode)

# Length of node text is equal to the number of bytes in the raw sourcecode.
slen = parser.buffer |> length
nlen = nbstop - nbstart |> Int
@assert slen == nlen

root_children = node_children(rnode)
@assert length(root_children) == 4

rchildrentype = node_type.(root_children)
rsymbol = node_symbol.(root_children)
rbstart = node_startbyte.(root_children)
rbstop = node_endbyte.(root_children)
rslen = rbstop .- rbstart

rnodestrings = node_string.(root_children)
rcisnull = node_isnull.(root_children)
rcisnamed = node_isnamed.(root_children)
rcisextra = node_isextra.(root_children)
