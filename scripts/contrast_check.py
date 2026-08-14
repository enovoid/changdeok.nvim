#!/usr/bin/env python3
"""changdeok.nvim 대비 검증.

palette.lua 를 직접 읽어 모든 전경/배경 쌍의 WCAG 대비를 검증한다.
하한: 본문 7:1, 구문·UI 텍스트 4.5:1, 선택 3:1, 창 경계 1.4:1.
창 경계만 낮은 이유는 아래 border 분기의 주석에 있다.
하나라도 미달이면 종료 코드 1."""
import re, sys, pathlib

ROOT = pathlib.Path(__file__).resolve().parent.parent
SRC = (ROOT / "lua" / "changdeok" / "palette.lua").read_text(encoding="utf-8")

def _lin(v):
    v /= 255
    return v / 12.92 if v <= 0.03928 else ((v + 0.055) / 1.055) ** 2.4

def lum(h):
    h = h.lstrip("#")
    r, g, b = (int(h[i:i+2], 16) for i in (0, 2, 4))
    return 0.2126*_lin(r) + 0.7152*_lin(g) + 0.0722*_lin(b)

def ratio(a, b):
    la, lb = lum(a), lum(b)
    hi, lo = max(la, lb), min(la, lb)
    return (hi + 0.05) / (lo + 0.05)

def parse(name):
    m = re.search(r"M\.%s\s*=\s*\{(.*?)\n\}" % name, SRC, re.S)
    return dict(re.findall(r"(\w+)\s*=\s*\"(#[0-9a-fA-F]{6})\"", m.group(1)))

BODY, TEXT, UI, DECOR = 7.0, 4.5, 3.0, 1.4
BACKDROPS = ["bg", "bg_dim", "bg_float", "bg_line"]

fail = 0
checked = 0
for variant in ("injeong", "buyong", "nakseon"):
    p = parse(variant)
    print(f"\n── {variant}  (bg {p['bg']})")
    for key, col in p.items():
        if key.startswith("bg"):
            continue
        if key == "border":
            # 창 경계와 들여쓰기 가이드는 정보를 전달하지 않는 장식 요소다.
            # WCAG 3:1 은 의미를 가진 UI 컴포넌트 기준이므로 여기 적용하면
            # 분할선이 본문보다 시끄러워진다. 1.4:1 을 하한으로 둔다.
            need, against = DECOR, ["bg"]
        elif key == "fg":
            need, against = BODY, BACKDROPS
        else:
            need, against = TEXT, BACKDROPS
        worst, worst_bg = 99.0, ""
        for b in against:
            r = ratio(col, p[b])
            checked += 1
            if r < worst:
                worst, worst_bg = r, b
        ok = worst >= need
        fail += 0 if ok else 1
        print(f"   {'OK  ' if ok else 'FAIL'} {key:<10} {col}  {worst:5.2f}:1 vs {worst_bg:<8} (하한 {need})")
    # 선택 영역
    r = ratio(p["fg"], p["bg_sel"]); checked += 1
    ok = r >= UI; fail += 0 if ok else 1
    print(f"   {'OK  ' if ok else 'FAIL'} {'fg/bg_sel':<10} {'':7}  {r:5.2f}:1              (하한 {UI})")

print(f"\n검사 {checked}쌍 · 실패 {fail}건")
sys.exit(1 if fail else 0)
