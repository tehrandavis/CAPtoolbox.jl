using DSP, Plots, StatsBase

function ContinuousRP(ts1, ts2, phaseMode)

    # center the data
    ts1 = ts1 .- mean(ts1)
    ts2 = ts2 .- mean(ts2)

    # hilbert transform
    h1 = DSP.hilbert(ts1) |> imag
    h2 = DSP.hilbert(ts2) |> imag
    num = h2.*ts1 - ts2.*h1
    denom = ts2.*ts1 + h2.*h1

    # time series of CRP in radians
    radians = atan.(num./denom)

    # convert to degrees
    pRP = rad2deg.(radians)

    # plot
    Plots.plot(pRP)

    # circular stats
    wgh = ones(size(radians))
    wr = wgh'*exp.(im*radians)
    meanRP = angle(wr)
    rvRP = abs(wr)/sum(wgh)
    sdRP = sqrt(2*(1-rvRP))

    DataFrame(meanRP, rvRP, sdRP)

end
