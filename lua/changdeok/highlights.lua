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
    -- 사용되지 않는 코드. LSP 가 붙이는 그룹이고 snacks.dim 도 여기에 링크한다.
    -- 진단이 아니라 "덜 중요함"의 표시라서 주석 등급으로 눕힌다.
    DiagnosticUnnecessary      = { fg = c.comment },
    DiagnosticDeprecated       = { strikethrough = true, sp = c.comment },

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

    -- indent-blankline v3.
    -- 들여쓰기 가이드는 정보를 전달하지 않는 장식이라 경계선과 같은 등급이다.
    -- 현재 스코프만 한 단계 올린다.
    IblIndent     = { fg = c.border },
    IblWhitespace = { fg = c.border },
    IblScope      = { fg = c.comment },

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

    -- bufferline.
    -- 선택된 버퍼만 편집기 배경(bg)으로 올려서 종이 한 장 앞으로 나온 것처럼
    -- 보이게 하고, 나머지는 bg_dim 으로 눕힌다.
    BufferLineFill              = { bg = c.bg_dim },
    BufferLineBackground        = { fg = c.comment, bg = c.bg_dim },
    BufferLineBufferSelected    = { fg = c.fg, bg = bg, bold = true },
    BufferLineBufferVisible     = { fg = c.fg_dim, bg = c.bg_dim },
    BufferLineIndicatorSelected = { fg = c.jinsa, bg = bg },
    BufferLineIndicatorVisible  = { fg = c.border, bg = c.bg_dim },
    BufferLineModified          = { fg = c.change, bg = c.bg_dim },
    BufferLineModifiedSelected  = { fg = c.change, bg = bg },
    BufferLineModifiedVisible   = { fg = c.change, bg = c.bg_dim },
    BufferLineSeparator         = { fg = c.bg_dim, bg = c.bg_dim },
    BufferLineSeparatorSelected = { fg = c.bg_dim, bg = bg },
    BufferLineSeparatorVisible  = { fg = c.bg_dim, bg = c.bg_dim },
    BufferLineCloseButton         = { fg = c.comment, bg = c.bg_dim },
    BufferLineCloseButtonSelected = { fg = c.jinsa, bg = bg },
    BufferLineCloseButtonVisible  = { fg = c.comment, bg = c.bg_dim },
    BufferLineDuplicate         = { fg = c.comment, bg = c.bg_dim, italic = true },
    BufferLineDuplicateSelected = { fg = c.fg_dim, bg = bg, italic = true },
    BufferLineDuplicateVisible  = { fg = c.comment, bg = c.bg_dim, italic = true },
    BufferLineNumbers           = { fg = c.comment, bg = c.bg_dim },
    BufferLineNumbersSelected   = { fg = c.jaju, bg = bg, bold = true },
    BufferLineTab               = { fg = c.comment, bg = c.bg_dim },
    BufferLineTabSelected       = { fg = c.seokhwang, bg = bg, bold = true },
    BufferLineTabSeparator      = { fg = c.bg_dim, bg = c.bg_dim },
    BufferLineTabSeparatorSelected = { fg = c.bg_dim, bg = bg },
    BufferLineError             = { fg = c.error, bg = c.bg_dim },
    BufferLineErrorSelected     = { fg = c.error, bg = bg },
    BufferLineWarning           = { fg = c.warn, bg = c.bg_dim },
    BufferLineWarningSelected   = { fg = c.warn, bg = bg },
    BufferLineInfo              = { fg = c.info, bg = c.bg_dim },
    BufferLineInfoSelected      = { fg = c.info, bg = bg },
    BufferLineHint              = { fg = c.hint, bg = c.bg_dim },
    BufferLineHintSelected      = { fg = c.hint, bg = bg },

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

    ----------------------------------------------------------------
    -- snacks.nvim — LazyVim 의 기본 피커·대시보드·알림·들여쓰기
    --
    -- snacks 는 자기 그룹을 default 링크로 깔기 때문에 대부분은 우리가 정한
    -- Normal / NormalFloat / Title 을 이미 물려받는다. 여기서 다시 쓰는 것은
    -- 물려받은 색이 이 팔레트의 원칙과 어긋나는 자리들이다.
    ----------------------------------------------------------------
    -- 창 공통
    SnacksNormal     = { fg = c.fg, bg = c.bg_float },
    SnacksNormalNC   = { fg = c.fg, bg = c.bg_float },
    SnacksWinBar     = { fg = c.seokhwang, bold = true },
    SnacksWinBarNC   = { fg = c.comment },
    SnacksFooter     = { fg = c.comment },
    SnacksFooterDesc = { fg = c.fg_dim },
    SnacksFooterKey  = { fg = c.seokhwang },
    SnacksWinKey     = { fg = c.jinsa },      -- 단축키. keyword 자리와 같은 안료
    SnacksWinKeySep  = { fg = c.comment },
    SnacksWinKeyDesc = { fg = c.fg },

    -- 피커. telescope 와 같은 처리를 따른다. 팝업 본문은 bg_float,
    -- 입력 줄만 bg_sel 로 한 칸 들어가 보이게 한다
    SnacksPicker                  = { fg = c.fg, bg = c.bg_float },
    SnacksPickerBorder            = { fg = c.border, bg = c.bg_float },
    SnacksPickerTitle             = { fg = c.seokhwang, bold = true },
    SnacksPickerFooter            = { fg = c.comment, bg = c.bg_float },
    SnacksPickerCursorLine        = { bg = c.bg_sel },
    SnacksPickerBox               = { fg = c.fg, bg = c.bg_float },
    SnacksPickerBoxBorder         = { fg = c.border, bg = c.bg_float },
    SnacksPickerBoxTitle          = { fg = c.seokhwang, bold = true },
    SnacksPickerBoxCursorLine     = { bg = c.bg_sel },
    SnacksPickerInput             = { fg = c.fg, bg = c.bg_sel },
    SnacksPickerInputBorder       = { fg = c.bg_sel, bg = c.bg_sel },
    SnacksPickerInputTitle        = { fg = c.bg, bg = c.jinsa, bold = true },
    SnacksPickerInputCursorLine   = { bg = c.bg_sel },
    SnacksPickerInputSearch       = { fg = c.jinsa },
    SnacksPickerList              = { fg = c.fg, bg = c.bg_float },
    SnacksPickerListBorder        = { fg = c.border, bg = c.bg_float },
    SnacksPickerListTitle         = { fg = c.seokhwang, bold = true },
    SnacksPickerListCursorLine    = { bg = c.bg_sel, bold = true },
    SnacksPickerPreview           = { fg = c.fg, bg = c.bg_float },
    SnacksPickerPreviewBorder     = { fg = c.border, bg = c.bg_float },
    SnacksPickerPreviewTitle      = { fg = c.seokhwang, bold = true },
    SnacksPickerPreviewCursorLine = { bg = c.bg_sel },
    -- 항목. 일치 부분은 TelescopeMatching 과 같은 석황
    SnacksPickerMatch       = { fg = c.seokhwang, bold = true },
    SnacksPickerPrompt      = { fg = c.jinsa },
    SnacksPickerSelected    = { fg = c.jinsa, bold = true },
    SnacksPickerUnselected  = { fg = c.comment },
    SnacksPickerFile        = { fg = c.fg },
    SnacksPickerDir         = { fg = c.comment },
    SnacksPickerDirectory   = { fg = c.samcheong },
    SnacksPickerPathHidden  = { fg = c.comment },
    SnacksPickerPathIgnored = { fg = c.comment },
    SnacksPickerDimmed      = { fg = c.comment },
    SnacksPickerIdx         = { fg = c.jaju },
    SnacksPickerRow         = { fg = c.jaju },
    SnacksPickerCol         = { fg = c.comment },
    SnacksPickerDelim       = { fg = c.fg_dim },
    SnacksPickerSpecial     = { fg = c.byeok },
    SnacksPickerLabel       = { fg = c.byeok, bold = true },
    SnacksPickerTotals      = { fg = c.comment },
    SnacksPickerTree        = { fg = c.border },
    SnacksPickerToggle      = { fg = c.info },
    SnacksPickerDesc        = { fg = c.comment },
    SnacksPickerComment     = { fg = c.comment },
    SnacksPickerCode        = { fg = c.noerok },
    SnacksPickerBufNr       = { fg = c.jaju },
    SnacksPickerBufFlags    = { fg = c.comment },
    SnacksPickerGitStatus         = { fg = c.change },
    SnacksPickerGitStatusAdded    = { fg = c.add },
    SnacksPickerGitStatusModified = { fg = c.change },
    SnacksPickerGitStatusDeleted  = { fg = c.delete },
    SnacksPickerGitStatusStaged   = { fg = c.add },
    SnacksPickerGitStatusUntracked = { fg = c.comment },
    SnacksPickerGitBranch         = { fg = c.samcheong },
    SnacksPickerGitBranchCurrent  = { fg = c.samcheong, bold = true },
    SnacksPickerGitCommit         = { fg = c.jaju },
    SnacksPickerGitAuthor         = { fg = c.hong },
    SnacksPickerGitDate           = { fg = c.comment },

    -- 대시보드. 현판처럼 머리글에 진사를 세우고 나머지는 가라앉힌다
    SnacksDashboardNormal   = { fg = c.fg, bg = bg },
    SnacksDashboardTerminal = { fg = c.fg, bg = bg },
    SnacksDashboardHeader   = { fg = c.jinsa, bold = true },
    SnacksDashboardTitle    = { fg = c.seokhwang, bold = true },
    SnacksDashboardIcon     = { fg = c.seokhwang },
    SnacksDashboardDesc     = { fg = c.fg },
    SnacksDashboardKey      = { fg = c.jaju },
    SnacksDashboardFile     = { fg = c.samcheong },
    SnacksDashboardDir      = { fg = c.comment },
    SnacksDashboardFooter   = { fg = c.comment, italic = true },
    SnacksDashboardSpecial  = { fg = c.byeok },

    -- 들여쓰기. snacks 기본값은 Scope 를 Special(벽) 로 링크하는데, 그러면
    -- 장식선이 본문보다 시끄러워진다. 규칙 4 의 장식 등급으로 내린다
    SnacksIndent      = { fg = c.border },
    SnacksIndentBlank = { fg = c.border },
    SnacksIndentScope = { fg = c.comment },
    SnacksIndentChunk = { fg = c.comment },

    -- 알림. 테두리와 아이콘만 칠하고 본문은 배경 블록 없이 둔다
    SnacksNotifierIconError  = { fg = c.error },
    SnacksNotifierIconWarn   = { fg = c.warn },
    SnacksNotifierIconInfo   = { fg = c.info },
    SnacksNotifierIconDebug  = { fg = c.comment },
    SnacksNotifierIconTrace  = { fg = c.jaju },
    SnacksNotifierBorderError = { fg = c.error },
    SnacksNotifierBorderWarn  = { fg = c.warn },
    SnacksNotifierBorderInfo  = { fg = c.info },
    SnacksNotifierBorderDebug = { fg = c.comment },
    SnacksNotifierBorderTrace = { fg = c.jaju },
    SnacksNotifierTitleError = { fg = c.error, bold = true },
    SnacksNotifierTitleWarn  = { fg = c.warn, bold = true },
    SnacksNotifierTitleInfo  = { fg = c.info, bold = true },
    SnacksNotifierTitleDebug = { fg = c.comment, bold = true },
    SnacksNotifierTitleTrace = { fg = c.jaju, bold = true },
    SnacksNotifierFooterError = { fg = c.comment },
    SnacksNotifierFooterWarn  = { fg = c.comment },
    SnacksNotifierFooterInfo  = { fg = c.comment },
    SnacksNotifierMinimal     = { fg = c.fg, bg = c.bg_float },
    SnacksNotifierHistory     = { fg = c.fg, bg = c.bg_float },
    SnacksNotifierHistoryTitle = { fg = c.seokhwang, bold = true },
    SnacksNotifierHistoryDateTime = { fg = c.comment },

    -- 입력창. 기본값은 테두리까지 DiagnosticInfo(삼청)로 칠해서 입력만 해도
    -- 진단이 뜬 것처럼 보인다. 테두리는 경계선 색으로 돌린다
    SnacksInput       = { fg = c.fg, bg = c.bg_float },
    SnacksInputBorder = { fg = c.border, bg = c.bg_float },
    SnacksInputTitle  = { fg = c.seokhwang, bold = true },
    SnacksInputIcon   = { fg = c.jinsa },
    SnacksInputPrompt = { fg = c.seokhwang },

    -- 그 외
    SnacksScratchTitle  = { fg = c.seokhwang, bold = true },
    SnacksScratchFooter = { fg = c.comment },
    SnacksScratchKey    = { fg = c.jaju },
    SnacksScratchDesc   = { fg = c.fg_dim },
    SnacksZenIcon       = { fg = c.warn },

    ----------------------------------------------------------------
    -- fzf-lua. LazyVim 의 또 하나의 기본 피커
    --
    -- FzfLuaFzf* 는 nvim 이 아니라 fzf 프로세스에 --color 로 넘어가는 값이라
    -- 배경을 지정해도 대체로 무시된다. 전경만 정한다
    ----------------------------------------------------------------
    FzfLuaNormal        = { fg = c.fg, bg = c.bg_float },
    FzfLuaBorder        = { fg = c.border, bg = c.bg_float },
    FzfLuaTitle         = { fg = c.seokhwang, bold = true },
    FzfLuaTitleFlags    = { fg = c.comment },
    FzfLuaPreviewNormal = { fg = c.fg, bg = c.bg_float },
    FzfLuaPreviewBorder = { fg = c.border, bg = c.bg_float },
    FzfLuaPreviewTitle  = { fg = c.seokhwang, bold = true },
    FzfLuaHelpNormal    = { fg = c.fg, bg = c.bg_float },
    FzfLuaHelpBorder    = { fg = c.border, bg = c.bg_float },
    FzfLuaBackdrop      = { bg = c.bg_dim },
    FzfLuaCursor        = { fg = c.bg, bg = c.fg },
    FzfLuaCursorLine    = { bg = c.bg_sel },
    FzfLuaCursorLineNr  = { fg = c.seokhwang, bold = true },
    FzfLuaSearch        = { fg = c.bg, bg = c.seokhwang },
    FzfLuaHeaderBind    = { fg = c.jinsa },
    FzfLuaHeaderText    = { fg = c.fg_dim },
    FzfLuaDirIcon       = { fg = c.samcheong },
    FzfLuaDirPart       = { fg = c.comment },
    FzfLuaFilePart      = { fg = c.fg },
    FzfLuaPathLineNr    = { fg = c.comment },
    FzfLuaPathColNr     = { fg = c.comment },
    FzfLuaBufName       = { fg = c.fg },
    FzfLuaBufNr         = { fg = c.jaju },
    FzfLuaBufId         = { fg = c.jaju },
    FzfLuaBufLineNr     = { fg = c.comment },
    FzfLuaBufFlagCur    = { fg = c.jinsa },
    FzfLuaBufFlagAlt    = { fg = c.samcheong },
    FzfLuaTabTitle      = { fg = c.samcheong, bold = true },
    FzfLuaTabMarker     = { fg = c.seokhwang, bold = true },
    FzfLuaLivePrompt    = { fg = c.jinsa },
    FzfLuaLiveSym       = { fg = c.jinsa },
    FzfLuaScrollBorderEmpty = { fg = c.border },
    FzfLuaScrollBorderFull  = { fg = c.fg_dim },
    FzfLuaScrollFloatEmpty  = { bg = c.bg_float },
    FzfLuaScrollFloatFull   = { bg = c.bg_sel },
    FzfLuaFzfNormal     = { fg = c.fg },
    FzfLuaFzfBorder     = { fg = c.border },
    FzfLuaFzfCursorLine = { fg = c.fg, bg = c.bg_sel, bold = true },
    FzfLuaFzfMatch      = { fg = c.seokhwang, bold = true },
    FzfLuaFzfPointer    = { fg = c.jinsa },
    FzfLuaFzfMarker     = { fg = c.jinsa },
    FzfLuaFzfPrompt     = { fg = c.jinsa },
    FzfLuaFzfQuery      = { fg = c.fg },
    FzfLuaFzfInfo       = { fg = c.comment },
    FzfLuaFzfHeader     = { fg = c.fg_dim },
    FzfLuaFzfGutter     = { bg = c.bg_float },
    FzfLuaFzfSeparator  = { fg = c.border },
    FzfLuaFzfScrollbar  = { fg = c.border },
    FzfLuaFzfSpinner    = { fg = c.seokhwang },

    ----------------------------------------------------------------
    -- trouble.nvim. 목록 창이라 사이드바와 같은 bg_dim 에 앉힌다
    ----------------------------------------------------------------
    TroubleNormal        = { fg = c.fg, bg = c.bg_dim },
    TroubleNormalNC      = { fg = c.fg, bg = c.bg_dim },
    TroubleText          = { fg = c.fg },
    TroublePreview       = { bg = c.bg_sel },
    TroubleFilename      = { fg = c.samcheong },
    TroubleBasename      = { fg = c.samcheong, bold = true },
    TroubleDirectory     = { fg = c.comment },
    TroubleIconDirectory = { fg = c.samcheong },
    TroubleIcon          = { fg = c.samcheong },
    TroubleSource        = { fg = c.comment },
    TroubleCode          = { fg = c.byeok },
    TroublePos           = { fg = c.comment },
    TroubleCount         = { fg = c.jaju },
    -- 목록의 들여쓰기 선도 장식이다
    TroubleIndent           = { fg = c.border },
    TroubleIndentTop        = { fg = c.border },
    TroubleIndentMiddle     = { fg = c.border },
    TroubleIndentLast       = { fg = c.border },
    TroubleIndentWs         = { fg = c.border },
    TroubleIndentFoldOpen   = { fg = c.comment },
    TroubleIndentFoldClosed = { fg = c.seokhwang },

    ----------------------------------------------------------------
    -- nvim-dap / nvim-dap-ui
    --
    -- 중단점은 실행을 멈추는 표시라 진단의 error 색을 그대로 쓴다. 대신
    -- 멈춘 줄은 배경 블록이 아니라 선택 영역과 같은 bg_sel 로만 표시한다
    ----------------------------------------------------------------
    DapBreakpoint          = { fg = c.error },
    DapBreakpointCondition = { fg = c.warn },
    DapBreakpointRejected  = { fg = c.comment },
    DapLogPoint            = { fg = c.info },
    DapStopped             = { fg = c.seokhwang },
    DapStoppedLine         = { bg = c.bg_sel },
    NvimDapVirtualText        = { fg = c.comment, italic = true },
    NvimDapVirtualTextChanged = { fg = c.change, italic = true },
    NvimDapVirtualTextError   = { fg = c.error, italic = true },
    NvimDapVirtualTextInfo    = { fg = c.info, italic = true },

    DapUINormal      = { fg = c.fg, bg = c.bg_dim },
    DapUIFloatNormal = { fg = c.fg, bg = c.bg_float },
    DapUIFloatBorder = { fg = c.border, bg = c.bg_float },
    DapUIEndOfBuffer = { fg = c.border },
    DapUIDecoration  = { fg = c.border },
    DapUIVariable      = { fg = c.fg },
    DapUIValue         = { fg = c.fg },
    DapUIModifiedValue = { fg = c.jinsa, bold = true },
    DapUIScope         = { fg = c.samcheong },
    DapUIType          = { fg = c.samcheong },
    DapUISource        = { fg = c.jaju },
    DapUILineNumber    = { fg = c.comment },
    DapUIFrameName     = { fg = c.fg },
    DapUICurrentFrameName = { fg = c.seokhwang, bold = true },
    DapUIThread        = { fg = c.noerok },
    DapUIStoppedThread = { fg = c.seokhwang },
    DapUIBreakpointsPath        = { fg = c.samcheong },
    DapUIBreakpointsInfo        = { fg = c.info },
    DapUIBreakpointsCurrentLine = { fg = c.seokhwang, bold = true },
    DapUIBreakpointsLine        = { fg = c.comment },
    DapUIBreakpointsDisabledLine = { fg = c.comment },
    DapUIWatchesEmpty = { fg = c.comment },
    DapUIWatchesValue = { fg = c.fg },
    DapUIWatchesError = { fg = c.error },
    DapUIWinSelect    = { fg = c.seokhwang, bold = true },
    -- 조작 버튼. 실행 계열은 뇌록, 멈춤은 error, 이동은 삼청
    DapUIPlayPause     = { fg = c.noerok },
    DapUIPlayPauseNC   = { fg = c.noerok },
    DapUIRestart       = { fg = c.noerok },
    DapUIRestartNC     = { fg = c.noerok },
    DapUIStop          = { fg = c.error },
    DapUIStopNC        = { fg = c.error },
    DapUIStepOver      = { fg = c.samcheong },
    DapUIStepOverNC    = { fg = c.samcheong },
    DapUIStepInto      = { fg = c.samcheong },
    DapUIStepIntoNC    = { fg = c.samcheong },
    DapUIStepOut       = { fg = c.samcheong },
    DapUIStepOutNC     = { fg = c.samcheong },
    DapUIStepBack      = { fg = c.samcheong },
    DapUIStepBackNC    = { fg = c.samcheong },
    DapUIUnavailable   = { fg = c.comment },
    DapUIUnavailableNC = { fg = c.comment },

    ----------------------------------------------------------------
    -- nvim-treesitter-context. 화면 위에 붙는 문맥 줄이다.
    -- 색을 새로 주면 코드가 두 번 칠해진 것처럼 보이므로 배경만 한 단계 올린다
    ----------------------------------------------------------------
    TreesitterContext           = { bg = c.bg_line },
    TreesitterContextLineNumber = { fg = c.comment, bg = c.bg_line },
    TreesitterContextBottom     = { underline = true, sp = c.border },
    TreesitterContextSeparator  = { fg = c.border },

    ----------------------------------------------------------------
    -- mini.nvim
    --
    -- mini.icons 의 그룹 이름은 색 이름이다. 안료 쪽에서 가장 가까운 것으로
    -- 보낸다. 진사가 붉은 안료, 석황이 노란 안료라 Red / Yellow 는 그대로 붙는다
    ----------------------------------------------------------------
    MiniIconsRed    = { fg = c.jinsa },
    MiniIconsOrange = { fg = c.hong },
    MiniIconsYellow = { fg = c.seokhwang },
    MiniIconsGreen  = { fg = c.noerok },
    MiniIconsCyan   = { fg = c.byeok },
    MiniIconsAzure  = { fg = c.samcheong },
    MiniIconsBlue   = { fg = c.samcheong },
    MiniIconsPurple = { fg = c.jaju },
    MiniIconsGrey   = { fg = c.fg_dim },

    -- mini.statusline. 모드 표시는 반전이라 전경에 배경색을 쓴다
    MiniStatuslineModeNormal  = { fg = c.bg, bg = c.samcheong, bold = true },
    MiniStatuslineModeInsert  = { fg = c.bg, bg = c.noerok, bold = true },
    MiniStatuslineModeVisual  = { fg = c.bg, bg = c.jaju, bold = true },
    MiniStatuslineModeReplace = { fg = c.bg, bg = c.jinsa, bold = true },
    MiniStatuslineModeCommand = { fg = c.bg, bg = c.seokhwang, bold = true },
    MiniStatuslineModeOther   = { fg = c.bg, bg = c.byeok, bold = true },
    MiniStatuslineDevinfo     = { fg = c.fg_dim, bg = c.bg_float },
    MiniStatuslineFilename    = { fg = c.fg, bg = c.bg_float },
    MiniStatuslineFileinfo    = { fg = c.fg_dim, bg = c.bg_float },
    MiniStatuslineInactive    = { fg = c.comment, bg = c.bg_dim },

    ----------------------------------------------------------------
    -- render-markdown.nvim
    --
    -- 제목의 배경 블록은 커서 라인과 같은 한 단계만 쓴다. 여섯 단계를 각각
    -- 다른 색으로 칠하면 문서가 색표본처럼 된다. 글자색은 이미 정해둔
    -- @markup.heading.1~6 을 그대로 링크해서 트리시터와 어긋나지 않게 한다
    ----------------------------------------------------------------
    RenderMarkdownH1 = { link = "@markup.heading.1" },
    RenderMarkdownH2 = { link = "@markup.heading.2" },
    RenderMarkdownH3 = { link = "@markup.heading.3" },
    RenderMarkdownH4 = { link = "@markup.heading.4" },
    RenderMarkdownH5 = { link = "@markup.heading.5" },
    RenderMarkdownH6 = { link = "@markup.heading.6" },
    RenderMarkdownH1Bg = { bg = c.bg_line },
    RenderMarkdownH2Bg = { bg = c.bg_line },
    RenderMarkdownH3Bg = { bg = c.bg_line },
    RenderMarkdownH4Bg = { bg = c.bg_line },
    RenderMarkdownH5Bg = { bg = c.bg_line },
    RenderMarkdownH6Bg = { bg = c.bg_line },
    RenderMarkdownCode         = { bg = c.bg_dim },
    RenderMarkdownCodeBorder   = { bg = c.bg_line },
    RenderMarkdownCodeInline   = { fg = c.noerok, bg = c.bg_dim },
    RenderMarkdownCodeInfo     = { fg = c.comment, bg = c.bg_dim },
    RenderMarkdownCodeFallback = { fg = c.fg, bg = c.bg_dim },
    RenderMarkdownBullet    = { fg = c.jinsa },
    RenderMarkdownDash      = { fg = c.border },
    RenderMarkdownIndent    = { fg = c.border },
    RenderMarkdownPadding   = { fg = c.border },
    RenderMarkdownSign      = { fg = c.border },
    RenderMarkdownQuote     = { fg = c.comment },
    RenderMarkdownQuote1    = { fg = c.comment },
    RenderMarkdownQuote2    = { fg = c.comment },
    RenderMarkdownQuote3    = { fg = c.comment },
    RenderMarkdownQuote4    = { fg = c.comment },
    RenderMarkdownQuote5    = { fg = c.comment },
    RenderMarkdownQuote6    = { fg = c.comment },
    RenderMarkdownChecked   = { fg = c.add },
    RenderMarkdownUnchecked = { fg = c.fg_dim },
    RenderMarkdownTodo      = { fg = c.warn },
    RenderMarkdownTableHead = { fg = c.seokhwang },
    RenderMarkdownTableRow  = { fg = c.fg_dim },
    RenderMarkdownLink      = { fg = c.samcheong },
    RenderMarkdownLinkTitle = { fg = c.byeok },
    RenderMarkdownWikiLink  = { fg = c.samcheong, underline = true },
    RenderMarkdownMath      = { fg = c.byeok },
    RenderMarkdownHtmlComment = { fg = c.comment, italic = true },
    RenderMarkdownInlineHighlight = { fg = c.bg, bg = c.seokhwang },
    RenderMarkdownError   = { fg = c.error },
    RenderMarkdownWarn    = { fg = c.warn },
    RenderMarkdownInfo    = { fg = c.info },
    RenderMarkdownHint    = { fg = c.hint },
    RenderMarkdownSuccess = { fg = c.add },
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
