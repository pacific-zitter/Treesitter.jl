using Treesitter

parser = Parser()
set_language(parser, tree_sitter_c())

tree = Treesitter.parse_filewith(
    parser,
    joinpath(@__DIR__, "c_samples/easystruct.h"),
)
nstring = parser.buffer |> String
rtcrsr = tree_getroot(tree)

rchildren = node_namedchildren(rtcrsr)

rcstr = node_type.(rchildren)

h = node_text.(Ref(nstring), rchildren)

decl = rcstr .=> h

R1 = node_namedchildren.(rchildren)

𝑅 = [node_type.(r) for r in R1]
𝐻 = [node_text.(Ref(nstring), r) for r in R1]

𝑄 = 𝑅 .=> 𝐻
