### 暗黒騎士 (Darkknight)

> 日本語で環境構築を書いていきます。

※ 環境構築するとき、Gist[記事](https://gist.github.com/takkii/63708d66ba2d41a86dd8e1fda20a79db)を合わせて読んでください。

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
# npm 更新/依存ライブラリ解消
ncu -u
yarn install
yarn upgrade

# esbuild 有効化
npm install darkknight/../deps/phoenix darkknight/../deps/phoenix_html darkknight/../deps/phoenix_live_view --save
```

```markdown
yarn licenses v1.22.22
├─ Apache-2.0
│  ├─ npm-check-updates@19.6.6
│  │  ├─ URL: git+https://github.com/raineorshine/npm-check-updates.git
│  │  ├─ VendorName: Tomas Junnonen
│  │  └─ VendorUrl: https://github.com/raineorshine/npm-check-updates
│  ├─ npm-check-updates@20.0.0
│  │  ├─ URL: git+https://github.com/raineorshine/npm-check-updates.git
│  │  ├─ VendorName: Tomas Junnonen
│  │  └─ VendorUrl: https://github.com/raineorshine/npm-check-updates
│  └─ typescript@5.9.3
│     ├─ URL: https://github.com/microsoft/TypeScript.git
│     ├─ VendorName: Microsoft Corp.
│     └─ VendorUrl: https://www.typescriptlang.org/
├─ BSD-3-Clause
│  └─ diff@4.0.4
│     └─ URL: git://github.com/kpdecker/jsdiff.git
├─ ISC
│  └─ make-error@1.3.6
│     ├─ URL: git://github.com/JsCommunity/make-error.git
│     ├─ VendorName: Julien Fontanet
│     └─ VendorUrl: https://github.com/JsCommunity/make-error
└─ MIT
   ├─ @cspotcode/source-map-support@0.8.1
   │  └─ URL: https://github.com/cspotcode/node-source-map-support
   ├─ @esbuild/win32-x64@0.28.0
   │  └─ URL: git+https://github.com/evanw/esbuild.git
   ├─ @jridgewell/resolve-uri@3.1.2
   │  ├─ URL: https://github.com/jridgewell/resolve-uri
   │  └─ VendorName: Justin Ridgewell
   ├─ @jridgewell/sourcemap-codec@1.5.5
   │  ├─ URL: git+https://github.com/jridgewell/sourcemaps.git
   │  ├─ VendorName: Justin Ridgewell
   │  └─ VendorUrl: https://github.com/jridgewell/sourcemaps/tree/main/packages/sourcemap-codec
   ├─ @jridgewell/trace-mapping@0.3.9
   │  ├─ URL: git+https://github.com/jridgewell/trace-mapping.git
   │  └─ VendorName: Justin Ridgewell
   ├─ @tsconfig/node10@1.0.12
   │  └─ URL: https://github.com/tsconfig/bases.git
   ├─ @tsconfig/node12@1.0.11
   │  └─ URL: https://github.com/tsconfig/bases.git
   ├─ @tsconfig/node14@1.0.3
   │  └─ URL: https://github.com/tsconfig/bases.git
   ├─ @tsconfig/node16@1.0.4
   │  └─ URL: https://github.com/tsconfig/bases.git
   ├─ @types/node@25.5.2
   │  ├─ URL: https://github.com/DefinitelyTyped/DefinitelyTyped.git
   │  └─ VendorUrl: https://github.com/DefinitelyTyped/DefinitelyTyped/tree/master/types/node
   ├─ acorn-walk@8.3.5
   │  ├─ URL: https://github.com/acornjs/acorn.git
   │  └─ VendorUrl: https://github.com/acornjs/acorn
   ├─ acorn@8.16.0
   │  ├─ URL: git+https://github.com/acornjs/acorn.git
   │  └─ VendorUrl: https://github.com/acornjs/acorn
   ├─ arg@4.1.3
   │  ├─ URL: https://github.com/zeit/arg.git
   │  └─ VendorName: Josh Junon
   ├─ create-require@1.1.1
   │  └─ URL: https://github.com/nuxt-contrib/create-require.git
   ├─ esbuild@0.28.0
   │  └─ URL: git+https://github.com/evanw/esbuild.git
   ├─ jn-server@1.0.8
   │  ├─ URL: https://github.com/takkii/json-server.git
   │  ├─ VendorName: Takayuki Kamiyama
   │  └─ VendorUrl: http://pieceof.shop/
   ├─ morphdom@2.7.8
   │  ├─ URL: https://github.com/patrick-steele-idem/morphdom.git
   │  └─ VendorName: Patrick Steele-Idem
   ├─ phoenix_html@4.3.0
   ├─ phoenix_live_view@1.1.28
   │  ├─ URL: git://github.com/phoenixframework/phoenix_live_view.git
   │  ├─ VendorName: Chris McCord
   │  └─ VendorUrl: http://www.phoenixframework.org
   ├─ phoenix@1.8.5
   │  ├─ URL: git://github.com/phoenixframework/phoenix.git
   │  ├─ VendorName: Chris McCord
   │  └─ VendorUrl: https://www.phoenixframework.org
   ├─ ts-node@10.9.2
   │  ├─ URL: git://github.com/TypeStrong/ts-node.git
   │  ├─ VendorName: Blake Embrey
   │  └─ VendorUrl: https://typestrong.org/ts-node
   ├─ undici-types@7.18.2
   │  ├─ URL: git+https://github.com/nodejs/undici.git
   │  └─ VendorUrl: https://undici.nodejs.org/
   ├─ v8-compile-cache-lib@3.0.1
   │  ├─ URL: https://github.com/cspotcode/v8-compile-cache-lib.git
   │  └─ VendorName: Andrew Bradley
   └─ yn@3.1.1
      ├─ URL: https://github.com/sindresorhus/yn.git
      ├─ VendorName: Sindre Sorhus
      └─ VendorUrl: sindresorhus.com
Done in 3.80s.
```

DarkReader: [Add-ons](https://addons.mozilla.org/ja/firefox/addon/darkreader/) | [拡張機能](https://chromewebstore.google.com/detail/dark-reader/eimadpbcbfnmbkopoojfekhnkhdbieeh?hl=ja)をMozilla FireFox / Google Chromeで使用しています。

_更新履歴: 2026/04/06🔄_
