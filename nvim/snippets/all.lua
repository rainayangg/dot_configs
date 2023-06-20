local ls = require("luasnip")

-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt

local snippets, autosnippets = {}, {}
local date = function() return { os.date('%Y-%m-%d') } end

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

create_snippet(
    {
        trig = "date",
        namr = "Date",
        dscr = "Date in the form of YYYY-MM-DD",
    }, {
        func(date, {}),
    }
)

-- working note header
create_snippet(
    {
        trig = "wn",
        name = "working note header",
        dscr = "working note header",
    },
    fmt([[
    <>
    ========== <> ==========]],
        { func(date, {}),
            insert(1, "text") },
        { delimiters = "<>" }
    )
)

-- vimwiki link header
create_snippet(
    {
        trig = "ln",
        name = "vimwiki link",
        dscr = "vimwiki link template",
    },
    {
        text({ "[[" }), insert(1, "url"),
        text({ "|" }), insert(2, "name"),
        text({ "]]" })
    }
)
return snippets, autosnippets
