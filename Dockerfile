FROM ruby:2.7.1

RUN apt-get update -qq && \
    apt-get install -y nodejs \
                       npm && \
    npm install -g yarn

# 作業ディレクトリを/rails6_mysql8に指定
WORKDIR /rails6_mysql8

# ローカルのGemfile, Gemfile.lockをDokcerにコピー
COPY Gemfile* /rails6_mysql8/

# /rails6_mysql8ディレクトリ上でbundle install
RUN bundle install