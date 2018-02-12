defmodule Discuss.TopicController do
    use Discuss.Web, :controller

    alias Discuss.Topic
    
    def index(conn, _params) do
        render conn, "index.html"
    end

    def new(conn, _params) do
        changeset = Topic.changeset(%Topic{}, %{})
        render conn, "new.html", changeset: changeset
    end

    def create(conn, %{"topic" => topic}) do
        changeset = Topic.changeset(%Topic{}, topic)

        case Repo.insert(changeset) do
            {:ok, post} -> IO.inspect(post)
            {:error, changeset} -> IO.inspect(changeset)
        end
    end

    def edit(conn, _params) do

    end

    def update(conn, _params) do

    end
end