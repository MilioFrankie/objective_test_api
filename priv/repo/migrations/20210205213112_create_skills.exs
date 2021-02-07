defmodule ObjectiveTestApi.Repo.Migrations.CreateSkills do
  use Ecto.Migration

  def change do
    create table(:skills) do
      add :name, :string
      add :applicant_id, references(:applicants, on_delete: :nothing)

      timestamps()
    end

    create index(:skills, [:applicant_id])
  end
end
