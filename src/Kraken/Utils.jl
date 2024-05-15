# Kraken/Utils

function Serde.deser(::Type{<:KrakenData}, ::Type{<:Maybe{NanoDate}}, x::Int64)::NanoDate
    return unixnanos2nanodate(x * 1e9)
end

function Serde.deser(::Type{<:KrakenData}, ::Type{<:Maybe{NanoDate}}, x::AbstractString)::NanoDate
    return NanoDate(DateTime(x, "yyyy-mm-ddTHH:MM:SS.ssszzzz"))
end

# function Serde.deser(
#     ::Type{A},
#     ::Type{T},
#     x::String,
# )::NanoDate where {A<:AbstractResult,T<:Maybe{Date}}
#     return NanoDate(x)
# end

function Serde.ser_ignore_field(::Type{<:KrakenCommonQuery}, ::Val{:signature})::Bool
    return true
end

function Serde.SerQuery.ser_type(::Type{<:KrakenCommonQuery}, dt::D)::Int64 where {D<:DateTime}
    return round(Int64, 1000 * datetime2unix(dt))
end
