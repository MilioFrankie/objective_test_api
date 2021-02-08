defmodule ObjectiveTestApi.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :name, :string
      add :inserted_at, :naive_datetime, default: fragment("now()")
      add :updated_at, :naive_datetime, default: fragment("now()")
    end

  end
end
