require("mini.tabline").setup {
  format = function(buf_id, label)
    local suffix = vim.bo[buf_id].modified and '[+] ' or ''
    return MiniTabline.default_format(buf_id, label) .. suffix
  end
}

local link_hl = Utils.link_highlight

link_hl("MiniTablineModifiedHidden", "MiniTablineHidden")
link_hl("MiniTablineModifiedVisible", "MiniTablineVisible")
link_hl("MiniTablineModifiedCurrent", "MiniTablineCurrent")
