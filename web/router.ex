defmodule WebsocketsTest.Router do
  use WebsocketsTest.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", WebsocketsTest do
    pipe_through :api
  end
end
