defmodule Discuss.Router do
  use Discuss.Web, :router

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

  scope "/", Discuss do
    pipe_through :browser # Use the default browser stack

    get    "/",                PageController,  :index
    get    "/topics",          TopicController, :index
    get    "/topics/:id/edit", TopicController, :edit
    get    "/topics/new",      TopicController, :new
    get    "/topics/:id",      TopicController, :show
    post   "/topics",          TopicController, :create
    patch  "/topics/:id",      TopicController, :update
    put    "/topics/:id",      TopicController, :update
    delete "/topics/:id",      TopicController, :delete

  end

  # Other scopes may use custom stacks.
  # scope "/api", Discuss do
  #   pipe_through :api
  # end
end
