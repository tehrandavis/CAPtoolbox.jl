using CSV, DataFrames, CAPtoolbox, Plots, StatsBase

df = CSV.read("/Users/tehrandavis/Desktop/jointFittsTask/data/processed_marker_data/Pair_201_trial_1.csv")

ts1 = Vector(df.p1handZ)
ts2 = Vector(df.p2handZ)

# unit normalization
dt = StatsBase.fit(UnitRangeTransform, ts; dims=1, unit=true)

StatsBase.transform!(dt, ts1)
StatsBase.transform!(dt, ts2)


CAPtoolbox.Synchrony.maxima(ts,30)

Plots.plot(ts)
