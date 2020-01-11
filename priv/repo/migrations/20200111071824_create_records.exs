defmodule Verwatch.Repo.Migrations.CreateRecords do
  use Ecto.Migration

  def change do
    create table(:records) do
      add :name, :string
      add :version, :string
      add :datetime, :naive_datetime
      add :info, :text

      timestamps()
    end

    create unique_index(:records, [:name])
  end
end
