-- changdeok.nvim 로드 검증.
--
--   nvim --headless --clean --cmd "set rtp+=$PWD" -l scripts/load_check.lua
--
-- 이 스크립트가 따로 필요한 이유:
-- `nvim --headless "+colorscheme ..." +qa` 는 colorscheme 이 없어도, lua 파일에
-- 문법 에러가 있어도 종료 코드 0 을 돌려준다. 즉 CI 에 그대로 넣으면 무엇이
-- 깨지든 항상 초록불이 된다. 실패를 종료 코드로 알리려면 pcall 로 감싸고
-- 직접 os.exit(1) 을 불러야 한다.
--
-- 이름이 붙는 것만 보지 않고 하이라이트가 실제로 칠해졌는지까지 본다.
-- 팔레트가 비어도 :colorscheme 자체는 성공하기 때문이다.

local variants = { "injeong", "buyong", "nakseon" }

-- 낙선재는 단청을 하지 않은 백골집이라 밝다. 다크의 명도 반전이 아니므로
-- background 가 실제로 light 로 뒤집히는지 확인한다 (RULES.md 규칙 3).
local expected_bg = { injeong = "dark", buyong = "dark", nakseon = "light" }

local failed = 0

local function fail(fmt, ...)
  io.stderr:write("  FAIL  " .. string.format(fmt, ...) .. "\n")
  failed = failed + 1
end

for _, v in ipairs(variants) do
  local name = "changdeok-" .. v
  local ok, err = pcall(vim.cmd.colorscheme, name)

  if not ok then
    fail("%s 로드 실패: %s", name, tostring(err))
  else
    if vim.g.colors_name ~= name then
      fail("%s: colors_name 이 %q", name, tostring(vim.g.colors_name))
    end

    if vim.o.background ~= expected_bg[v] then
      fail("%s: background 가 %q, 기대값 %q", name, vim.o.background, expected_bg[v])
    end

    -- 팔레트가 비어 있으면 :colorscheme 은 성공해도 Normal 이 비어 있다.
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    if not normal.fg then
      fail("%s: Normal 의 fg 가 설정되지 않았다", name)
    end

    if failed == 0 then
      print(("  ok    %-20s bg=%-5s Normal.fg=#%06x"):format(name, vim.o.background, normal.fg))
    end
  end
end

if failed > 0 then
  io.stderr:write(("\n%d건 실패\n"):format(failed))
  os.exit(1)
end

print(("\n변형 %d개 전부 정상"):format(#variants))
os.exit(0)
