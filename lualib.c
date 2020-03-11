#include <lua5.3/lua.h>
#include <lua5.3/lualib.h>
#include <lua5.3/lauxlib.h>

extern int func_sum(int x, int y);
extern int func_sub(int x, int y);
extern int func_mul(int x, int y);
extern int func_div(int x, int y);
extern void sub_dump_stack(int x, int y, int z);

/**
 * @brief  Transforma um número double em int
 * @param  d: Valor double a ser convertido
 * @retval Valor int convertido
 */
int d2i(double d) {
    return d;
}

/**
 * @brief  Transforma um número inteiro em double
 * @param  i: Valor int a ser convertido
 * @retval Valor double convertido
 */
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

/// Cria a função encapsulando a função nativa em assembly para uma função compatível com lua
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

/// Declara a estrutura de dados do que será exportado para o Lua
static const struct luaL_Reg libarith [] = {
    {"sum", l_sum},
    {"sub", l_sub},
    {"mul", l_mul},
    {"div", l_div},
    {NULL, NULL}
};

/**
 * @brief  Função chamada pelo interpretador para carregar a biblioteca
 * @param  *L:  Contexto lua
 * @retval  1 -> número de estruturas adicionadas na pilha do Lua
 */
int luaopen_arith(lua_State *L) {
    luaL_newlib(L, libarith);
    return 1;
}

