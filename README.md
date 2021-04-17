# README

## 別リポジトリとして開発を進める場合

```
### 別プロジェクト名でこのリポジトリをcloneする
$ git clone git@github.com:nishina555/docker-rails6-mysql8.git [project_name] && cd [project_name]

### push先を変更
$ git remote set-url origin git@github.com:nishina555/[project_name].git

### push先の確認
$ git remote -v

### push
$ git push origin HEAD
```

clone後、ソースコードのプロジェクト名を変更する。大文字小文字を識別して、以下の文字列を置換する。

- `rails6_mysql8`を'[project_name]'に置換
- `RAILS6_MYSQL8`を'[PROJECT_NAME]'に置換
- `Rails6Mysql8`を'[ProjectName]'に置換

## Redisを利用する場合

- docker-compose-with-redis.ymlを利用する
- 以下のように設定ファイルを変更

```
# config/initializers/sessions_store.rb
Rails.application.config.session_store :redis_store,
                                       servers: %w(redis://redis:6379/0/session),
                                       expire_after: 90.minutes,
                                       key: "_#{Rails.application.class.parent_name.downcase}_session"
```