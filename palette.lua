-- changdeok.nvim — palette
--
-- 창덕궁 안의 서로 다른 세 장소에서 각각 색을 뽑았다. 하나의 팔레트를 밝기만
-- 바꿔 돌려쓴 게 아니라, 실제로 색 처리가 다른 건물들이다.
--
-- 색을 고르는 원칙은 하나다. 오방색(청·적·황·백·흑) 원색은 방위와 상징을
-- 멀리서 읽히게 하려고 채도를 끝까지 올린 의례용 팔레트다. 색동과 궁궐 외부
-- 단청처럼 원거리 시인성이 목적인 곳에 쓰였지, 30cm 앞에서 여덟 시간 보라고
-- 만든 색이 아니다. 그래서 구문 강조에는 쓰지 않는다.
--
-- 대신 오간색(녹·벽·홍·유황·자)과 실제 광물 안료의 탁도를 기준으로 삼았다.
-- 뇌록은 회색이 섞인 탁한 청록이고, 석간주는 붉은 갈색 흙빛이며, 삼청도
-- 형광 파랑이 아니라 가라앉은 남색이다.
--
-- 원색이 돌아오는 곳은 진단 메시지 하나뿐이고, 그것도 배경 블록이 아니라
-- 물결 밑줄로 칠한다. 배경 블록은 코드를 가린다.
--
-- 모든 값은 scripts/contrast_check.py 로 검증한다. 미달이면 쓰지 않는다.

local M = {}

-- ── 인정전 仁政殿 ────────────────────────────────────────
-- 창덕궁의 정전. 모로단청이 가장 빽빽하게 올라간 건물이다.
-- 밤에 등불이 들면 붉은 기둥과 금박 자리가 먼저 살아나고 나머지는 어둠에 잠긴다.
-- 배경에 붉은 기미를 남기고 진사와 석황을 앞에 세웠다. 셋 중 가장 따뜻하다.
M.injeong = {
  bg         = "#191614",  -- 배경
  bg_dim     = "#141110",  -- 비활성 창, 사이드바
  bg_float   = "#221d1a",  -- 팝업, 플로트
  bg_line    = "#1e1a17",  -- 커서 라인
  bg_sel     = "#332b26",  -- 선택 영역
  border     = "#3d342d",  -- 경계선 (장식 요소)

  fg         = "#e0d5c2",  -- 본문
  fg_dim     = "#a89a86",  -- 구두점, 연산자
  comment    = "#908473",  -- 주석

  jinsa      = "#d08a72",  -- 진사 · keyword, return
  seokhwang  = "#dfbc7d",  -- 석황 · function, heading
  noerok     = "#94b391",  -- 뇌록 · string
  samcheong  = "#8fb0cc",  -- 삼청 · type, class
  jaju       = "#bb98b6",  -- 자주 · constant, number
  byeok      = "#90bab0",  -- 벽 · escape, property
  hong       = "#d69f95",  -- 홍 · parameter, tag

  error      = "#d9705f",
  warn       = "#dda257",
  info       = "#8fb0cc",
  hint       = "#94b391",
  add        = "#8aa87f",
  change     = "#cfae6d",
  delete     = "#cb7466",
}

-- ── 부용지 芙蓉池 ────────────────────────────────────────
-- 후원의 연못. 여기엔 단청이 거의 없다. 물빛과 이끼, 소나무, 화강암이 색의
-- 전부고 가을 단풍 한 점이 유일한 난색이다.
-- 배경을 청록으로 눕히고 난색은 keyword 하나에만 남겼다. 셋 중 가장 차분하다.
M.buyong = {
  bg         = "#141a19",  -- 배경
  bg_dim     = "#101514",  -- 비활성 창, 사이드바
  bg_float   = "#1b2321",  -- 팝업, 플로트
  bg_line    = "#18201e",  -- 커서 라인
  bg_sel     = "#2a3733",  -- 선택 영역
  border     = "#35443f",  -- 경계선 (장식 요소)

  fg         = "#cfd6cc",  -- 본문
  fg_dim     = "#99a49b",  -- 구두점, 연산자
  comment    = "#7e8c84",  -- 주석

  jinsa      = "#d08878",  -- 진사 · keyword, return
  seokhwang  = "#cbb87a",  -- 석황 · function, heading
  noerok     = "#8fb894",  -- 뇌록 · string
  samcheong  = "#82b0bd",  -- 삼청 · type, class
  jaju       = "#ac9ac0",  -- 자주 · constant, number
  byeok      = "#85bfb2",  -- 벽 · escape, property
  hong       = "#c79f99",  -- 홍 · parameter, tag

  error      = "#d4705f",
  warn       = "#cfa45c",
  info       = "#82b0bd",
  hint       = "#8fb894",
  add        = "#84ab86",
  change     = "#c2a86a",
  delete     = "#c87162",
}

-- ── 낙선재 樂善齋 ────────────────────────────────────────
-- 헌종이 사대부 주택 양식으로 지은 곳. 궁궐 안인데도 단청을 하지 않은 백골집이다.
-- 칠하지 않은 소나무 결과 한지 창호, 황토 벽, 전돌의 회색이 전부다.
-- 다른 변형의 명도를 뒤집은 게 아니다. 애초에 색 처리가 다른 건물이라,
-- 안료 대신 재료의 색으로 짰다.
M.nakseon = {
  bg         = "#ece5d6",  -- 배경
  bg_dim     = "#e2dbc9",  -- 비활성 창, 사이드바
  bg_float   = "#f4efe3",  -- 팝업, 플로트
  bg_line    = "#e5dfcf",  -- 커서 라인
  bg_sel     = "#d4cbb4",  -- 선택 영역
  border     = "#c0b6a0",  -- 경계선 (장식 요소)

  fg         = "#2b2721",  -- 본문
  fg_dim     = "#575043",  -- 구두점, 연산자
  comment    = "#655e50",  -- 주석

  jinsa      = "#9a4636",  -- 진사 · keyword, return
  seokhwang  = "#7c591c",  -- 석황 · function, heading
  noerok     = "#40694a",  -- 뇌록 · string
  samcheong  = "#33608a",  -- 삼청 · type, class
  jaju       = "#75477c",  -- 자주 · constant, number
  byeok      = "#326661",  -- 벽 · escape, property
  hong       = "#8f4744",  -- 홍 · parameter, tag

  error      = "#9c2f22",
  warn       = "#855312",
  info       = "#33608a",
  hint       = "#40694a",
  add        = "#40694a",
  change     = "#77571a",
  delete     = "#9c2f22",
}

M.variants = { "injeong", "buyong", "nakseon" }
M.light = { nakseon = true }

function M.get(variant)
  return M[variant] or M.injeong
end

return M
