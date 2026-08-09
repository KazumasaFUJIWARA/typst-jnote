---
name: jnote-authoring
description: >-
  @original/jnote で講義板書・数学ノートの .typ を書く／直すときの記法ガイド。
  cases・#table・指数・絶対値・dif x など、コンパイルは通るが PDF が崩れる落とし穴を避ける。
  Use when: jnote、板書 .typ、wave-ii-board、講義ノート Typst、
  「typst の記法が乱れている」「cases が崩れる」「表がパイプのまま」と言われたとき。
---

# jnote-authoring

## 正本

同じディレクトリの **[AUTHORING.md](./AUTHORING.md)** を必ず先に Read する。
API は各バージョンの `README.md`。**バージョン番号は勝手に上げない。**

## 手順

1. `AUTHORING.md` を読む。
2. 査読済み板書があればその型を優先する。
3. `typst compile` 後、可能なら `pdftotext … | head` で表・指数・cases を確認する。
4. Markdown 風 `| … |` 表は禁止。`#table(...)` を使う。

## 依存

- `tinymist-preview-watch` — WSL 9p プレビュー
- `typst-form-exam-authoring` — `@original/quiz`（別系統）
