# Autogenerated wrapper script for Glibc_jll for x86_64-linux-gnu
export libpthread, libld, libc, libm, librt

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libpthread`
const libpthread_splitpath = ["lib64", "libpthread.so.0"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libpthread_path = ""

# libpthread-specific global declaration
# This will be filled out by __init__()
libpthread_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libpthread = "libpthread.so.0"


# Relative path to `libld`
const libld_splitpath = ["lib64", "libdl.so.2"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libld_path = ""

# libld-specific global declaration
# This will be filled out by __init__()
libld_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libld = "libdl.so.2"


# Relative path to `libc`
const libc_splitpath = ["lib64", "libc.so.6"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libc_path = ""

# libc-specific global declaration
# This will be filled out by __init__()
libc_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libc = "libc.so.6"


# Relative path to `libm`
const libm_splitpath = ["lib64", "libm.so.6"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libm_path = ""

# libm-specific global declaration
# This will be filled out by __init__()
libm_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libm = "libm.so.6"


# Relative path to `librt`
const librt_splitpath = ["lib64", "librt.so.1"]

# This will be filled out by __init__() for all products, as it must be done at runtime
librt_path = ""

# librt-specific global declaration
# This will be filled out by __init__()
librt_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const librt = "librt.so.1"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    global libpthread_path = abspath(joinpath(artifact"Glibc", libpthread_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libpthread_handle = dlopen(libpthread_path)
    push!(LIBPATH_list, dirname(libpthread_path))

    global libld_path = abspath(joinpath(artifact"Glibc", libld_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libld_handle = dlopen(libld_path)
    push!(LIBPATH_list, dirname(libld_path))

    global libc_path = abspath(joinpath(artifact"Glibc", libc_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libc_handle = dlopen(libc_path)
    push!(LIBPATH_list, dirname(libc_path))

    global libm_path = abspath(joinpath(artifact"Glibc", libm_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libm_handle = dlopen(libm_path)
    push!(LIBPATH_list, dirname(libm_path))

    global librt_path = abspath(joinpath(artifact"Glibc", librt_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global librt_handle = dlopen(librt_path)
    push!(LIBPATH_list, dirname(librt_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

