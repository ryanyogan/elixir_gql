defmodule ElixirGql.Schema do
  use Absinthe.Schema
  import_types ElixirGql.Schema.Types

  query do
    field :posts, list_of(:post) do
      resolve &ElixirGql.PostResolver.all/2
    end

    field :users, list_of(:user) do
      resolve &ElixirGql.UserResolver.all/2
    end

    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &ElixirGql.UserResolver.find/2
    end
  end
end
