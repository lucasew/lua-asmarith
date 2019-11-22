#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

extern int func_sum(int x, int y);
extern int func_sub(int x, int y);
extern int func_mul(int x, int y);
extern int func_div(int x, int y);
extern void sub_dump_stack(int x, int y, int z);


int d2i(double d) {
    return d;
}

double i2d(int i) {
    return i;
}


/**
 * A função ficará assim
static int l_sum(lua_State *L) {
    int x = d2i(luaL_checknumber(L, 1));
    int y = d2i(luaL_checknumber(L, 2));
    int ret = func_sum(x, y);
    lua_pushnumber(L, ret);
    return 1;
}

*/

#define gen_func(func) \
    static int l_##func(lua_State *L) { \
        int x = d2i(luaL_checknumber(L, 1)); \
        int y = d2i(luaL_checknumber(L, 2)); \
        int ret = func_##func(x, y); \
        lua_pushnumber(L, ret); \
        return 1; \
    } \

gen_func(sum);
gen_func(sub);
gen_func(mul);
gen_func(div);

static const struct luaL_Reg libarith [] = {
    {"sum", l_sum},
    {"sub", l_sub},
    {"mul", l_mul},
    {"div", l_div},
    {NULL, NULL}
};

int luaopen_arith(lua_State *L) {
    luaL_newlib(L, libarith);
    return 1;
}

