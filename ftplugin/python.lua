local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local extras = require("luasnip.extras")
-- local l = extras.lambda
-- local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet
-- local k = require("luasnip.nodes.key_indexer").new_key

--- @param args table idk i didnt write this
local function copy(args)
    return args[1]
end

local function def()
    return fmt([[def {}(
    {}: {},
) -> {}:
    """
    {}
    ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    Arguments:
        {}: {}
    ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    Returns:
        output: {}
    """
    {}
    output: {} = None
    return {}

]],
        {
            i(1, 'fname'),
            i(2, 'arg'),
            i(3, 'type'),
            i(4, 'None'),
            i(0, 'Documentation'),
            f(copy, 2),
            f(copy, 3),
            f(copy, 4),
            i(5, '# body'),
            f(copy, 4),
            i(6, 'output')
        }
    )
end

local function meth()
    return fmt([[def {}(
    self,
    {}: {},
) -> {}:
    """
    {}
    ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    Arguments:
        {}: {}
    ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    Returns:
        output: {}
    """
    {}
    output: {} = None
    return {}

]],
        {
            i(1, 'fname'),
            i(2, 'arg'),
            i(3, 'type'),
            i(4, 'None'),
            i(0, 'Documentation'),
            f(copy, 2),
            f(copy, 3),
            f(copy, 4),
            i(5, '# body'),
            f(copy, 4),
            i(6, 'output')
        }
    )
end

local function wrappedFn()
    return fmt([[@{}
def {}(
    {}: {},
) -> {}:
    """
    {}
    ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    Arguments:
        {}: {}
    ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    Returns:
        output: {}
    """
    {}
    output: {} = None
    return {}

]],
        {
            i(1, 'wrapper'),
            i(2, 'fname'),
            i(3, 'arg'),
            i(4, 'type'),
            i(5, 'None'),
            i(0, 'Documentation'),
            f(copy, 2),
            f(copy, 3),
            f(copy, 4),
            i(6, '# body'),
            f(copy, 4),
            i(7, 'output')
        }
    )
end

local function wrappedMethod()
    return fmt([[@{}
def {}(
    self,
    {}: {},
) -> {}:
    """
    {}
    ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    Arguments:
        {}: {}
    ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    Returns:
        output: {}
    """
    {}
    output: {} = None
    return {}

]],
        {
            i(1, 'wrapper'),
            i(2, 'fname'),
            i(3, 'arg'),
            i(4, 'type'),
            i(5, 'None'),
            i(0, 'Documentation'),
            f(copy, 2),
            f(copy, 3),
            f(copy, 4),
            i(6, '# body'),
            f(copy, 4),
            i(7, 'output')
        }
    )
end

ls.add_snippets(
    'python', {
        -- General function format
        s('def', def()),
        s('fn', def()),
        s('func', def()),
        s('function', def()),
        s('method', meth()),
        s('mthd', meth()),
        s('mth', meth()),
        s('meth', meth()),
        s('wfn', wrappedFn()),
        s('wrp', wrappedFn()),
        s('wmth', wrappedMethod()),
        s('wmeth', wrappedMethod()),
    }
)

