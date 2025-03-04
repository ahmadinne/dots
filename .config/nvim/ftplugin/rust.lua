if vim.fn.executable "rustfmt" then
  vim.opt_local.formatprg = "rustfmt -q --emit=stdout"
  local edition = require("cj.rust").find_rust_edition()
  if edition then
    vim.opt_local.formatprg:append(" --edition " .. edition)
  end
  vim.b.undo_ftplugin = vim.b.undo_ftplugin .. "|setl fp<"

  require("minimal-format").enable_autocmd(0)
end

function M.find_rust_edition()
  local manifests = find_cargotoml()
  for _, manifest in ipairs(manifests) do
    local grep_output =
      vim.fn.system { "grep", "-E", "--only-matching", [[edition *= *"(\d+)"]], manifest }
    local year = vim.fn.substitute(grep_output or "", [[^.*"\(\d\+\)".*$]], [[\1]], "")
    if year ~= "" then
      return tonumber(year)
    end
  end
  return nil
end
