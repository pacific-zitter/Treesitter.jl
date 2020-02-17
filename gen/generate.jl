using Clang

function cursor_wrapped(decl)
    header = filename(decl)
    (header |> splitdir |> last) == "api.h" || return false
    true
end

ctx = init(
    headers = [joinpath(dirname(@__DIR__), "deps", "include", "api.h")],
    output_file = joinpath(dirname(@__DIR__), "api.jl"),
    common_file = "common.jl",
    header_wrapped = (root, current) -> root == current,
    header_library = (x...) -> "libtreesitter",
    clang_args = ["-std=gnu99"],
    clang_includes = [CLANG_INCLUDE],
)

run(ctx, false)
