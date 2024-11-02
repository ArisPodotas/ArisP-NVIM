-- For the definition of the keybinds that move you through go to ./Lsp.lua
--
-- The follwing is where the innate snippets from friendly snippets is sotred you might want to change things from here
-- C:/Users/aPodo/AppData/Local/nvim-data/lazy/friendly-snippets/snippets

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

--- @param args table idk i didnt write this
local function copy(args)
	return args[1]
end

-- snip.parser.parse_snippet(<text>, <vscode style>)
-- $1 is the first jump $2 ... $0 is the last
-- Add your own newlines
-- Watch TJ for a better way to do this using lua instead of the pre made functions
-- https://www.youtube.com/watch?v=Dn800rlPIho&t=589s
-- Use "source %" for recompiling this file and using the snippets within the local nvim instance
--template
        -- s('',
        --     fmt('',
        --         {
        --         }
        --     )
        -- ),

ls.add_snippets(
    'lua', {
        -- General function format
        -- lf local function
        s('lf',
            fmt("-- {}\n--- @param {} {} {}\n--- @return {} {} {}\nlocal function {}({})\n\t{}\n\treturn {}\nend\n",
                {
                    i(1, 'Notes'),
                    i(2, 'arg'),
                    i(3, 'type'),
                    i(4, 'desc'),
                    i(5, 'type'),
                    i(6, '[name]'),
                    i(7, 'info'),
                    i(8, 'fname'),
                    f(copy, 1),
                    i(0, 'body'),
                    f(copy, 5)
                }
            )
        )
    }
)

-- Love snippets
ls.add_snippets(
    'lua', {
        --
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

ls.add_snippets(
    'python', {
        -- General function format
        s('def',
            fmt('def {}({}: {}) -> {}:\n\t"""{}"""\n\t{}\n\treturn {}\n',
                {
                    i(1, 'fname'),
                    i(2, 'arg'),
                    i(3, 'type'),
                    i(4, 'None'),
                    i(5, 'doc'),
                    i(0, '# body'),
                    f(copy, 4)
                }
            )
        ),
        s('method',
            fmt('def {}(self, {}: {}) -> {}:\n\t"""{}"""\n\t{}\n\treturn {}\n',
                {
                    i(1, 'fname'),
                    i(2, 'arg'),
                    i(3, 'type'),
                    i(4, 'None'),
                    i(5, 'doc'),
                    i(0, '# body'),
                    f(copy, 4)
                }
            )
        )
    }
)

ls.add_snippets(
    'css', {
    }
)
ls.add_snippets(
    'r', {
    }
)
ls.add_snippets(
    'c', {
    }
)
ls.add_snippets(
    'cpp', {
    }
)
ls.add_snippets(
    'html', {
    }
)
ls.add_snippets(
    'markdown', {
    }
)

ls.add_snippets(
    'perl', {
    }
)

