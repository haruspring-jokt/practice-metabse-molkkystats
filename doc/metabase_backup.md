## Metabaseのバックアップ

https://qiita.com/shotanue/items/dd036c9ed6960a9c3924 を参考にする。

コンテナ起動時にマウントをしていなかったので、以下の方法でコンテナ内の必要なファイルをコピーした。

```bash
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
be72613019f5        metabase/metabase   "/app/run_metabase.sh"   3 days ago          Up 2 days           0.0.0.0:3000->3000/tcp   metabase
cd21a0a8b5f6        mysql:5.7.22        "docker-entrypoint.s…"   3 days ago          Up 2 days           0.0.0.0:3306->3306/tcp   metabase_mysql

# 特にマウントせずにコンテナを立ち上げている場合はルート直下にmetabase.dbというディレクトリがある

docker exec -it metabase ls -l /metabase.db
total 2048
-rw-r--r--    1 metabase metabase   2093056 Feb  3 13:38 metabase.db.mv.db
-rw-r--r--    1 metabase metabase       187 Jan 30 15:16 metabase.db.trace.db

# docker cp コマンドでホスト側にファイルをコピーしてバックアップできる。

docker cp metabase:/metabase.db ./metabase/backup/
```