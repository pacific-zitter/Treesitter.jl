using Treesitter
using Test
language = ccall((:tree_sitter_c,Treesitter.libtreesitter_c), Ptr{Cvoid},())

parser = Treesitter.Parser()
Treesitter.set_language(parser, language)
source_code = read(joinpath(@__DIR__,"rationals.h"),String)



@testset "Treesitter.jl" begin
    # Write your own tests here.
end
