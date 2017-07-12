defmodule ElixirGql.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias ElixirGql.{Repo, User}

  def for_token(user = %User{}), do: { :ok, "User:#{user.id}" }
  def for_token(_), do: { :error, "Unknown resource type" }

  def from_tokne("User:" <> id), do: { :ok, Repo.get(User, id) }
  def from_token(_), do: { :error, "Unknown resource type" }
end