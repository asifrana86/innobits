defmodule Innobits.Context.Users do
  import Ecto.Query, warn: false
alias Innobits.Repo
alias Innobits.Schema.User


def list_users do
  Repo.all(User)
end

def create_user(attrs \\ %{}) do
  %User{}
|>User.changeset(attrs)
|> Repo.insert()
end

def get_user!(id) do
  Repo.get(User, id)
end

def update_user(%User{} = user, attrs) do
  user
  |> User.changeset(attrs)
  |> Repo.update()
end

def delete_user(%User{} = user) do
  Repo.delete(user)
end
end
