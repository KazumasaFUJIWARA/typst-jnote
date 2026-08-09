# jnote

ノート用Typstスタイルパッケージです。

## 概要

`jnote`はノートの作成に特化したTypstスタイルファイルです。
シンプルで読みやすいレイアウトを提供し、ノートの標準的な構成要素
（タイトル、セクション、リスト、コードブロックなど）を表示します。

## インストール

### 個別スタイルとして
ファイルと同じ場所に`jnote.typ`をコピー

### ローカルパッケージとして
- [Typst Package](https://github.com/typst/packages)
に従って下さい.
- `{data-dir}/typst/{name-space}/`
に`jnote`としてcloneして下さい.
- `{name-space}`は`local`が標準的ですが,
独自スタイルなので変更も見当対象です.

## 使用方法
各versionの`README.md`を確認して下さい.

## 板書・講義ノートの記法

エージェント向けの書き方・落とし穴（`cases`・表・指数・絶対値など）は
**[AUTHORING.md](./AUTHORING.md)** を正本とする。
API リファレンス（`theorem` / `remark` 等）は各バージョンの `README.md`。

## トラブルシューティング

### パッケージのバージョン更新が反映されない場合

`#import "@original/jnote:1.0.1": *` のようにバージョンを指定しているのに、更新が反映されない場合は以下の手順を試してください：

1. **Typstのキャッシュをクリア**
   ```bash
   rm -rf ~/.cache/typst/packages/*
   ```

2. **エディタを再起動**
   - VS Codeなどのエディタを完全に再起動してください

3. **Typst LSPサーバーを再起動**
   - VS Codeの場合: コマンドパレット（Ctrl+Shift+P）→「Typst: Restart Server」

4. **ドキュメントを再コンパイル**
   - ドキュメントを保存し直して再コンパイルしてください

パッケージの構造は正しく配置されている場合、エディタやLSPのキャッシュが原因である可能性が高いです。

## ライセンス
MIT License 