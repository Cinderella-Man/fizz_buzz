# FizzBuzz

FizzBuzz API application task.

Please remember to prep before running:

```
docker-compose up -d
mix deps.get
mix ecto.create
mix ecto.migrate
```

next it can be started by running:

```
iex -S mix phx.server
```

Then application can be viewed at: http://localhost:4000

# REST API

* listing fizz buzz numbers

http://localhost:4000/api/fizz-buzz?page=2&page_size=200

* setting up fizz buzz number as favourite

POST http://localhost:4000/api/fizz-buzz
Content-Type: 'application/json'
body: JSON.stringify({number: "23"})
