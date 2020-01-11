defmodule Verwatch.Records.Record do
  use Ecto.Schema
  import Ecto.Changeset

  schema "records" do
    field :datetime, :naive_datetime
    field :info, :string
    field :name, :string
    field :version, :string

    timestamps()
  end

  @doc false
  def changeset(record, attrs) do
    record
    |> cast(attrs, [:name, :version, :datetime, :info])
    |> validate_required([:name, :version, :datetime, :info])
    |> unique_constraint(:name)
  end
end
