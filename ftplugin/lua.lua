-- Opitons
vim.opt_local.shiftwidth = 4

-- Snippets
-- snip.parser.parse_snippet(<text>, <vscode style>)
-- $1 is the first jump $2 ... $0 is the last
-- Add your own newlines
-- Watch TJ for a better way to do this using lua instead of the pre made functions
-- https://www.youtube.com/watch?v=Dn800rlPIho&t=589s
-- Use "source %" for recompiling this file and using the snippets within the local nvim instance
-- template
        -- s('',
        --     fmt('',
        --         {
        --         }
        --     )
        -- ),

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

local function docFunc()
    return fmt("-- {}\n--- @param {} {} {}\n--- @return {} {} {}\nlocal function {}({})\n\t{}\n\treturn {}\nend\n",
        {
            i(4, 'Notes'),
            f(copy, 2),
            i(5, 'type'),
            i(6, 'desc'),
            i(7, 'type'),
            f(copy, 3),
            i(8, 'info'),
            i(1, 'fname'),
            i(2, 'arg'),
            i(0, '-- body'),
            i(3, 'nil'),
        }
    )
end

local function defaultFunc()
    return fmt("local function {}({})\n\t{}\n\treturn {}\nend\n",
        {
            i(1, 'fname'),
            i(2, 'arg'),
            i(0, '-- body'),
            i(3, 'nil')
        }
    )
end

ls.add_snippets(
    'lua', {
        -- General function format
        -- lf local function
        s('lf', docFunc()),
        s('fn', docFunc()),
        s('func', docFunc()),
        s('function', docFunc()),
        s('nlf', defaultFunc()),
        s('nfn', defaultFunc()),
        -- Love snippets
        s('load',
            fmt('',
                {
                }
            )
        ),
        s('update',
            fmt('',
                {
                }
            )
        ),
        s('draw',
            fmt('',
                {
                }
            )
        ),
        s('graphics',
            fmt('',
                {
                }
            )
        )
    }
)

