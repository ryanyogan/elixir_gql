defmodule ElixirGql.PostResolver do
  alias ElixirGql.{Repo, Post}

  def all(_args, _info) do
    {:ok, Repo.all(Post)}
  end
end
