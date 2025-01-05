return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")

    -- local markdownlint = lint.linters.markdownlint
    -- markdownlint.args = { "--config", "/Users/pu54xk/dotfiles/config/nvim/.markdownlint.yaml" }
    --
    lint.linters_by_ft = {
      markdown = { "markdownlint-cli2" },
      sh = { "shellcheck" },
      json = { "jsonlint" },
      sql = { "sqlfluff" },
      -- python = { "mypy" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>ll", function()
      lint.clear()
    end, { desc = "Clear linter" })
  end,
}
