# Huobi/Errors
# https://huobiapi.github.io/docs/spot/v1/en/

import ..CryptoAPIs: APIsResult, APIsUndefError
import ..CryptoAPIs: isretriable, retry_maxcount, retry_timeout

# UNDEF
isretriable(e::APIsResult{HuobiAPIError}) = true

# INVALID_PARAMETER
function isretriable(e::APIsResult{HuobiAPIError{Symbol("invalid-parameter")}})
    return e.result.err_msg == "request limit" ? true : false
end

# GATEWAY_INTERNAL_ERROR
isretriable(e::APIsResult{HuobiAPIError{Symbol("gateway-internal-error")}}) = true
retry_maxcount(e::APIsResult{HuobiAPIError{Symbol("gateway-internal-error")}}) = 20

# BAD_REQUEST
isretriable(e::APIsResult{HuobiAPIError{Symbol("bad-request")}}) = false
