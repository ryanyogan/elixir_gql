defmodule ElixirGql.Router do
  use ElixirGql.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElixirGql do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  forward "/api", Absinthe.Plug,
    schema: ElixirGql.Schema

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: ElixirGql.Schema

  # Other scopes may use custom stacks.
  # scope "/api", ElixirGql do
  #   pipe_through :api
  # end
end
