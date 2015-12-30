# SipsFetcher

Fetch elixir-sips or ruby-tapas episodes right from your terminal (using your credentials of course)

## Installation

1. Get deps

    mix geps.get
    mix compile

2. Configure config.exs (see config/config.exs.example)
3. Put latest chromedriver from (http://chromedriver.storage.googleapis.com/index.html) in /usr/bin/ (2.20 for example)

4. Fetch episodes

    mix run scripts/fetch_episodes.exs 10 100
    (where first number - from, last number - to)
