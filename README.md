# Chat Attack! (Server)

This is the server portion of the Chat Attack! web app, built on Elixir / Phoenix, websockets, and Redis. Get the client [here](https://github.com/dkoloditch/chat-attack-client).

### Prerequisites
1. [Install Elixir](https://elixir-lang.org/install.html)
2. [Install Phoenix](http://www.phoenixframework.org/docs/installation)
3. [Install Redis](https://redis.io/download)

### Fire it up!
1. Clone this repo
2. Navigate to the `chat-attack-server` folder
3. Install Node.js dependencies with `npm i`
4. Install Phoenix dependencies with `mix deps.get`
5. [Start Redis](https://redis.io/download) (`/PATH/TO/REDIS/src/redis-server` in a separate terminal) (port 6379)
5. Start the Phoenix server with `mix phoenix.server` (port 3000)
6. Start the client and go to `localhost:3001`
7. Chat Attack!
