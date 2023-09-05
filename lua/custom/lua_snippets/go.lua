local ls = require("luasnip")

ls.add_snippets("go", {
  s("iferr", {
    t("if err = "), i(1, "condition"), t({"; err != nil{", "  "}), i(2, "action"), t({"", "}"})
  })
})
