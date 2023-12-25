defmodule Innobits.Context.Posts do
  import Ecto.Query, warn: false
alias Innobits.Repo
alias Innobits.Schema.Post


def list_posts do
  Repo.all(Post)
end


def create_post(attrs \\ %{}) do
  %Post{}
|>Post.changeset(attrs)
|> Repo.insert()
end

def get_post!(id) do
  Repo.get(Post, id)
end

def update_post(%Post{} = post, attrs) do
  post
  |> Post.changeset(attrs)
  |> Repo.update()
end

def delete_post(%Post{} = post) do
  Repo.delete(post)
end
end
