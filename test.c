#include <assert.h>
#include <stdio.h>

extern int func_sum(int x, int y);
extern int func_sub(int x, int y);
extern int func_mul(int x, int y);
extern int func_div(int x, int y);
extern void sub_dump_stack(int x, int y, int z);

void test(int a, int b) {
    printf("Esperado %i obtido %i\n", b, a);
    assert(a == b);
}

int main() {
    test(func_sum(2, 3), 5);
    test(func_sub(2, 3), -1);
    test(func_mul(2, 3), 6);
    test(func_div(4, 2), 2);
}
