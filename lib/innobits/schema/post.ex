defmodule Innobits.Schema.Post do
  use Ecto.Schema
  import Ecto.Changeset

    @required_fields ~w|
    title
    description
    |a

    @optional_fields ~w|
     id
    |a

    @all_fields @required_fields ++ @optional_fields

    schema "posts" do
      field :title,:string
      field :description,:string


      timestamps()

    end

    def changeset(post, attrs) do
      post
      |> cast(attrs, @all_fields)
      |> validate_required(@required_fields)

    end

end
