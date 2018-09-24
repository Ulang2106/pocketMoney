#FROM ruby:2.5
FROM ruby:2.4.1

# system update
RUN apt-get update && \
    apt-get install -y vim less sudo nodejs mysql-client locales dialog && \
    rm -rf /var/lib/apt/lists/*

# install tools
RUN cd /tmp && \
    curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install sphinx && \
    pip install sphinxcontrib-httpdomain && \
    rm get-pip.py

ENV AppRoot="/pocketMoney"
RUN mkdir ${AppRoot}
WORKDIR ${AppRoot}

COPY Gemfile ${AppRoot}
COPY Gemfile.lock ${AppRoot}
RUN bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]
