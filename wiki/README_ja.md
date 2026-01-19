### 暗黒騎士

> 現在: エンドポイント毎の認可🎯
>
> npm/types-serverでJSON処理(参照: [shivaプロジェクト](https://github.com/takkii/shiva))を行わない方向性を維持します。

```elixir
# https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Server.html
# 開発環境、非商用ライセンスRubyMine/mix arguments

# 依存ライブラリ解消
deps.get
# アセット解消
assets.setup
# DB設定
ecto.create
# phx.server コンパイル
phx.server
# phx.server コンパイルしない
phx.server --no-compile

# http://localhost:4000
phx.server

# 役割 (darknight内)
javascript、フロントエンド + 機能追加
elixir、バックエンド + 制御
```

### 初期構成

> wget https://github.com/takkii/darknight/archive/refs/tags/v1.0.1.3.zip

※ ハローワールドを起動時に表示します。Phoenixプロジェクト、新規開発時ご利用ください。

_更新履歴: 2026/01/18🔄_