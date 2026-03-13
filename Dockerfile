FROM ruby:3.3

RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install --yes nodejs \
    && corepack enable

WORKDIR /srv/jekyll

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY package.json pnpm-lock.yaml ./
RUN pnpm install

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--force_polling", "--host", "0.0.0.0"]
