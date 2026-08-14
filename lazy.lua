-- lazy.nvim 이 이 저장소를 설치할 때 자동으로 병합하는 스펙 조각.
--
-- 컬러스킴은 다른 플러그인보다 먼저, 그리고 지연 없이 로드돼야 한다.
-- 이 파일 덕분에 사용자는 { "enovoid/changdeok.nvim" } 한 줄만 써도
-- lazy = false / priority = 1000 이 자동으로 붙는다.
return { lazy = false, priority = 1000 }
