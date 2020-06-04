module CAPtoolbox

using DataFrames
using Dates
using Statistics
using CSV
using GLM
using LsqFit
using DSP

include("multifractal_tools/_multifractal_tools.jl")
include("data_management/_data_management_tools.jl")
include("synchrony_tools/_synchrony_tools.jl")

end # module
