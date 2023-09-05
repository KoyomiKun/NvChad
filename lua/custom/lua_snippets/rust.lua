local ls = require("luasnip")

ls.add_snippets("rust", {
  s("meth", {
    t("fn "), i(1, "name"), t({"(&self, "}), i(2, "params"), t(") "), i(3, "-> ret"), t({" {", "  "}), i(4, "body"), t({"", "}"})
  })
})
