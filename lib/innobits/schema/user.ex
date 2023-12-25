defmodule Innobits.Schema.User do
  use Ecto.Schema
  import Ecto.Changeset

    @required_fields ~w|
    name
    email
    password
    |a

    @optional_fields ~w|
     id
    |a

    @all_fields @required_fields ++ @optional_fields

    schema "users" do
      field :name,:string
      field :email,:string
      field :password,:string

      timestamps()

    end

    def changeset(user, attrs) do
      user
      |> cast(attrs, @all_fields)
      |> validate_required(@required_fields)

    end

end
