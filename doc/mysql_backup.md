## MySQL バックアップ

```bash
$ mysqldump --single-transaction -u molkky -p molkky > /var/log/mysql/backup/filename.dump
```

## リストア

```bash
$ mysql -u molkky -p molkky < {dumpファイル名}
```
