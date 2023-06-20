local ls = require("luasnip")

-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node
local extras = require("luasnip.extras")
local rep = extras.rep
local snippets, autosnippets = {}, {}
local fmt = require("luasnip.extras.fmt").fmt

local function create_snippet(trigger, nodes, opts)
    local snippet = snip(trigger, nodes)
    local target_table = snippets
    if opts ~= nil then
        if type(opts) == "string" and opts == "auto" then
            target_table = autosnippets
        end
    end
    table.insert(target_table, snippet)
end


-- \texttt{}
create_snippet(
    {
        trig = "tt",
        name = "texttt",
        dscr = "\\texttt{}",
    },
    fmt([[\texttt{<>}]],
        { insert(1, "text") },
        { delimiters = "<>" }
    )
)

-- \textt{} visual mode
create_snippet(
    {
        trig = 'ttv',
        name = 'texttt',
        dscr = '\\texttt'
    },
    fmt([[\texttt{<>}]],
        { func(function(args, snip)
            local res, env = {}, snip.env
            for _, val in ipairs(env.LS_SELECT_RAW) do table.insert(res, val) end
            return res
        end, {}) },
        { delimiters = '<>' }
    ), { condition = math, show_condition = math })

-- \texbf{}
create_snippet(
    {
        trig = "bf",
        name = "textbf",
        dscr = "\\textbf{}",
    },
    fmt([[\textbf{<>}]],
        { insert(1, "text") },
        { delimiters = "<>" }
    )
)

-- \textbf{} visual mode
create_snippet(
    {
        trig = 'bfv',
        name = 'textbf',
        dscr = '\\textbf'
    },
    fmt([[\textbf{<>}]],
        { func(function(args, snip)
            local res, env = {}, snip.env
            for _, val in ipairs(env.LS_SELECT_RAW) do table.insert(res, val) end
            return res
        end, {}) },
        { delimiters = '<>' }
    ), { condition = math, show_condition = math })



-- \emph{(i)}
create_snippet(
    {
        trig = "em",
        name = "\\emph",
        dscr = "\\emph{}",
    },
    fmt([[\emph{(i<>)}]],
        { insert(1, "text") },
        { delimiters = "<>" }
    )
)

-- \cref{}
create_snippet(
    {
        trig = "rf",
        name = "\\cref",
        dscr = "\\cref{}",
    },
    fmt([[\cref{<>}]],
        { insert(1, "text") },
        { delimiters = "<>" }
    )
)

-- ~\cite{}
create_snippet(
    {
        trig = "ct",
        name = "\\cite",
        dscr = "~\\cite{}",
    },
    fmt([[~\cite{<>}]],
        { insert(1, "text") },
        { delimiters = "<>" }
    )
)
-- mirrored \begin & \end
create_snippet(
    {
        trig = "env",
        name = "environment",
        dscr = "generic LaTex environment",
    },

    fmt([[
    \begin{<>}
    <>
    \end{<>}
    ]],
        { insert(1, "header"), insert(2, "text"), rep(1) },
        { delimiters = "<>" }
    )
)

return snippets, autosnippets
