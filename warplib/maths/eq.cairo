from starkware.cairo.common.uint256 import Uint256, uint256_eq

func warp_eq(lhs : felt, rhs : felt) -> (result : felt):
    if lhs == rhs:
        return (1)
    else:
        return (0)
    end
end

func warp_eq256{range_check_ptr}(lhs : Uint256, rhs : Uint256) -> (res : felt):
    return uint256_eq(lhs, rhs)
end
