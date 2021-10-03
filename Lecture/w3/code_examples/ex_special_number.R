# Infinity
1 / 0 # positive infinity
-1 / 0 # negative infinity
Inf + 5 # operation on Inf
is.finite(1 / 0) # check if finite
is.infinite(1 / 0) # check if infinite

# Undefined
Inf / Inf # NaN (not a number)
is.nan(Inf/Inf) # Check if NaN

# Missing values
NA + 5 # operation on NA
is.na(NA) # check is NA

# NaN is NA, but NA is not NaN
is.na(NaN)
is.nan(NA)
