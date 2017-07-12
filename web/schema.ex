defmodule ElixirGql.Schema do
  alias ElixirGql.{PostResolver, UserResolver}

  use Absinthe.Schema
  import_types ElixirGql.Schema.Types

  query do
    field :posts, list_of(:post) do
      resolve &PostResolver.all/2
    end

    field :users, list_of(:user) do
      resolve &UserResolver.all/2
    end

    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &ElixirGql.UserResolver.find/2
    end
  end

  input_object :update_post_params do
    field :title, non_null(:string)
    field :body, non_null(:string)
    field :user_id, non_null(:integer)
  end

  mutation do
    field :create_post, type: :post do
      arg :title, non_null(:string)
      arg :body, non_null(:string)
      arg :user_id, non_null(:integer)

      resolve &PostResolver.create/2
    end

    field :update_post, type: :post do
      arg :id, non_null(:integer)
      arg :post, :update_post_params

      resolve &PostResolver.update/2
    end

    field :delete_post, type: :post do
      arg :id, non_null(:integer)

      resolve &PostResolver.delete/2
    end
  end
end
