# debug.jl
#=
Functions for printing and inspecting tree-sitter objects.
=#
function Base.show(io::IO, ::MIME"application/prs.juno.inline", pt::TSPoint)
    show(io, (row = Int(pt.row), col = Int(pt.column)))
end

function Base.show(io::IO, ::MIME"text/plain", node::TSNode)
    loc = NodeLocation(node)
    printstyled(io, node_type(node), bold = true, color = :cyan)
    println(io, " ", node_string(node))
end

"""
    parse_corpus(args)
    in | filename
    out | {testcode::String, expected_sexpr}
"""
#TODO: documentation
const corpus_name = joinpath(dirname(@__DIR__), "test/corpus/preprocessor.txt")

function parse_corpus(corpus_name)
    corpus = readlines(corpus_name, keep = true)

    equalslocs = map(x -> occursin(r"\={4,}", x), corpus) |> findall
    dash_locs = map(x -> occursin(r"\-{3,}", x), corpus) |> findall

    # odd numbered lines contain the opening line of '='.
    test_names = equalslocs[1:2:end] .+ 1 .|> i -> getindex(crp, i)

    code_starts = equalslocs[2:2:end] .+ 1
    code_stops = dash_locs .- 1
    code_strings = String[]
    for (cstart, cstop) in zip(code_starts, code_stops)
        push!(code_strings, join(corpus[cstart:cstop]))
    end

    exp_startloc = dash_locs .+ 1
    exp_stoploc = vcat(equalslocs[3:2:end], lastindex(corpus)) # last s-expr stops at end of file.
    expected_sexprs = String[]
    for (sstart, sstop) in zip(exp_startloc, exp_stoploc)
        push!(expected_sexprs, join(corpus[sstart:sstop]))
    end

    return test_names, code_strings, expected_sexprs
end

tnames, codestrings, expected = parse_corpus(corpus_name)
