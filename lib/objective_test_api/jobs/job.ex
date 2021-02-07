defmodule ObjectiveTestApi.Jobs.Job do
  use Ecto.Schema
  import Ecto.Changeset
  alias ObjectiveTestApi.Applicants.Applicant

  schema "jobs" do
    field :name, :string
    has_many :applicants, Applicant, foreign_key: :job_id

    timestamps()
  end

  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
