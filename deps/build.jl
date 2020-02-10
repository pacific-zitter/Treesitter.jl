# Note that this script can accept some limited command-line arguments, run
# `julia build_tarballs.jl --help` to see a usage message.
using BinaryBuilder

name = "libtreesitter"
version = v"0.16.4"

# Collection of sources required to complete build
sources = [
    "https://github.com/tree-sitter/tree-sitter.git" =>
    "f049ba350f3f6019ce9a1cbb0975ebd154ef7ad3",
]

# Bash recipe for building across all platforms
script = raw"""
cd $WORKSPACE/srcdir
cd tree-sitter/
echo 'cmake_minimum_required(VERSION 3.13)
project(treesitter)
set(CMAKE_C_STANDARD 99)

include_directories(lib/include lib/src)

add_library(treesitter SHARED lib/src/lib.c)


install(TARGETS treesitter DESTINATION lib CONFIGURATIONS Release)
' > CMakeLists.txt

BUILD_FLAGS=(-DCMAKE_BUILD_TYPE=Release
-DCRYPTO_BACKEND=mbedTLS
-DBUILD_SHARED_LIBS=ON
-DBUILD_EXAMPLES=OFF
-DBUILD_TESTING=OFF
-DENABLE_ZLIB_COMPRESSION=OFF
"-DCMAKE_INSTALL_PREFIX=${prefix}"
"-DCMAKE_TOOLCHAIN_FILE="${CMAKE_TARGET_TOOLCHAIN}""
 )
mkdir build
cd build
cmake .. "${BUILD_FLAGS[@]}"
make -j${nproc}
make install
"""

# These are the platforms we will build for by default, unless further
# platforms are passed in on the command line
platforms = [
    Linux(:i686, libc=:glibc),
    Linux(:x86_64, libc=:glibc),
    Linux(:aarch64, libc=:glibc),
    Linux(:armv7l, libc=:glibc, call_abi=:eabihf),
    Linux(:powerpc64le, libc=:glibc),
    Linux(:i686, libc=:musl),
    Linux(:x86_64, libc=:musl),
    Linux(:aarch64, libc=:musl),
    Linux(:armv7l, libc=:musl, call_abi=:eabihf)
]


# The products that we will ensure are always built
products = [
    LibraryProduct("libtreesitter", :libtreesitter)
]

# Dependencies that must be installed before this package can be built
dependencies = [

]

# Build the tarballs, and possibly a `build.jl` as well.
build_tarballs(ARGS, name, version, sources, script, platforms, products, dependencies)
