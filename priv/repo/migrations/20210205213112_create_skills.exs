defmodule ObjectiveTestApi.Repo.Migrations.CreateSkills do
  use Ecto.Migration

  def change do
    create table(:skills) do
      add :name, :string
      add :applicant_id, references(:applicants, on_delete: :nothing)
      add :inserted_at, :naive_datetime, default: fragment("now()")
      add :updated_at, :naive_datetime, default: fragment("now()")
    end

    create index(:skills, [:applicant_id])
  end
end
