<div align="right">
   <a href="https://github.com/takkii/darkknight/tree/main/wiki">英語</a> / 日本語
</div>

### 暗黒騎士

日本語で内容を加筆して環境構築を書いていきます。

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

# 役割 (darkknight)
javascript、フロントエンド + 機能追加
elixir、バックエンド + 制御

# Docker環境構築
cd darkknigt
mkdir db/data

# ビルド
docker-compose build --no-cache
# 常駐
docker compose up -d
# 常駐解除
docker-compose down

# postgres設定
docker-compose exec db bash
passwd postgres
su - postgres
create role takkii WITH CREATEDB login password 'elixir20250120';
ALTER ROLE takkii SUPERUSER;
\q;

# DBを作成
docker compose run --rm app mix ecto.create

# dockerのコンテナでディスク容量不足
docker system prune -a --volumes
# docker永続化データ削除
docker-compose down -v
```

[DarkReader](https://addons.mozilla.org/ja/firefox/addon/darkreader/)をmozilla firefoxで使用しています。

_更新履歴: 2026/01/20🔄_
