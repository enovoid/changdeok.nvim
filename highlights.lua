-- changdeok.nvim — highlight groups
--
-- 팔레트 키 이름은 변형과 무관하게 고정이다. 어느 장소를 고르든
-- 진사=keyword, 석황=function, 뇌록=string 매핑은 유지된다.
-- 색이 바뀌어도 코드를 읽는 습관은 바뀌지 않아야 하기 때문이다.
local M = {}

function M.build(c, opts)
  local it = opts.italic_comments and { italic = true } or {}
  local none = "NONE"
  local bg = opts.transparent and none or c.bg

  local hl = {
    ----------------------------------------------------------------
    -- 편집기 UI
    ----------------------------------------------------------------
    Normal        = { fg = c.fg, bg = bg },
    NormalNC      = { fg = c.fg, bg = opts.dim_inactive and c.bg_dim or bg },
    NormalFloat   = { fg = c.fg, bg = c.bg_float },
    FloatBorder   = { fg = c.border, bg = c.bg_float },
    FloatTitle    = { fg = c.seokhwang, bg = c.bg_float, bold = true },
    ColorColumn   = { bg = c.bg_line },
    Cursor        = { fg = c.bg, bg = c.fg },
    CursorLine    = { bg = c.bg_line },
    CursorLineNr  = { fg = c.seokhwang, bold = true },
    LineNr        = { fg = c.comment },
    SignColumn    = { bg = bg },
    Folded        = { fg = c.comment, bg = c.bg_line },
    FoldColumn    = { fg = c.comment, bg = bg },
    VertSplit     = { fg = c.border },
    WinSeparator  = { fg = c.border },
    Visual        = { bg = c.bg_sel },
    VisualNOS     = { bg = c.bg_sel },
    Search        = { fg = c.bg, bg = c.seokhwang },
    IncSearch     = { fg = c.bg, bg = c.jinsa },
    CurSearch     = { fg = c.bg, bg = c.jinsa },
    MatchParen    = { fg = c.seokhwang, bold = true, underline = true },
    Pmenu         = { fg = c.fg, bg = c.bg_float },
    PmenuSel      = { fg = c.fg, bg = c.bg_sel, bold = true },
    PmenuSbar     = { bg = c.bg_float },
    PmenuThumb    = { bg = c.border },
    StatusLine    = { fg = c.fg, bg = c.bg_float },
    StatusLineNC  = { fg = c.comment, bg = c.bg_dim },
    TabLine       = { fg = c.comment, bg = c.bg_dim },
    TabLineSel    = { fg = c.fg, bg = bg, bold = true },
    TabLineFill   = { bg = c.bg_dim },
    Title         = { fg = c.seokhwang, bold = true },
    Directory     = { fg = c.samcheong },
    NonText       = { fg = c.border },
    Whitespace    = { fg = c.border },
    SpecialKey    = { fg = c.border },
    Conceal       = { fg = c.fg_dim },
    ErrorMsg      = { fg = c.error },
    WarningMsg    = { fg = c.warn },
    MoreMsg       = { fg = c.noerok },
    ModeMsg       = { fg = c.fg, bold = true },
    Question      = { fg = c.samcheong },
    WildMenu      = { fg = c.bg, bg = c.seokhwang },
    QuickFixLine  = { bg = c.bg_sel },
    Winbar        = { fg = c.fg_dim, bg = bg },
    WinbarNC      = { fg = c.comment, bg = bg },

    ----------------------------------------------------------------
    -- 기본 구문
    ----------------------------------------------------------------
    Comment        = vim.tbl_extend("force", { fg = c.comment }, it),
    Constant       = { fg = c.jaju },
    String         = { fg = c.noerok },
    Character      = { fg = c.noerok },
    Number         = { fg = c.jaju },
    Boolean        = { fg = c.jaju },
    Float          = { fg = c.jaju },
    Identifier     = { fg = c.fg },
    Function       = { fg = c.seokhwang },
    Statement      = { fg = c.jinsa },
    Conditional    = { fg = c.jinsa },
    Repeat         = { fg = c.jinsa },
    Label          = { fg = c.jinsa },
    Operator       = { fg = c.fg_dim },
    Keyword        = { fg = c.jinsa },
    Exception      = { fg = c.jinsa },
    PreProc        = { fg = c.byeok },
    Include        = { fg = c.jinsa },
    Define         = { fg = c.byeok },
    Macro          = { fg = c.byeok },
    PreCondit      = { fg = c.byeok },
    Type           = { fg = c.samcheong },
    StorageClass   = { fg = c.jinsa },
    Structure      = { fg = c.samcheong },
    Typedef        = { fg = c.samcheong },
    Special        = { fg = c.byeok },
    SpecialChar    = { fg = c.byeok },
    Tag            = { fg = c.hong },
    Delimiter      = { fg = c.fg_dim },
    SpecialComment = { fg = c.comment, bold = true },
    Debug          = { fg = c.warn },
    Underlined     = { underline = true },
    Ignore         = { fg = c.comment },
    Error          = { fg = c.error },
    Todo           = { fg = c.bg, bg = c.seokhwang, bold = true },

    ----------------------------------------------------------------
    -- 진단. 배경 블록 대신 밑줄로 처리한다
    ----------------------------------------------------------------
    DiagnosticError            = { fg = c.error },
    DiagnosticWarn             = { fg = c.warn },
    DiagnosticInfo             = { fg = c.info },
    DiagnosticHint             = { fg = c.hint },
    DiagnosticOk               = { fg = c.add },
    DiagnosticUnderlineError   = { undercurl = true, sp = c.error },
    DiagnosticUnderlineWarn    = { undercurl = true, sp = c.warn },
    DiagnosticUnderlineInfo    = { undercurl = true, sp = c.info },
    DiagnosticUnderlineHint    = { undercurl = true, sp = c.hint },
    DiagnosticVirtualTextError = { fg = c.error, bg = none },
    DiagnosticVirtualTextWarn  = { fg = c.warn, bg = none },
    DiagnosticVirtualTextInfo  = { fg = c.info, bg = none },
    DiagnosticVirtualTextHint  = { fg = c.hint, bg = none },

    ----------------------------------------------------------------
    -- diff / git
    ----------------------------------------------------------------
    DiffAdd    = { fg = c.add, bg = none },
    DiffChange = { fg = c.change, bg = none },
    DiffDelete = { fg = c.delete, bg = none },
    DiffText   = { fg = c.change, bold = true },
    diffAdded   = { fg = c.add },
    diffRemoved = { fg = c.delete },
    diffChanged = { fg = c.change },
    diffFile    = { fg = c.samcheong },
    diffLine    = { fg = c.comment },

    ----------------------------------------------------------------
    -- Tree-sitter
    ----------------------------------------------------------------
    ["@comment"]              = vim.tbl_extend("force", { fg = c.comment }, it),
    ["@comment.error"]        = { fg = c.error, bold = true },
    ["@comment.warning"]      = { fg = c.warn, bold = true },
    ["@comment.todo"]         = { fg = c.bg, bg = c.seokhwang, bold = true },
    ["@comment.note"]         = { fg = c.info, bold = true },

    ["@variable"]             = { fg = c.fg },
    ["@variable.builtin"]     = { fg = c.jinsa, italic = true },
    ["@variable.parameter"]   = { fg = c.hong },
    ["@variable.member"]      = { fg = c.byeok },

    ["@constant"]             = { fg = c.jaju },
    ["@constant.builtin"]     = { fg = c.jaju, italic = true },
    ["@constant.macro"]       = { fg = c.byeok },

    ["@module"]               = { fg = c.samcheong },
    ["@label"]                = { fg = c.jinsa },

    ["@string"]               = { fg = c.noerok },
    ["@string.documentation"] = { fg = c.noerok, italic = true },
    ["@string.regexp"]        = { fg = c.byeok },
    ["@string.escape"]        = { fg = c.byeok, bold = true },
    ["@string.special"]       = { fg = c.byeok },
    ["@string.special.url"]   = { fg = c.samcheong, underline = true },
    ["@character"]            = { fg = c.noerok },
    ["@character.special"]    = { fg = c.byeok },
    ["@number"]               = { fg = c.jaju },
    ["@boolean"]              = { fg = c.jaju },

    ["@function"]             = { fg = c.seokhwang },
    ["@function.builtin"]     = { fg = c.seokhwang, italic = true },
    ["@function.call"]        = { fg = c.seokhwang },
    ["@function.macro"]       = { fg = c.byeok },
    ["@function.method"]      = { fg = c.seokhwang },
    ["@constructor"]          = { fg = c.samcheong },
    ["@operator"]             = { fg = c.fg_dim },

    ["@keyword"]              = { fg = c.jinsa },
    ["@keyword.function"]     = { fg = c.jinsa },
    ["@keyword.operator"]     = { fg = c.jinsa },
    ["@keyword.return"]       = { fg = c.jinsa, bold = true },
    ["@keyword.conditional"]  = { fg = c.jinsa },
    ["@keyword.repeat"]       = { fg = c.jinsa },
    ["@keyword.import"]       = { fg = c.jinsa },
    ["@keyword.exception"]    = { fg = c.jinsa },

    ["@type"]                 = { fg = c.samcheong },
    ["@type.builtin"]         = { fg = c.samcheong, italic = true },
    ["@type.definition"]      = { fg = c.samcheong },
    ["@attribute"]            = { fg = c.byeok },
    ["@property"]             = { fg = c.byeok },

    ["@punctuation.delimiter"] = { fg = c.fg_dim },
    ["@punctuation.bracket"]   = { fg = c.fg_dim },
    ["@punctuation.special"]   = { fg = c.byeok },

    ["@tag"]                  = { fg = c.hong },
    ["@tag.builtin"]          = { fg = c.hong },
    ["@tag.attribute"]        = { fg = c.seokhwang },
    ["@tag.delimiter"]        = { fg = c.fg_dim },

    ["@markup.strong"]        = { bold = true },
    ["@markup.italic"]        = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"]     = { underline = true },
    ["@markup.heading"]       = { fg = c.seokhwang, bold = true },
    ["@markup.heading.1"]     = { fg = c.jinsa, bold = true },
    ["@markup.heading.2"]     = { fg = c.seokhwang, bold = true },
    ["@markup.heading.3"]     = { fg = c.noerok, bold = true },
    ["@markup.heading.4"]     = { fg = c.samcheong, bold = true },
    ["@markup.heading.5"]     = { fg = c.jaju, bold = true },
    ["@markup.heading.6"]     = { fg = c.byeok, bold = true },
    ["@markup.quote"]         = { fg = c.comment, italic = true },
    ["@markup.link"]          = { fg = c.samcheong },
    ["@markup.link.url"]      = { fg = c.samcheong, underline = true },
    ["@markup.link.label"]    = { fg = c.byeok },
    ["@markup.raw"]           = { fg = c.noerok },
    ["@markup.list"]          = { fg = c.jinsa },
    ["@markup.list.checked"]  = { fg = c.add },
    ["@markup.list.unchecked"] = { fg = c.fg_dim },
    ["@diff.plus"]            = { fg = c.add },
    ["@diff.minus"]           = { fg = c.delete },
    ["@diff.delta"]           = { fg = c.change },

    ----------------------------------------------------------------
    -- LSP semantic tokens. 서버가 붙어도 색이 흔들리지 않게 고정한다
    ----------------------------------------------------------------
    ["@lsp.type.namespace"]     = { link = "@module" },
    ["@lsp.type.type"]          = { link = "@type" },
    ["@lsp.type.class"]         = { link = "@type" },
    ["@lsp.type.enum"]          = { link = "@type" },
    ["@lsp.type.interface"]     = { link = "@type" },
    ["@lsp.type.struct"]        = { link = "@type" },
    ["@lsp.type.parameter"]     = { link = "@variable.parameter" },
    ["@lsp.type.variable"]      = { link = "@variable" },
    ["@lsp.type.property"]      = { link = "@property" },
    ["@lsp.type.enumMember"]    = { link = "@constant" },
    ["@lsp.type.function"]      = { link = "@function" },
    ["@lsp.type.method"]        = { link = "@function.method" },
    ["@lsp.type.macro"]         = { link = "@function.macro" },
    ["@lsp.type.decorator"]     = { link = "@attribute" },
    ["@lsp.type.keyword"]       = { link = "@keyword" },
    ["@lsp.type.comment"]       = { link = "@comment" },
    ["@lsp.type.string"]        = { link = "@string" },
    ["@lsp.type.number"]        = { link = "@number" },
    ["@lsp.type.operator"]      = { link = "@operator" },
    ["@lsp.typemod.variable.readonly"] = { link = "@constant" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.mod.deprecated"]     = { strikethrough = true },

    LspReferenceText  = { bg = c.bg_sel },
    LspReferenceRead  = { bg = c.bg_sel },
    LspReferenceWrite = { bg = c.bg_sel, underline = true },
    LspInlayHint      = { fg = c.comment, bg = c.bg_line, italic = true },
    LspCodeLens       = { fg = c.comment, italic = true },
    LspSignatureActiveParameter = { fg = c.hong, bold = true },

    ----------------------------------------------------------------
    -- 플러그인
    ----------------------------------------------------------------
    -- gitsigns
    GitSignsAdd    = { fg = c.add },
    GitSignsChange = { fg = c.change },
    GitSignsDelete = { fg = c.delete },
    GitSignsCurrentLineBlame = { fg = c.comment, italic = true },

    -- telescope
    TelescopeNormal       = { fg = c.fg, bg = c.bg_float },
    TelescopeBorder       = { fg = c.border, bg = c.bg_float },
    TelescopeTitle        = { fg = c.seokhwang, bold = true },
    TelescopePromptNormal = { fg = c.fg, bg = c.bg_sel },
    TelescopePromptBorder = { fg = c.bg_sel, bg = c.bg_sel },
    TelescopePromptTitle  = { fg = c.bg, bg = c.jinsa, bold = true },
    TelescopeSelection    = { bg = c.bg_sel, bold = true },
    TelescopeMatching     = { fg = c.seokhwang, bold = true },

    -- nvim-cmp / blink
    CmpItemAbbr           = { fg = c.fg },
    CmpItemAbbrDeprecated = { fg = c.comment, strikethrough = true },
    CmpItemAbbrMatch      = { fg = c.seokhwang, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = c.seokhwang },
    CmpItemKind           = { fg = c.samcheong },
    CmpItemMenu           = { fg = c.comment },
    BlinkCmpMenu          = { fg = c.fg, bg = c.bg_float },
    BlinkCmpMenuBorder    = { fg = c.border, bg = c.bg_float },
    BlinkCmpLabelMatch    = { fg = c.seokhwang, bold = true },

    -- neo-tree / nvim-tree
    NeoTreeNormal       = { fg = c.fg, bg = c.bg_dim },
    NeoTreeNormalNC     = { fg = c.fg, bg = c.bg_dim },
    NeoTreeRootName     = { fg = c.seokhwang, bold = true },
    NeoTreeGitModified  = { fg = c.change },
    NeoTreeGitAdded     = { fg = c.add },
    NeoTreeGitDeleted   = { fg = c.delete },
    NvimTreeNormal      = { fg = c.fg, bg = c.bg_dim },
    NvimTreeRootFolder  = { fg = c.seokhwang, bold = true },
    NvimTreeFolderName  = { fg = c.samcheong },
    NvimTreeOpenedFolderName = { fg = c.samcheong, bold = true },

    -- indent-blankline v3
    IblIndent = { fg = c.border },
    IblScope  = { fg = c.comment },

    -- which-key
    WhichKey          = { fg = c.jinsa },
    WhichKeyGroup     = { fg = c.samcheong },
    WhichKeyDesc      = { fg = c.fg },
    WhichKeySeparator = { fg = c.comment },
    WhichKeyFloat     = { bg = c.bg_float },

    -- notify / noice
    NotifyERRORBorder = { fg = c.error },
    NotifyWARNBorder  = { fg = c.warn },
    NotifyINFOBorder  = { fg = c.info },
    NotifyDEBUGBorder = { fg = c.comment },
    NotifyTRACEBorder = { fg = c.jaju },
    NoiceCmdlinePopupBorder = { fg = c.border },
    NoiceCmdlineIcon  = { fg = c.seokhwang },

    -- flash / leap / hop
    FlashLabel   = { fg = c.bg, bg = c.jinsa, bold = true },
    FlashMatch   = { fg = c.fg, bg = c.bg_sel },
    LeapLabel    = { fg = c.bg, bg = c.jinsa, bold = true },
    HopNextKey   = { fg = c.jinsa, bold = true },

    -- bufferline
    BufferLineFill = { bg = c.bg_dim },

    -- lazy / mason
    LazyNormal   = { fg = c.fg, bg = c.bg_float },
    LazyProgressDone = { fg = c.noerok },
    MasonNormal  = { fg = c.fg, bg = c.bg_float },
    MasonHighlight = { fg = c.seokhwang },

    -- todo-comments
    TodoBgTODO = { fg = c.bg, bg = c.info, bold = true },
    TodoFgTODO = { fg = c.info },
    TodoBgFIX  = { fg = c.bg, bg = c.error, bold = true },
    TodoFgFIX  = { fg = c.error },
    TodoBgWARN = { fg = c.bg, bg = c.warn, bold = true },
    TodoFgWARN = { fg = c.warn },
  }

  return hl
end

-- :terminal 의 16색. ANSI 순서로 안료를 배치했다
function M.terminal(c)
  return {
    c.bg, c.jinsa, c.noerok, c.seokhwang,
    c.samcheong, c.jaju, c.byeok, c.fg_dim,
    c.comment, c.hong, c.noerok, c.change,
    c.info, c.jaju, c.byeok, c.fg,
  }
end

return M
