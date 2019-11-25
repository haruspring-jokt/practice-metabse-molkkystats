# 概要

- metabaseを使ってみたかった
- モルックというスーパーマイナーだけど面白いスポーツの練習をデータに残しているので、それを可視化できればと思っています
  - [モルックってなんじゃい](https://molkky.jp/molkky/)

## 参考

- https://qiita.com/ITNewcomer/items/73173f032af29175dacd
  - ほぼパクってしまった
- https://qiita.com/acro5piano/items/0920550d297651b04387
  - これみてやってみたくなった

## 環境

```sh
ProductName:    Mac OS X
ProductVersion: 10.15.1
BuildVersion:   19B88
```

metabaseとMySQLはDocker for Macでイメージを落として使っています

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

### 初期設定

`docker-compose.yml`に書いた接続情報に応じて入力する

![](https://i.imgur.com/TUXNMLY.jpg)

ダッシュボードが表示される。まだデータを突っ込んでいなのでなにもみれないけど、サンプルのデータセットがあるので遊んだりなんとなくの使い方を把握できると思います

![](https://i.imgur.com/vusIMp0.jpg)

### データの格納

あとで

モルック練習のスプレッドシートをCSVに変換してDBにINSERTする予定

[練習データのスプレッドシート](https://docs.google.com/spreadsheets/d/1xkdWbgpjnIVcBiPV5m-Q8oKwtMQ4arF65qe6RDvUikM/edit?usp=sharing)からcsvファイルをエクスポートする

本当はもっとテーブルを正規化すべきだが、面倒だったので使用するモルック棒（重さが違うので練習ごとに返るようにしています）のテーブルのみ別出しする

```sql
CREATE TABLE color (
    id INT NOT NULL,
    color VARCHAR(32) NOT NULL,
    `name` VARCHAR(32) NOT NULL,
    kind VARCHAR(32) NOT NULL,
    `weight` INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE games (
    id INT NOT NULL,
    `date` DATETIME,
    `match` INT,
    teams INT,
    rule VARCHAR(32),
    win_point INT,
    place VARCHAR(128),
    `condition` VARCHAR(32),
    weather VARCHAR(32),
    temperature INT,
    color VARCHAR(32),
    game_num INT,
    shot_count INT,
    ace_count INT,
    mistake_count INT,
    first_shot_score INT,
    finished_turn INT,
    three_mistake_count INT,
    fifty_over_count INT,
    vertical_shot_count INT,
    vertical_ace_count INT,
    back_shot_count INT,
    back_ace_count INT,
    lob_shot_count INT,
    lob_ace_count INT,
    step_shot_count INT,
    step_ace_count INT,
    attempt_shot_count INT,
    attempt_ace_count INT,
    comment VARCHAR(1000),
    won_team_num INT,
    photo_url VARCHAR(1000),
    PRIMARY KEY (id)
);
```

上のように、先にテーブルを作成しておく。

MySQLのCSVインポート機能を使ってデータをインストールする。

```bash
# ./docker/log/mysql 内に games.csv というファイル名でcsvを保存しておく

docker exec -it metabase_mysql bash

mysql -u molkky -p

mysql> use molkky;
# MySQLコンテナ内でMySQLコンソールを起動し、以下を実行
# CSVが空欄の場合はNULLをINSERTする、などの条件分岐もできるようですが、
# 今回は手っ取り早く元データのスプレッドシートに `\N` と入力しておくことで
# NULLを書き込んでもらうことにしました
mysql> LOAD DATA LOCAL INFILE "/var/log/mysql/games.csv " INTO TABLE games FIELDS TERMINATED BY ',' ignore 1 lines;
```

適当にSELECTなどでデータが入っているか確認（csvの中身によってWARNINGが発生することがあるので`show warning`で見て修正、WARNINGが発生しなくなるまで繰り返す）

### ダッシュボードの確認

データが追加されていることをmetabaseで確認する。

![](https://i.imgur.com/BahuteU.jpg)

`見てみる Games テーブル`から、metabaseが自動的に作成したチャートを見ることができる。

![](https://i.imgur.com/NSyb7k7.jpg)

### 自分でチャートを作成する

当然、上の自動走査（X-RAY）ではほしいチャートはすべて見つからないので、自分で作成していく

TBD

## 補足など

### テーブルのスキーマ変更をmetabseに反映する

カラム追加をしたときなど、すぐにはmetabase上に反映されなかったので、`設定 -> 管理者 -> データベース -> {変更したデータベース名}`に進み、`今すぐデータベーススキーマと同期する`を選択することで反映される模様（ということは、しばらく待っていれば自動的に反映されるのか？ということについては未検証）。
