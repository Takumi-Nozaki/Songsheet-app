# Debian
FROM ruby:2.7.4
ENV LANG C.UTF-8

# ready to install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# install required libraries
RUN apt-get update -qq && apt-get install -y build-essential vim yarn sqlite3

# install node
RUN apt-get install -y nodejs && yarn global add n && n 14.17.6

# 作業ディレクトリを作成する
RUN mkdir /usr/src/app/
WORKDIR /usr/src/app/

# ライブラリに必要なファイル群を設置する
ADD Gemfile /usr/src/app/Gemfile
ADD Gemfile.lock /usr/src/app/Gemfile.lock
ADD package.json /usr/src/app/package.json
ADD yarn.lock /usr/src/app/yarn.lock

# ライブラリをインストールする
RUN bundle install --jobs=4
RUN yarn install

# webpacker から compile する
RUN bundle exec rails webpacker:compile

# ディレクトリを全てコピーする
COPY . /usr/src/app/
