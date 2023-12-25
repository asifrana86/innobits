defmodule Innobits.Repo.Migrations.CreateTablePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :description, :string



      timestamps()
    end
  end
end
