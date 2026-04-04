<div align="right">
   <a href="https://github.com/takkii/darkknight/tree/main/wiki">英語</a> / 日本語
</div>

### 暗黒騎士 (Darkknight)

日本語で内容を加筆して環境構築を書いていきます。

※ 環境構築するとき、Gist[記事](https://gist.github.com/takkii/63708d66ba2d41a86dd8e1fda20a79db)を合わせて読んでください。

> ### 現在: エンドポイント毎の認可🎯
>
> GitHub: takkii/json-serverでJSONパーサー(参照: [shivaプロジェクト](https://github.com/takkii/shiva))を機能化しない方向性にします。
>
> ### 役割 (dark knight)
> javascript、フロントエンド + 機能追加
> elixir、バックエンド + 制御

```markdown
# https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Server.html

# 依存ライブラリ解消
mix deps.get
# アセット解消
mix assets.setup
# DB設定
mix ecto.create
# phx.server コンパイル
mix phx.server
# phx.server コンパイルしない
mix phx.server --no-compile

# プロジェクト、データ保存先
cd darkknight
mkdir db
mkdir db/data

# ビルド
docker-compose build --no-cache
# 常駐 (現在の起動方法)
docker compose up -d
# 常駐解除
docker-compose down

# postgres設定
docker-compose exec db bash
passwd postgres
su - postgres
psql -U takkii
ALTER ROLE takkii WITH PASSWORD 'elixir20250120';
ALTER ROLE takkii SUPERUSER;
\du
\q

# 新規ユーザtakkiiをロール作成可, DB作成可で作成する
createuser -U postgres takkii -r -d

# 起動確認
docker compose run --rm app mix --version
docker compose run --rm db psql --version

# 依存ライブラリ解消
docker compose run --rm app mix deps.get

# アセット解消
docker compose run --rm app mix assets.setup

# DBを作成
docker compose run --rm app mix ecto.create

# dockerのコンテナでディスク容量不足
docker system prune -a --volumes

# docker永続化データ削除
docker-compose down -v
```

> .env

```dotenv
COMPOSE_PROJECT_NAME=phx_darkknight

APP_PORT=4000

POSTGRES_USER=takkii
POSTGRES_PASSWORD=elixir20250120
POSTGRES_PORT=5432
```

```markdown
# npm 依存ライブラリ解消
npm install

# esbuild 有効化
npm install darkknight/../deps/phoenix darkknight/../deps/phoenix_html darkknight/../deps/phoenix_live_view --save
```

DarkReader: [Add-ons](https://addons.mozilla.org/ja/firefox/addon/darkreader/) | [拡張機能](https://chromewebstore.google.com/detail/dark-reader/eimadpbcbfnmbkopoojfekhnkhdbieeh?hl=ja)をMozilla FireFox / Google Chromeで使用しています。

_更新履歴: 2026/04/04🔄_
