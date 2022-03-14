defmodule Community.Web.Schema do
  use Absinthe.Schema

  alias Community.{Web, News}

  object :link do
    field :id, non_null(:id)
    field :url, non_null(:string)
    field :description, non_null(:string)
  end

  query do
    @desc "get all links"
    field :all_links, non_null(list_of(non_null(:link))) do
      resolve(&Web.NewsResolver.all_links/3)
    end

    mutation do
      @desc "create a new link"
      field :create_link, :link do
        arg :url, non_null(:string)

        resolve &NewsResolver.create_link/3
    end
  end
end
