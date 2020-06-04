module CAPtoolbox

using DataFrames
using Dates
using Statistics
using CSV
using GLM
using LsqFit
using DSP

include("multifractal_toolbox/multifractal_tools.jl")
include("data_management/data_management_tools.jl")
include("synchrony_toolbox/synchrony_tools.jl")

end # module
