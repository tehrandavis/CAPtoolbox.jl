# Get continuous relative phase using Hilbert transform

Pkg.add("DSP")
using CSV, DSP, Hilbert


df = CSV.read("/Users/tehrandavis/Desktop/jointFittsTask/data/processed_marker_data/Pair_201_trial_1.csv")

# note that if timeseries is extracted from a CSV.dataframe you need to reshape:
ts1 = begin
    x = reshape(Vector(df.p1handZ), length(Vector(df.p1handZ)), 1)
    abs.(x)
end

ts2 = begin
    x = reshape(Vector(df.p2handZ), length(Vector(df.p2handZ)), 1)
    abs.(x)
end



# filter data using 2nd order low-pass filter

sampling_rate = 188
filter_order=2
filter_cutoff_freq=10
nyquist=sampling_rate/2
critical_freq=filter_cutoff_freq/nyquist
bf=butter(filter.order, critical.freq,type = "low")

# analogfilter(responsetype, designmethod)

# create filter:
responsetype = Lowpass(10;fs=sampling_rate)
designmethod = Butterworth(2)

ff = analogfilter(responsetype,designmethod)

butter = SecondOrderSections(ff)

ts1 = filtfilt(butter, ts1)
ts2 = filtfilt(butter, ts2)
