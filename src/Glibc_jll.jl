# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule Glibc_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("Glibc")
JLLWrappers.@generate_main_file("Glibc", UUID("452aa2e7-e185-58db-8ff9-d3c1fa4bc997"))
end  # module Glibc_jll
