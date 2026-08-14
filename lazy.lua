-- lazy.nvim 이 이 저장소를 설치할 때 자동으로 병합하는 스펙 조각.
--
-- 컬러스킴은 다른 플러그인보다 먼저, 그리고 지연 없이 로드돼야 한다.
-- 이 파일 덕분에 사용자는 { "enovoid/changdeok.nvim" } 한 줄만 써도
-- lazy = false / priority = 1000 이 자동으로 붙는다.
--
-- 반환값은 완전한 LazySpec 으로 정규화되므로 [1] 에 저장소 이름이 있어야 한다.
-- 옵션만 { lazy = false, priority = 1000 } 로 반환하면 lazy.nvim 이
-- "Invalid plugin spec" 으로 버린다.
return { "enovoid/changdeok.nvim", lazy = false, priority = 1000 }
