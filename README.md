# 概要

- metabaseを使ってみたかった
- モルックというスーパーマイナーだけど面白いスポーツの練習をデータに残しているので、それを可視化できればと思っています
  - [モルックってなんじゃい](https://molkky.jp/molkky/)

## 参考

- https://qiita.com/ITNewcomer/items/73173f032af29175dacd
  - ほぼパクってしまった
- https://qiita.com/acro5piano/items/0920550d297651b04387
  - これみてやってみたくなった

## 作業メモ

`docker-compose.yml`とかを書く。以前作ったサンプルからMySQLの設定をコピったのでいろいろめちゃくちゃだと思う

```sh
docker-compose create
docker-compose up -d

docker-compose images

  Container         Repository        Tag       Image Id      Size 
-------------------------------------------------------------------
metabase         metabase/metabase   latest   3e5e484c4aa7   515 MB
metabase_mysql   mysql               5.7.22   6bb891430fb6   355 MB

# mysql接続
mysql --host=127.0.0.1 --port=3306 --user=molkky --password
```

以下にアクセス

http://localhost:3000/

![](https://i.imgur.com/Mdw7IhP.jpg)

### データの格納

あとで

モルック練習のスプレッドシートをCSVに変換してDBにINSERTする予定

### 初期設定

`docker-compose.yml`に書いた接続情報に応じて入力する

![](https://i.imgur.com/TUXNMLY.jpg)

ダッシュボードが表示される。まだデータを突っ込んでいなのでなにもみれないけど、サンプルのデータセットがあるので遊んだりなんとなくの使い方を把握できると思います

![](https://i.imgur.com/vusIMp0.jpg)
