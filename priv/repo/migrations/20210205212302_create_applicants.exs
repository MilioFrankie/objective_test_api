defmodule ObjectiveTestApi.Repo.Migrations.CreateApplicants do
  use Ecto.Migration

  def change do
    create table(:applicants) do
      add :name, :string
      add :email, :string
      add :website, :string
      add :cover_letter, :text
      add :job_id, references(:jobs, on_delete: :nothing)
      add :inserted_at, :naive_datetime, default: fragment("now()")
      add :updated_at, :naive_datetime, default: fragment("now()")
    end

    create index(:applicants, [:job_id])
  end
end
