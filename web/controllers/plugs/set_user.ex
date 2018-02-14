defmodule Discuss.Plugs.SetUser do
    import Plug.Conn
    import Phoenix.Controller

    alias Discuss.Repo
    alias Discuss.User

    def init(_params) do
        # no setup required, yet...
    end

    # this _params is from the init function above, if any.
    def call(conn, _params) do
      user_id = get_session(conn, :user_id)
      
      cond do
          user = user_id && Repo.get(User, user_id) ->
            assign(conn, :user, user)
            # conn.assigns.user => a user struct
          true ->
            assign(conn, :user, nil)
      end
    end
end