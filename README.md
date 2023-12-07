# Stonks Rails API

Stonks Rails API is Rails API that has functionality to allows Storns to manage `Users`, `UserResources`, `Groups` and `GroupMessages` models.

- [Stonks Rails API](#stonks-rails-api)
    - [Installation](#installation)
        - [Run the server](#Run the server)
        - [Run tests](#run-tests)
        - [Run Ruby scanners](#run-ruby-scanners)
    - [Engines](#engines)
        - [Api Engine](#api-engine)
        - [Authentication Engine](#authentication-engine)
        - [Chat Engine](#Chat-engine)

## Installation

```bash
bundle install
rake db:create
rake db:migrate
```

### Run the server

```bash
rails s
```

### Run specs

```bash
# please check lib/tasks/rspec.rake
rake
```

### Run ruby scanners

Note that these commands can be easily integrated in Circle CI.

```bash
rubocop

brakeman --path ./components/api
brakeman --path ./components/authentication
brakeman --path ./components/chat

bundler-audit
```

## Engines

For more information about the engines, please visit their respective READMEs.

### Api Engine

[API Engine](https://github.com/vkuprin/rails-chat/tree/master/components/api)

### Authentication Engine

[Authentication Engine](https://github.com/vkuprin/rails-chat/tree/master/components/authentication)

### Chat Engine

[Chat Engine](https://github.com/vkuprin/tree/master/components/chat)
