local M = {}

M.config = { italics = false, variant = "mokka" }

M.setup = function(opts)
  M.config = vim.tbl_extend("force", M.config, opts or {})
  M.load()
end

M.load = function()
  local italics = M.config.italics or false

  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "mokka"

  -- ── Palette ──────────────────────────────────────────────────────────
  local p = require("mokka.palettes." .. M.config.variant)

  -- ── Helper ────────────────────────────────────────────────────────────
  local hi = function(group, fg, bg, attr, sp)
    local opts_hi = {}
    if fg and fg ~= p.none then opts_hi.fg = fg end
    if bg and bg ~= p.none then opts_hi.bg = bg end
    if sp and sp ~= p.none then opts_hi.sp = sp end
    if attr and attr ~= "" then
      for _, a in ipairs(vim.split(attr, ",")) do
        opts_hi[vim.trim(a)] = true
      end
    end
    vim.api.nvim_set_hl(0, group, opts_hi)
  end

  local italic = italics and "italic" or ""

  -- ── Editor ────────────────────────────────────────────────────────────
  hi("Normal", p.fg1, p.bg0)
  hi("NormalFloat", p.fg1, p.bg2)
  hi("NormalNC", p.fg2, p.bg0)
  hi("FloatBorder", p.bg4, p.bg2)
  hi("FloatTitle", p.cyan, p.bg2, "bold")

  hi("Cursor", p.bg0, p.fg1)
  hi("CursorIM", p.bg0, p.fg1)
  hi("CursorLine", p.none, p.bg1)
  hi("CursorColumn", p.none, p.bg1)
  hi("CursorLineNr", p.yellow, p.none, "bold")

  hi("LineNr", p.bg4)
  hi("SignColumn", p.bg4, p.bg0)
  hi("ColorColumn", p.none, p.bg1)
  hi("FoldColumn", p.bg4, p.bg0)
  hi("Folded", p.fg3, p.bg2)

  hi("Visual", p.none, p.bg3)
  hi("VisualNOS", p.none, p.bg3)
  hi("Search", p.bg0, p.yellow)
  hi("IncSearch", p.bg0, p.orange)
  hi("CurSearch", p.bg0, p.orange)
  hi("Substitute", p.bg0, p.pink)

  hi("StatusLine", p.fg1, p.bg2)
  hi("StatusLineNC", p.fg3, p.bg1)
  hi("WinSeparator", p.bg4, p.none)
  hi("VertSplit", p.bg4, p.none)

  hi("TabLine", p.fg3, p.bg2)
  hi("TabLineFill", p.none, p.bg1)
  hi("TabLineSel", p.fg0, p.bg0, "bold")

  hi("Pmenu", p.fg1, p.bg2)
  hi("PmenuSel", p.fg0, p.bg3, "bold")
  hi("PmenuSbar", p.none, p.bg2)
  hi("PmenuThumb", p.none, p.bg4)
  hi("PmenuExtra", p.fg3, p.bg2)
  hi("PmenuExtraSel", p.fg2, p.bg3)

  hi("WildMenu", p.bg0, p.yellow)
  hi("Directory", p.blue, p.none, "bold")

  hi("Title", p.green, p.none, "bold")
  hi("MoreMsg", p.green)
  hi("Question", p.green)
  hi("ModeMsg", p.fg0, p.none, "bold")
  hi("MsgArea", p.fg2)
  hi("MsgSeparator", p.fg3, p.bg2)
  hi("ErrorMsg", p.err, p.none)
  hi("WarningMsg", p.warn, p.none)

  hi("MatchParen", p.none, p.bg4, "bold,underline")
  hi("NonText", p.bg4)
  hi("Whitespace", p.bg3)
  hi("SpecialKey", p.bg4)
  hi("EndOfBuffer", p.bg3)
  hi("Conceal", p.fg3)
  hi("SpellBad", p.none, p.none, "undercurl", p.err)
  hi("SpellCap", p.none, p.none, "undercurl", p.warn)
  hi("SpellRare", p.none, p.none, "undercurl", p.info)
  hi("SpellLocal", p.none, p.none, "undercurl", p.hint)

  hi("DiffAdd", p.added, p.none)
  hi("DiffChange", p.changed, p.none)
  hi("DiffDelete", p.removed, p.none)
  hi("DiffText", p.fg0, p.bg3, "bold")

  hi("QuickFixLine", p.none, p.bg2)
  hi("qfLineNr", p.yellow)
  hi("qfFileName", p.blue)

  -- ── Syntax ────────────────────────────────────────────────────────────
  hi("Comment", p.fg2, p.none, italic)
  hi("SpecialComment", p.fg2, p.none, italic)

  hi("Constant", p.orange)
  hi("String", p.yellow)
  hi("Character", p.yellow)
  hi("Number", p.purple)
  hi("Boolean", p.purple)
  hi("Float", p.purple)

  hi("Identifier", p.fg1)
  hi("Function", p.green)

  hi("Statement", p.red)
  hi("Conditional", p.red)
  hi("Repeat", p.red)
  hi("Label", p.red)
  hi("Operator", p.pink)
  hi("Keyword", p.red, p.none, italic)
  hi("Exception", p.red)

  hi("PreProc", p.cyan)
  hi("Include", p.cyan)
  hi("Define", p.cyan)
  hi("Macro", p.cyan)
  hi("PreCondit", p.cyan)

  hi("Type", p.orange, p.none, italic)
  hi("StorageClass", p.red)
  hi("Structure", p.orange)
  hi("Typedef", p.orange)

  hi("Special", p.cyan)
  hi("SpecialChar", p.orange)
  hi("Tag", p.blue)
  hi("Delimiter", p.fg2)
  hi("Debug", p.pink)

  hi("Underlined", p.blue, p.none, "underline")
  hi("Ignore", p.fg3)
  hi("Error", p.err, p.none, "bold")
  hi("Todo", p.bg0, p.yellow, "bold")

  -- ── Treesitter ────────────────────────────────────────────────────────
  hi("@variable", p.fg1)
  hi("@variable.builtin", p.purple, p.none, italic)
  hi("@variable.parameter", p.fg1)
  hi("@variable.member", p.fg1)

  hi("@constant", p.orange)
  hi("@constant.builtin", p.orange, p.none, italic)
  hi("@constant.macro", p.cyan)

  hi("@module", p.fg1)
  hi("@module.builtin", p.purple)
  hi("@label", p.red)

  hi("@string", p.yellow)
  hi("@string.regexp", p.pink)
  hi("@string.escape", p.pink)
  hi("@string.special", p.pink)
  hi("@string.special.symbol", p.yellow)

  hi("@character", p.yellow)
  hi("@character.special", p.pink)
  hi("@boolean", p.purple, p.none, italic)
  hi("@number", p.purple)
  hi("@number.float", p.purple)

  hi("@type", p.orange, p.none, italic)
  hi("@type.builtin", p.orange, p.none, italic)
  hi("@type.definition", p.orange)

  hi("@attribute", p.cyan)
  hi("@attribute.builtin", p.cyan)
  hi("@property", p.fg1)

  hi("@function", p.green)
  hi("@function.builtin", p.cyan)
  hi("@function.call", p.green)
  hi("@function.macro", p.cyan)
  hi("@function.method", p.green)
  hi("@function.method.call", p.green)

  hi("@constructor", p.purple)
  hi("@operator", p.pink)

  hi("@keyword", p.red, p.none, italic)
  hi("@keyword.coroutine", p.red, p.none, italic)
  hi("@keyword.function", p.red, p.none, italic)
  hi("@keyword.operator", p.pink)
  hi("@keyword.import", p.cyan)
  hi("@keyword.type", p.orange, p.none, italic)
  hi("@keyword.modifier", p.red, p.none, italic)
  hi("@keyword.repeat", p.red, p.none, italic)
  hi("@keyword.return", p.red, p.none, italic)
  hi("@keyword.debug", p.pink)
  hi("@keyword.exception", p.red)
  hi("@keyword.conditional", p.red, p.none, italic)
  hi("@keyword.directive", p.cyan)
  hi("@keyword.directive.define", p.cyan)

  hi("@punctuation.delimiter", p.fg2)
  hi("@punctuation.bracket", p.fg2)
  hi("@punctuation.special", p.pink)

  hi("@comment", p.fg2, p.none, italic)
  hi("@comment.documentation", p.fg2, p.none, italic)
  hi("@comment.error", p.err)
  hi("@comment.warning", p.warn)
  hi("@comment.todo", p.bg0, p.yellow, "bold")
  hi("@comment.note", p.bg0, p.info, "bold")

  hi("@markup.strong", p.none, p.none, "bold")
  hi("@markup.italic", p.none, p.none, "italic")
  hi("@markup.strikethrough", p.none, p.none, "strikethrough")
  hi("@markup.underline", p.none, p.none, "underline")
  hi("@markup.heading", p.yellow, p.none, "bold")
  hi("@markup.heading.1", p.yellow, p.none, "bold")
  hi("@markup.heading.2", p.orange, p.none, "bold")
  hi("@markup.heading.3", p.green, p.none, "bold")
  hi("@markup.heading.4", p.cyan, p.none, "bold")
  hi("@markup.heading.5", p.blue, p.none, "bold")
  hi("@markup.heading.6", p.purple, p.none, "bold")
  hi("@markup.quote", p.fg2, p.bg1)
  hi("@markup.math", p.purple)
  hi("@markup.link", p.blue, p.none, "underline")
  hi("@markup.link.label", p.blue)
  hi("@markup.link.url", p.cyan, p.none, "underline")
  hi("@markup.raw", p.orange)
  hi("@markup.raw.block", p.orange)
  hi("@markup.list", p.pink)
  hi("@markup.list.checked", p.green)
  hi("@markup.list.unchecked", p.fg3)

  hi("@diff.plus", p.added)
  hi("@diff.minus", p.removed)
  hi("@diff.delta", p.changed)

  hi("@tag", p.red)
  hi("@tag.attribute", p.yellow)
  hi("@tag.delimiter", p.fg2)

  -- ── LSP ───────────────────────────────────────────────────────────────
  hi("LspReferenceText", p.none, p.bg3)
  hi("LspReferenceRead", p.none, p.bg3)
  hi("LspReferenceWrite", p.none, p.bg3, "bold")
  hi("LspSignatureActiveParameter", p.none, p.bg3, "bold")
  hi("LspCodeLens", p.fg3, p.none, italic)
  hi("LspCodeLensSeparator", p.fg3)
  hi("LspInlayHint", p.fg3, p.bg1, italic)

  -- Diagnostics
  hi("DiagnosticError", p.err)
  hi("DiagnosticWarn", p.warn)
  hi("DiagnosticInfo", p.info)
  hi("DiagnosticHint", p.hint)
  hi("DiagnosticOk", p.green)
  hi("DiagnosticVirtualTextError", p.err, p.bg1)
  hi("DiagnosticVirtualTextWarn", p.warn, p.bg1)
  hi("DiagnosticVirtualTextInfo", p.info, p.bg1)
  hi("DiagnosticVirtualTextHint", p.hint, p.bg1)
  hi("DiagnosticUnderlineError", p.none, p.none, "undercurl", p.err)
  hi("DiagnosticUnderlineWarn", p.none, p.none, "undercurl", p.warn)
  hi("DiagnosticUnderlineInfo", p.none, p.none, "undercurl", p.info)
  hi("DiagnosticUnderlineHint", p.none, p.none, "undercurl", p.hint)
  hi("DiagnosticFloatingError", p.err)
  hi("DiagnosticFloatingWarn", p.warn)
  hi("DiagnosticFloatingInfo", p.info)
  hi("DiagnosticFloatingHint", p.hint)
  hi("DiagnosticSignError", p.err)
  hi("DiagnosticSignWarn", p.warn)
  hi("DiagnosticSignInfo", p.info)
  hi("DiagnosticSignHint", p.hint)
  hi("DiagnosticDeprecated", p.none, p.none, "strikethrough")

  -- Semantic tokens
  hi("@lsp.type.class", p.orange)
  hi("@lsp.type.decorator", p.cyan)
  hi("@lsp.type.enum", p.orange)
  hi("@lsp.type.enumMember", p.purple)
  hi("@lsp.type.function", p.green)
  hi("@lsp.type.interface", p.cyan)
  hi("@lsp.type.macro", p.cyan)
  hi("@lsp.type.method", p.green)
  hi("@lsp.type.namespace", p.fg1)
  hi("@lsp.type.parameter", p.fg1)
  hi("@lsp.type.property", p.fg1)
  hi("@lsp.type.struct", p.orange)
  hi("@lsp.type.type", p.orange)
  hi("@lsp.type.typeParameter", p.orange)
  hi("@lsp.type.variable", p.fg1)
  hi("@lsp.typemod.keyword.documentation", p.red)

  -- ── Telescope ─────────────────────────────────────────────────────────
  hi("TelescopeBorder", p.bg4, p.bg2)
  hi("TelescopeTitle", p.cyan, p.bg2, "bold")
  hi("TelescopePromptBorder", p.bg4, p.bg1)
  hi("TelescopePromptTitle", p.green, p.bg1, "bold")
  hi("TelescopePromptNormal", p.fg0, p.bg1)
  hi("TelescopePromptPrefix", p.pink, p.bg1)
  hi("TelescopePreviewBorder", p.bg4, p.bg0)
  hi("TelescopePreviewTitle", p.blue, p.bg0, "bold")
  hi("TelescopeNormal", p.fg1, p.bg2)
  hi("TelescopeResultsBorder", p.bg4, p.bg2)
  hi("TelescopeResultsTitle", p.blue, p.bg2, "bold")
  hi("TelescopeSelection", p.fg0, p.bg3, "bold")
  hi("TelescopeSelectionCaret", p.pink, p.bg3)
  hi("TelescopeMultiSelection", p.purple, p.bg3)
  hi("TelescopeMultiIcon", p.pink, p.bg3)
  hi("TelescopeMatching", p.yellow, p.none, "bold")

  -- ── fzf-lua ───────────────────────────────────────────────────────────
  hi("FzfLuaBorder", p.bg4, p.bg2)
  hi("FzfLuaTitle", p.cyan, p.bg2, "bold")
  hi("FzfLuaPreviewBorder", p.bg4, p.bg0)
  hi("FzfLuaPreviewTitle", p.blue, p.bg0, "bold")

  -- ── mini.nvim ─────────────────────────────────────────────────────────
  -- mini.statusline
  hi("MiniStatuslineModeNormal", p.bg0, p.green, "bold")
  hi("MiniStatuslineModeInsert", p.bg0, p.blue, "bold")
  hi("MiniStatuslineModeVisual", p.bg0, p.purple, "bold")
  hi("MiniStatuslineModeReplace", p.bg0, p.red, "bold")
  hi("MiniStatuslineModeCommand", p.bg0, p.orange, "bold")
  hi("MiniStatuslineModeOther", p.bg0, p.cyan, "bold")
  hi("MiniStatuslineDevinfo", p.fg2, p.bg3)
  hi("MiniStatuslineFilename", p.fg1, p.bg2)
  hi("MiniStatuslineFileinfo", p.fg2, p.bg3)
  hi("MiniStatuslineInactive", p.fg3, p.bg1)

  -- mini.tabline
  hi("MiniTablineCurrent", p.fg0, p.bg0, "bold")
  hi("MiniTablineVisible", p.fg2, p.bg2)
  hi("MiniTablineHidden", p.fg3, p.bg1)
  hi("MiniTablineModifiedCurrent", p.yellow, p.bg0, "bold")
  hi("MiniTablineModifiedVisible", p.yellow, p.bg2)
  hi("MiniTablineModifiedHidden", p.yellow, p.bg1)
  hi("MiniTablineFill", p.none, p.bg1)
  hi("MiniTablineTabpagesection", p.bg0, p.cyan, "bold")

  -- mini.files
  hi("MiniFilesBorder", p.bg4, p.bg2)
  hi("MiniFilesBorderModified", p.warn, p.bg2)
  hi("MiniFilesCursorLine", p.none, p.bg3)
  hi("MiniFilesDirectory", p.blue, p.none, "bold")
  hi("MiniFilesFile", p.fg1)
  hi("MiniFilesNormal", p.fg1, p.bg2)
  hi("MiniFilesTitle", p.cyan, p.bg2, "bold")
  hi("MiniFilesTitleFocused", p.cyan, p.bg2, "bold")

  -- mini.pick
  hi("MiniPickBorder", p.bg4, p.bg2)
  hi("MiniPickBorderBusy", p.warn, p.bg2)
  hi("MiniPickBorderText", p.cyan, p.bg2, "bold")
  hi("MiniPickMatchCurrent", p.fg0, p.bg3, "bold")
  hi("MiniPickMatchMarked", p.purple, p.bg3)
  hi("MiniPickMatchRanges", p.yellow, p.none, "bold")
  hi("MiniPickNormal", p.fg1, p.bg2)
  hi("MiniPickPrompt", p.green, p.bg1, "bold")
  hi("MiniPickHeader", p.cyan, p.bg2, "bold")

  -- mini.icons
  hi("MiniIconsAzure", p.blue)
  hi("MiniIconsBlue", p.blue)
  hi("MiniIconsCyan", p.cyan)
  hi("MiniIconsGreen", p.green)
  hi("MiniIconsGrey", p.fg3)
  hi("MiniIconsOrange", p.orange)
  hi("MiniIconsPurple", p.purple)
  hi("MiniIconsRed", p.red)
  hi("MiniIconsYellow", p.yellow)

  -- mini.clue / notify / animate
  hi("MiniClueBorder", p.bg4, p.bg2)
  hi("MiniClueDescGroup", p.cyan, p.none, "bold")
  hi("MiniClueDescSingle", p.fg1)
  hi("MiniClueNextKey", p.yellow, p.none, "bold")
  hi("MiniClueNextKeyWithPostkeys", p.pink, p.none, "bold")
  hi("MiniClueSeparator", p.fg3)
  hi("MiniClueTitle", p.cyan, p.bg2, "bold")

  hi("MiniNotifyBorder", p.bg4, p.bg2)
  hi("MiniNotifyNormal", p.fg1, p.bg2)
  hi("MiniNotifyTitle", p.cyan, p.bg2)

  -- mini.diff
  hi("MiniDiffSignAdd", p.added)
  hi("MiniDiffSignChange", p.changed)
  hi("MiniDiffSignDelete", p.removed)
  hi("MiniDiffOverAdd", p.none, p.bg2)
  hi("MiniDiffOverChange", p.none, p.bg2)
  hi("MiniDiffOverContext", p.none, p.bg1)
  hi("MiniDiffOverDelete", p.none, p.bg2)

  -- mini.completion
  hi("MiniCompletionActiveParameter", p.none, p.bg3, "bold,underline")

  -- mini.cursorword
  hi("MiniCursorword", p.none, p.none, "underline")
  hi("MiniCursorwordCurrent", p.none, p.none, "underline")

  -- mini.indentscope
  hi("MiniIndentscopeSymbol", p.bg4)
  hi("MiniIndentscopePrefix", p.none, p.none, "nocombine")

  -- mini.jump
  hi("MiniJump", p.bg0, p.pink, "bold")
  hi("MiniJump2dSpot", p.bg0, p.yellow, "bold")
  hi("MiniJump2dSpotAhead", p.bg0, p.cyan, "bold")
  hi("MiniJump2dSpotUnique", p.bg0, p.green, "bold")
  hi("MiniJump2dDim", p.fg3)

  -- mini.surround
  hi("MiniSurround", p.bg0, p.orange, "bold")

  -- mini.operators
  hi("MiniOperatorsExchangeFrom", p.none, p.bg3, "bold")

  -- mini.trailspace
  hi("MiniTrailspace", p.none, p.red)

  -- ── Lualine ───────────────────────────────────────────────────────────
  -- Lualine reads Normal/StatusLine etc., but explicit groups help
  hi("lualine_a_normal", p.bg0, p.green, "bold")
  hi("lualine_a_insert", p.bg0, p.blue, "bold")
  hi("lualine_a_visual", p.bg0, p.purple, "bold")
  hi("lualine_a_replace", p.bg0, p.red, "bold")
  hi("lualine_a_command", p.bg0, p.orange, "bold")
  hi("lualine_b_normal", p.fg1, p.bg3)
  hi("lualine_c_normal", p.fg2, p.bg2)

  -- ── Heirline ──────────────────────────────────────────────────────────
  -- Heirline uses standard StatusLine + custom groups; falls back gracefully
  hi("HeirlineNormal", p.bg0, p.green, "bold")
  hi("HeirlineInsert", p.bg0, p.blue, "bold")
  hi("HeirlineVisual", p.bg0, p.purple, "bold")
  hi("HeirlineReplace", p.bg0, p.red, "bold")
  hi("HeirlineCommand", p.bg0, p.orange, "bold")

  -- ── nvim-cmp ──────────────────────────────────────────────────────────
  hi("CmpItemAbbr", p.fg1)
  hi("CmpItemAbbrMatch", p.yellow, p.none, "bold")
  hi("CmpItemAbbrMatchFuzzy", p.yellow, p.none, "bold")
  hi("CmpItemAbbrDeprecated", p.fg3, p.none, "strikethrough")
  hi("CmpItemMenu", p.fg3, p.none, italic)
  hi("CmpItemKindDefault", p.fg2)
  hi("CmpItemKindKeyword", p.red)
  hi("CmpItemKindVariable", p.fg1)
  hi("CmpItemKindConstant", p.orange)
  hi("CmpItemKindReference", p.fg1)
  hi("CmpItemKindValue", p.purple)
  hi("CmpItemKindFunction", p.green)
  hi("CmpItemKindConstructor", p.purple)
  hi("CmpItemKindMethod", p.green)
  hi("CmpItemKindClass", p.orange)
  hi("CmpItemKindInterface", p.cyan)
  hi("CmpItemKindStruct", p.orange)
  hi("CmpItemKindEvent", p.pink)
  hi("CmpItemKindEnum", p.orange)
  hi("CmpItemKindUnit", p.purple)
  hi("CmpItemKindModule", p.fg1)
  hi("CmpItemKindProperty", p.fg1)
  hi("CmpItemKindField", p.fg1)
  hi("CmpItemKindTypeParameter", p.orange)
  hi("CmpItemKindEnumMember", p.purple)
  hi("CmpItemKindOperator", p.pink)
  hi("CmpItemKindSnippet", p.cyan)
  hi("CmpItemKindText", p.fg2)
  hi("CmpItemKindFile", p.blue)
  hi("CmpItemKindFolder", p.blue)
  hi("CmpItemKindColor", p.pink)

  -- blink.cmp
  hi("BlinkCmpLabel", p.fg1)
  hi("BlinkCmpLabelMatch", p.yellow, p.none, "bold")
  hi("BlinkCmpLabelDeprecated", p.fg3, p.none, "strikethrough")
  hi("BlinkCmpLabelDetail", p.fg3, p.none, italic)
  hi("BlinkCmpLabelDescription", p.fg3)
  hi("BlinkCmpKindDefault", p.fg2)
  hi("BlinkCmpKindKeyword", p.red)
  hi("BlinkCmpKindVariable", p.fg1)
  hi("BlinkCmpKindConstant", p.orange)
  hi("BlinkCmpKindFunction", p.green)
  hi("BlinkCmpKindMethod", p.green)
  hi("BlinkCmpKindClass", p.orange)
  hi("BlinkCmpKindInterface", p.cyan)
  hi("BlinkCmpKindStruct", p.orange)
  hi("BlinkCmpKindEnum", p.orange)
  hi("BlinkCmpKindEnumMember", p.purple)
  hi("BlinkCmpKindSnippet", p.cyan)
  hi("BlinkCmpKindText", p.fg2)
  hi("BlinkCmpMenu", p.fg1, p.bg2)
  hi("BlinkCmpMenuBorder", p.bg4, p.bg2)
  hi("BlinkCmpMenuSelection", p.fg0, p.bg3, "bold")
  hi("BlinkCmpDoc", p.fg1, p.bg2)
  hi("BlinkCmpDocBorder", p.bg4, p.bg2)
  hi("BlinkCmpDocSeparator", p.bg4, p.bg2)
  hi("BlinkCmpScrollBarThumb", p.none, p.bg4)

  -- ── nvim-tree / neo-tree ──────────────────────────────────────────────
  hi("NvimTreeNormal", p.fg1, p.bg0)
  hi("NvimTreeNormalNC", p.fg2, p.bg0)
  hi("NvimTreeRootFolder", p.yellow, p.none, "bold")
  hi("NvimTreeFolderName", p.blue)
  hi("NvimTreeFolderIcon", p.blue)
  hi("NvimTreeOpenedFolderName", p.blue, p.none, "bold")
  hi("NvimTreeEmptyFolderName", p.fg3)
  hi("NvimTreeIndentMarker", p.bg4)
  hi("NvimTreeGitDirty", p.changed)
  hi("NvimTreeGitStaged", p.added)
  hi("NvimTreeGitMerge", p.pink)
  hi("NvimTreeGitNew", p.added)
  hi("NvimTreeGitDeleted", p.removed)
  hi("NvimTreeSpecialFile", p.cyan, p.none, "underline")
  hi("NvimTreeImageFile", p.pink)
  hi("NvimTreeSymlink", p.cyan)
  hi("NvimTreeCursorLine", p.none, p.bg1)
  hi("NvimTreeWinSeparator", p.bg4, p.bg0)

  hi("NeoTreeNormal", p.fg1, p.bg0)
  hi("NeoTreeNormalNC", p.fg2, p.bg0)
  hi("NeoTreeRootName", p.yellow, p.none, "bold")
  hi("NeoTreeDirectoryName", p.blue)
  hi("NeoTreeDirectoryIcon", p.blue)
  hi("NeoTreeFileName", p.fg1)
  hi("NeoTreeDimText", p.fg3)
  hi("NeoTreeIndentMarker", p.bg4)
  hi("NeoTreeGitAdded", p.added)
  hi("NeoTreeGitModified", p.changed)
  hi("NeoTreeGitDeleted", p.removed)
  hi("NeoTreeGitConflict", p.pink, p.none, "bold")
  hi("NeoTreeGitUntracked", p.fg2)
  hi("NeoTreeFloatBorder", p.bg4, p.bg2)
  hi("NeoTreeFloatTitle", p.cyan, p.bg2, "bold")

  -- ── Gitsigns ──────────────────────────────────────────────────────────
  hi("GitSignsAdd", p.added)
  hi("GitSignsChange", p.changed)
  hi("GitSignsDelete", p.removed)
  hi("GitSignsAddNr", p.added)
  hi("GitSignsChangeNr", p.changed)
  hi("GitSignsDeleteNr", p.removed)
  hi("GitSignsAddLn", p.none, p.bg1)
  hi("GitSignsChangeLn", p.none, p.bg1)
  hi("GitSignsDeleteLn", p.none, p.bg1)
  hi("GitSignsCurrentLineBlame", p.fg3, p.none, italic)

  -- ── Indent guides ─────────────────────────────────────────────────────
  hi("IndentBlanklineChar", p.bg3)
  hi("IndentBlanklineSpaceChar", p.bg3)
  hi("IndentBlanklineContextChar", p.bg4)
  hi("IblIndent", p.bg3)
  hi("IblScope", p.bg4)
  hi("IblWhitespace", p.bg3)

  -- ── Noice ─────────────────────────────────────────────────────────────
  hi("NoiceCmdlinePopup", p.fg1, p.bg2)
  hi("NoiceCmdlinePopupBorder", p.cyan, p.bg2)
  hi("NoiceCmdlinePopupTitle", p.cyan, p.bg2, "bold")
  hi("NoiceCmdlineIcon", p.cyan)
  hi("NoiceCmdlineIconSearch", p.yellow)
  hi("NoiceConfirmBorder", p.green, p.bg2)
  hi("NoiceMini", p.fg2, p.bg1)
  hi("NoiceLspProgressSpinner", p.cyan)
  hi("NoiceLspProgressTitle", p.fg1)
  hi("NoiceLspProgressClient", p.fg2)

  -- ── Which-key ─────────────────────────────────────────────────────────
  hi("WhichKey", p.cyan)
  hi("WhichKeyGroup", p.blue, p.none, "bold")
  hi("WhichKeyDesc", p.fg1)
  hi("WhichKeySeparator", p.fg3)
  hi("WhichKeyValue", p.fg2, p.none, italic)
  hi("WhichKeyBorder", p.bg4, p.bg2)
  hi("WhichKeyNormal", p.fg1, p.bg2)
  hi("WhichKeyTitle", p.cyan, p.bg2, "bold")

  -- ── nvim-dap / dap-ui ─────────────────────────────────────────────────
  hi("DapBreakpoint", p.red)
  hi("DapBreakpointCondition", p.orange)
  hi("DapBreakpointRejected", p.fg3)
  hi("DapLogPoint", p.cyan)
  hi("DapStopped", p.none, p.bg2)
  hi("DapStoppedLine", p.none, p.bg2)

  hi("DapUIScope", p.cyan, p.none, "bold")
  hi("DapUIType", p.purple)
  hi("DapUIValue", p.fg1)
  hi("DapUIModifiedValue", p.yellow, p.none, "bold")
  hi("DapUIDecoration", p.fg3)
  hi("DapUIThread", p.green)
  hi("DapUIStoppedThread", p.green, p.none, "bold")
  hi("DapUISource", p.blue)
  hi("DapUILineNumber", p.yellow)
  hi("DapUIFloatBorder", p.bg4, p.bg2)
  hi("DapUIWatchesEmpty", p.fg3, p.none, italic)
  hi("DapUIWatchesValue", p.green)
  hi("DapUIWatchesError", p.err)
  hi("DapUIBreakpointsPath", p.blue)
  hi("DapUIBreakpointsInfo", p.info)
  hi("DapUIBreakpointsCurrentLine", p.green, p.none, "bold")
  hi("DapUIBreakpointsLine", p.yellow)
  hi("DapUIBreakpointsFunctionName", p.fg1)
  hi("DapUICurrentFrameName", p.green, p.none, "bold")
  hi("DapUIStepOver", p.cyan)
  hi("DapUIStepInto", p.cyan)
  hi("DapUIStepBack", p.cyan)
  hi("DapUIStepOut", p.cyan)
  hi("DapUIStop", p.red)
  hi("DapUIPlayPause", p.green)
  hi("DapUIRestart", p.green)
  hi("DapUIUnavailable", p.fg3)

  -- ── Trouble ───────────────────────────────────────────────────────────
  hi("TroubleNormal", p.fg1, p.bg0)
  hi("TroubleNormalNC", p.fg2, p.bg0)
  hi("TroubleCount", p.fg0, p.bg3, "bold")
  hi("TroubleCode", p.fg3, p.none, italic)
  hi("TroubleSource", p.fg3)
  hi("TroublePos", p.fg3)
  hi("TroubleTextError", p.err)
  hi("TroubleTextWarning", p.warn)
  hi("TroubleTextInformation", p.info)
  hi("TroubleTextHint", p.hint)

  -- ── Lazy.nvim ─────────────────────────────────────────────────────────
  hi("LazyNormal", p.fg1, p.bg2)
  hi("LazyBorder", p.bg4, p.bg2)
  hi("LazyButtonActive", p.bg0, p.cyan, "bold")
  hi("LazyButton", p.fg1, p.bg3)
  hi("LazyH1", p.bg0, p.cyan, "bold")
  hi("LazyH2", p.cyan, p.none, "bold")
  hi("LazyReasonPlugin", p.purple)
  hi("LazyReasonEvent", p.pink)
  hi("LazyReasonKeys", p.yellow)
  hi("LazyReasonStart", p.green)
  hi("LazyReasonSource", p.cyan)
  hi("LazyReasonFt", p.blue)
  hi("LazyReasonCmd", p.orange)
  hi("LazyReasonImport", p.fg2)
  hi("LazySpecial", p.cyan)
  hi("LazyHandlerEvent", p.pink)
  hi("LazyHandlerKeys", p.yellow)
  hi("LazyHandlerFt", p.blue)
  hi("LazyHandlerPlugin", p.purple)
  hi("LazyProgressDone", p.green, p.none, "bold")
  hi("LazyProgressTodo", p.fg3)
  hi("LazyCommit", p.yellow)
  hi("LazyCommitType", p.cyan)
  hi("LazyCommitScope", p.fg2, p.none, italic)
  hi("LazyCommitIssue", p.pink)
  hi("LazyLocal", p.orange)
  hi("LazyUrl", p.blue, p.none, "underline")
  hi("LazyProp", p.fg2)
  hi("LazyValue", p.yellow)
  hi("LazyNoCond", p.red)
  hi("LazyDimmed", p.fg3)

  -- ── Mason ─────────────────────────────────────────────────────────────
  hi("MasonNormal", p.fg1, p.bg2)
  hi("MasonHighlight", p.cyan)
  hi("MasonHighlightBlock", p.bg0, p.cyan)
  hi("MasonHighlightBlockBold", p.bg0, p.cyan, "bold")
  hi("MasonHeader", p.bg0, p.cyan, "bold")
  hi("MasonHeaderSecondary", p.bg0, p.green, "bold")
  hi("MasonMuted", p.fg3)
  hi("MasonMutedBlock", p.fg3, p.bg3)
  hi("MasonMutedBlockBold", p.fg2, p.bg3, "bold")
  hi("MasonError", p.err)
  hi("MasonWarning", p.warn)
  hi("MasonHeading", p.cyan, p.none, "bold")

  -- ── Render-markdown ────────────────────────────────────────────────────
  hi("RenderMarkdownH1Bg", p.none, "#2a2e3f")
  hi("RenderMarkdownH2Bg", p.none, "#252932")
  hi("RenderMarkdownH3Bg", p.none, "#232730")
  hi("RenderMarkdownBullet", p.pink)
  hi("RenderMarkdownCode", p.none, p.bg1)
  hi("RenderMarkdownCodeInline", p.orange, p.bg1)
  hi("RenderMarkdownDash", p.bg4)
  hi("RenderMarkdownLink", p.blue, p.none, "underline")
  hi("RenderMarkdownSign", p.fg3, p.bg0)
  hi("RenderMarkdownMath", p.purple)
  hi("RenderMarkdownChecked", p.green)
  hi("RenderMarkdownUnchecked", p.fg3)
  hi("RenderMarkdownTodo", p.bg0, p.yellow, "bold")
  hi("RenderMarkdownNote", p.bg0, p.info, "bold")
  hi("RenderMarkdownWarn", p.bg0, p.warn, "bold")
  hi("RenderMarkdownDanger", p.bg0, p.err, "bold")
  hi("RenderMarkdownInfo", p.bg0, p.cyan, "bold")
  hi("RenderMarkdownHint", p.bg0, p.hint, "bold")
  hi("RenderMarkdownSuccess", p.bg0, p.green, "bold")
  hi("RenderMarkdownTableHead", p.fg0, p.bg2, "bold")
  hi("RenderMarkdownTableRow", p.fg1, p.bg0)
  hi("RenderMarkdownTableFill", p.none, p.bg0)

  -- ── Aerial / Outline ──────────────────────────────────────────────────
  hi("AerialLine", p.none, p.bg2)
  hi("AerialLineNC", p.none, p.bg1)
  hi("AerialNormal", p.fg1, p.bg0)
  hi("AerialClass", p.orange)
  hi("AerialFunction", p.green)
  hi("AerialMethod", p.green)
  hi("AerialConstructor", p.purple)
  hi("AerialConstant", p.orange)
  hi("AerialField", p.fg1)
  hi("AerialEnum", p.orange)
  hi("AerialInterface", p.cyan)
  hi("AerialModule", p.fg1)
  hi("AerialVariable", p.fg1)
  hi("AerialProperty", p.fg1)
  hi("AerialString", p.yellow)
  hi("AerialNumber", p.purple)
  hi("AerialBoolean", p.purple)
  hi("AerialStruct", p.orange)

  -- ── Illuminate ────────────────────────────────────────────────────────
  hi("IlluminatedWordText", p.none, p.bg3)
  hi("IlluminatedWordRead", p.none, p.bg3)
  hi("IlluminatedWordWrite", p.none, p.bg3, "bold")

  -- ── Flash / Hop / Leap ────────────────────────────────────────────────
  hi("FlashLabel", p.bg0, p.pink, "bold")
  hi("FlashCurrent", p.bg0, p.orange, "bold")
  hi("FlashMatch", p.bg0, p.yellow, "bold")
  hi("FlashBackdrop", p.fg3)
  hi("HopNextKey", p.bg0, p.pink, "bold")
  hi("HopNextKey1", p.bg0, p.cyan, "bold")
  hi("HopNextKey2", p.bg0, p.blue, "bold")
  hi("HopUnmatched", p.fg3)
  hi("LeapMatch", p.bg0, p.yellow, "bold")
  hi("LeapLabelPrimary", p.bg0, p.pink, "bold")
  hi("LeapLabelSecondary", p.bg0, p.cyan, "bold")
  hi("LeapBackdrop", p.fg3)

  -- ── Notify ────────────────────────────────────────────────────────────
  hi("NotifyERRORBorder", p.err, p.none)
  hi("NotifyWARNBorder", p.warn, p.none)
  hi("NotifyINFOBorder", p.info, p.none)
  hi("NotifyDEBUGBorder", p.fg3, p.none)
  hi("NotifyTRACEBorder", p.purple, p.none)
  hi("NotifyERRORIcon", p.err)
  hi("NotifyWARNIcon", p.warn)
  hi("NotifyINFOIcon", p.info)
  hi("NotifyDEBUGIcon", p.fg3)
  hi("NotifyTRACEIcon", p.purple)
  hi("NotifyERRORTitle", p.err, p.none, "bold")
  hi("NotifyWARNTitle", p.warn, p.none, "bold")
  hi("NotifyINFOTitle", p.info, p.none, "bold")
  hi("NotifyDEBUGTitle", p.fg3, p.none, "bold")
  hi("NotifyTRACETitle", p.purple, p.none, "bold")
  hi("NotifyERRORBody", p.fg1)
  hi("NotifyWARNBody", p.fg1)
  hi("NotifyINFOBody", p.fg1)
  hi("NotifyDEBUGBody", p.fg2)
  hi("NotifyTRACEBody", p.fg2)

  -- ── Snacks (folke/snacks.nvim) ─────────────────────────────────────────
  hi("SnacksNormal", p.fg1, p.bg2)
  hi("SnacksBorder", p.bg4, p.bg2)
  hi("SnacksTitle", p.cyan, p.bg2, "bold")
  hi("SnacksBackdrop", p.none, p.bg0)
  hi("SnacksDashboardNormal", p.fg1, p.bg0)
  hi("SnacksDashboardDesc", p.fg2)
  hi("SnacksDashboardFile", p.blue)
  hi("SnacksDashboardDir", p.fg3)
  hi("SnacksDashboardFooter", p.fg3, p.none, italic)
  hi("SnacksDashboardHeader", p.cyan, p.none, "bold")
  hi("SnacksDashboardIcon", p.cyan)
  hi("SnacksDashboardKey", p.yellow)
  hi("SnacksDashboardSection", p.green, p.none, "bold")
  hi("SnacksDashboardSpecial", p.pink)
  hi("SnacksIndent", p.bg3)
  hi("SnacksIndentScope", p.bg4)
  hi("SnacksPickerNormal", p.fg1, p.bg2)
  hi("SnacksPickerBorder", p.bg4, p.bg2)
  hi("SnacksPickerTitle", p.cyan, p.bg2, "bold")
  hi("SnacksPickerMatch", p.yellow, p.none, "bold")
  hi("SnacksPickerSelected", p.fg0, p.bg3, "bold")
  hi("SnacksPickerDir", p.fg3)

  -- ── Alpha / Dashboard ─────────────────────────────────────────────────
  hi("AlphaHeader", p.cyan, p.none, "bold")
  hi("AlphaButtons", p.yellow)
  hi("AlphaShortcut", p.pink)
  hi("AlphaFooter", p.fg3, p.none, italic)

  hi("DashboardHeader", p.cyan, p.none, "bold")
  hi("DashboardDesc", p.fg2)
  hi("DashboardKey", p.yellow)
  hi("DashboardIcon", p.cyan)
  hi("DashboardShortCut", p.pink)
  hi("DashboardFooter", p.fg3, p.none, italic)

  -- ── Terminal colours ──────────────────────────────────────────────────
  vim.g.terminal_color_0  = p.bg0
  vim.g.terminal_color_1  = p.red
  vim.g.terminal_color_2  = p.green
  vim.g.terminal_color_3  = p.yellow
  vim.g.terminal_color_4  = p.blue
  vim.g.terminal_color_5  = p.purple
  vim.g.terminal_color_6  = p.cyan
  vim.g.terminal_color_7  = p.fg1
  vim.g.terminal_color_8  = p.bg4
  vim.g.terminal_color_9  = p.red
  vim.g.terminal_color_10 = p.green
  vim.g.terminal_color_11 = p.yellow
  vim.g.terminal_color_12 = p.blue
  vim.g.terminal_color_13 = p.purple
  vim.g.terminal_color_14 = p.cyan
  vim.g.terminal_color_15 = p.fg0
end

return M
