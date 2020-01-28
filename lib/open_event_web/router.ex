defmodule OpenEventWeb.Router do
  use OpenEventWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/v1", OpenEventWeb do
    pipe_through :api

    resources "/events", EventController, except: [:new, :edit]
  end
end
