defmodule OpenEventWeb.Router do
  use OpenEventWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", OpenEventWeb do
    pipe_through :api
  end
end
