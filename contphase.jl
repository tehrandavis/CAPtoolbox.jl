# hilbertphase

using DSP, StatsBase

using CSV, DataFrames, CAPtoolbox, Plots, StatsBase
df = CSV.read("/Users/tehrandavis/Desktop/jointFittsTask/data/processed_marker_data/Pair_201_trial_5.csv")

ts1 = abs.(Vector(df.p1handZ))
ts2 = abs.(Vector(df.p2handZ))

# unit normalization
dt1 = StatsBase.fit(UnitRangeTransform, ts1; dims=1, unit=true)
dt2 = StatsBase.fit(UnitRangeTransform, ts2; dims=1, unit=true)
StatsBase.transform!(dt1, ts1)
StatsBase.transform!(dt2, ts2)

# filtering


circleStats, tsRP = ContinuousRP(ts1,ts2,"inphase")
