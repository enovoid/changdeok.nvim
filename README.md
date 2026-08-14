# changdeok.nvim 昌德宮

창덕궁의 서로 다른 세 장소에서 각각 뽑아낸 Neovim 컬러스킴.

하나의 팔레트를 밝기만 바꿔 돌려쓴 게 아니다. 실제로 색 처리가 다른 세 건물이다.
단청이 가장 빽빽한 곳, 단청이 거의 없는 곳, 그리고 아예 칠하지 않은 곳.

| 변형 | 장소 | 성격 | 배경 |
|---|---|---|---|
| `changdeok-injeong` | 인정전 仁政殿 | 따뜻한 어둠. 붉은 기둥과 금박 | `#191614` |
| `changdeok-buyong` | 부용지 芙蓉池 | 차분한 청록. 물빛과 이끼 | `#141a19` |
| `changdeok-nakseon` | 낙선재 樂善齋 | 한지 밝음. 칠하지 않은 소나무 | `#ece5d6` |

## 왜 이 세 곳인가

**인정전**은 창덕궁의 정전으로, 모로단청이 가장 빽빽하게 올라간 건물이다. 밤에
등불이 들면 붉은 기둥과 금박 자리가 먼저 살아나고 나머지는 어둠에 잠긴다. 배경에
붉은 기미를 남기고 진사와 석황을 앞에 세웠다.

**부용지**는 후원의 연못이다. 여기엔 단청이 거의 없다. 물빛과 이끼, 소나무,
화강암이 색의 전부고 가을 단풍 한 점이 유일한 난색이다. 배경을 청록으로 눕히고
난색은 keyword 하나에만 남겼다.

**낙선재**는 헌종이 사대부 주택 양식으로 지은 곳이다. 궁궐 안인데도 단청을 하지
않은 백골집이라, 칠하지 않은 소나무 결과 한지 창호, 황토 벽, 전돌의 회색이 전부다.
다른 변형의 명도를 뒤집어 만든 밝은 테마가 아니라, 애초에 색 처리가 다른 건물이라
안료 대신 재료의 색으로 짰다.

## 쓰지 않은 색

오방색(청·적·황·백·흑)은 방위와 상징을 **멀리서** 읽히게 하려고 채도를 끝까지 올린
의례용 팔레트다. 색동과 궁궐 외부 단청처럼 원거리 시인성이 목적인 곳에 쓰였지,
30cm 앞에서 여덟 시간 보라고 만든 색이 아니다. 세 변형 모두 구문 강조에서 제외했다.

대신 **오간색**(녹·벽·홍·유황·자)과 **실제 광물 안료의 탁도**를 기준으로 삼았다.
뇌록은 회색이 섞인 탁한 청록이고, 석간주는 붉은 갈색 흙빛이며, 삼청도 형광 파랑이
아니라 가라앉은 남색이다. 디지털 원색과 다르다.

원색이 돌아오는 곳은 진단 메시지 하나뿐이고, 그것도 배경 블록이 아니라 물결
밑줄(`undercurl`)로 칠한다. 배경 블록은 코드를 가린다.

## 매핑은 고정이다

변형을 바꿔도 안료와 구문의 대응은 유지된다. 색이 바뀌어도 코드를 읽는 습관은
바뀌지 않아야 하기 때문이다.

| 안료 | 한자 | 구문 역할 | 이유 |
|---|---|---|---|
| 진사 / 석간주 | 辰砂 | keyword, return | 기둥. 구조를 지탱하는 색 |
| 석황 | 石黃 | function, heading | 금박 자리에 쓰인 강조색 |
| 뇌록 | 磊碌 | string | 단청의 바탕칠. 가장 넓은 면적 |
| 삼청 | 三靑 | type, class | 가라앉은 남동석 청색 |
| 자주 | 紫朱 | constant, number | 오간색 |
| 벽 | 碧 | escape, property | 오간색 |
| 홍 | 紅 | parameter, tag | 오간색 |

## 대비

색을 눈대중으로 고르지 않았다. 세 변형 합쳐 전경/배경 210쌍을 측정한다.

- 본문 **7:1** (WCAG AAA)
- 구문·UI 텍스트 **4.5:1**
- 선택 영역 **3:1**
- 창 경계와 들여쓰기 가이드 **1.4:1** — 정보를 전달하지 않는 장식 요소다. WCAG 3:1은
  의미를 가진 UI 컴포넌트 기준이라, 여기 적용하면 분할선이 본문보다 시끄러워진다.

`bg` 하나가 아니라 `bg`, `bg_dim`, `bg_float`, `bg_line` 네 배경 전부에 대해 계산한 뒤
**가장 불리한 쌍**으로 판정한다. 팝업이나 사이드바 위에서 대비가 깨지는 게 실제로
가장 흔한 실패 지점이다.

```sh
python3 scripts/contrast_check.py   # 미달이 하나라도 있으면 종료 코드 1
```

현재 210쌍 검사, 실패 0건. CI에서 push마다 돌린다.

## 설치

lazy.nvim:

```lua
{
  "계정명/changdeok.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    variant = "injeong",     -- "injeong" | "buyong" | "nakseon"
    transparent = false,
    dim_inactive = true,
    italic_comments = true,
    terminal_colors = true,
  },
  config = function(_, opts)
    require("changdeok").setup(opts)
  end,
},
{ "LazyVim/LazyVim", opts = { colorscheme = "changdeok-injeong" } },
```

LazyVim은 colorscheme을 자체 관리하므로 두 번째 블록이 필요하다. `vim.cmd.colorscheme`을
직접 호출하면 나중에 기본값으로 덮어써진다.

세 변형 순환:

```lua
vim.keymap.set("n", "<leader>uc", function()
  require("changdeok").cycle()
end, { desc = "창덕궁 변형 전환" })
```

요구사항: Neovim 0.8+, truecolor 터미널.

## 덮어쓰기

```lua
require("changdeok").setup({
  overrides = {
    Comment = { italic = false },
    ["@keyword.return"] = { bold = true },
  },
})
```

팔레트를 직접 꺼내 쓸 수도 있다.

```lua
local c = require("changdeok").palette.buyong
print(c.noerok)
```

## 지원 범위

- 기본 구문 그룹과 편집기 UI 전체 — 플로트, 경계, 접기, diff, quickfix,
  `:terminal` ANSI 16색
- Tree-sitter 캡처. `@variable.parameter`, `@keyword.return`, `@string.escape`,
  `@markup.heading.*`, `@constructor` 포함
- LSP semantic token. language server가 붙은 뒤에도 색이 고정된다
- gitsigns, telescope, nvim-cmp, blink.cmp, neo-tree, nvim-tree,
  indent-blankline v3, which-key, nvim-notify, noice, flash, leap, hop,
  bufferline, lazy, mason, todo-comments

## 구조

```
lua/changdeok/palette.lua      세 변형의 색 정의. 색을 고칠 땐 여기만 건드린다
lua/changdeok/highlights.lua   하이라이트 그룹 매핑
lua/changdeok/init.lua         setup / load / cycle
colors/changdeok-*.lua         :colorscheme 진입점
scripts/contrast_check.py      검증
.github/workflows/contrast.yml CI
```

## 터미널 설정

편집 영역만 테마 색이고 여백이 다른 색이면 터미널 배경을 맞춰야 한다.
Alacritty:

```toml
[colors.primary]
background = "#191614"
foreground = "#e0d5c2"
```

색이 8색처럼 뭉개지면 truecolor 문제다. tmux를 쓴다면 `~/.tmux.conf`에:

```
set -ga terminal-overrides ",*256col*:Tc"
```

넣고 `tmux kill-server`로 재시작한다.

## 출처

대비 게이트를 빌드에 박아 넣는 방식은
[dancheong.nvim](https://github.com/art220/dancheong.nvim)에서 영향받았다. 소재도
단청으로 겹친다. 이 저장소의 차별점은 오간색 활용, 오방색 원색 배제, 그리고 하나의
팔레트를 명도만 바꿔 파생시키는 대신 실제로 색 처리가 다른 세 장소에서 각각 뽑은
점에 있다.

## 라이선스

MIT
