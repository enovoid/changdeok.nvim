-- changdeok.nvim
-- 창덕궁 세 장소에서 뽑은 Neovim 컬러스킴
--
--   injeong  인정전 · 모로단청. 따뜻한 어둠
--   buyong   부용지 · 후원 연못. 차분한 청록
--   nakseon  낙선재 · 단청 없는 백골집. 한지 밝음
local palette = require("changdeok.palette")
local highlights = require("changdeok.highlights")

local M = {}

M.defaults = {
  variant = "injeong",
  transparent = false,     -- 배경을 터미널에 맡긴다
  dim_inactive = true,     -- 비활성 창을 한 단계 어둡게
  italic_comments = true,
  terminal_colors = true,
  overrides = {},          -- { Comment = { fg = "#..." } }
}

M.options = vim.deepcopy(M.defaults)

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", M.options, opts or {})
end

function M.load(variant)
  local o = vim.tbl_deep_extend("force", M.options, { variant = variant or M.options.variant })

  if vim.g.colors_name then vim.cmd("hi clear") end
  if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
  vim.o.termguicolors = true
  vim.o.background = palette.light[o.variant] and "light" or "dark"
  vim.g.colors_name = "changdeok-" .. o.variant

  local c = palette.get(o.variant)
  local groups = highlights.build(c, o)

  for group, spec in pairs(vim.tbl_deep_extend("force", groups, o.overrides)) do
    vim.api.nvim_set_hl(0, group, spec)
  end

  if o.terminal_colors then
    for i, color in ipairs(highlights.terminal(c)) do
      vim.g["terminal_color_" .. (i - 1)] = color
    end
  end
end

-- 세 변형을 순환한다. 낮/밤 전환용으로 키에 매핑해두면 편하다
function M.cycle()
  local cur = (vim.g.colors_name or ""):gsub("^changdeok%-", "")
  local list = palette.variants
  local idx = 1
  for i, v in ipairs(list) do
    if v == cur then idx = i % #list + 1 break end
  end
  vim.cmd.colorscheme("changdeok-" .. list[idx])
  vim.notify("changdeok: " .. list[idx])
end

M.palette = palette
return M
