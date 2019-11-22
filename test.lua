local arith = require 'arith'

function test(x, y)
    print("Esperado " .. y .. " recebido " .. x)
    assert(x == y)
end

test(arith.sum(2, 3), 5)
test(arith.sub(2, 3), -1)
test(arith.mul(2, 3), 6)
test(arith.div(4, 2), 2)
