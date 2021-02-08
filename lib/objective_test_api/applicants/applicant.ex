defmodule ObjectiveTestApi.Applicants.Applicant do
  use Ecto.Schema
  import Ecto.Changeset
  alias ObjectiveTestApi.Skills.Skill
  alias ObjectiveTestApi.Jobs.Job

  schema "applicants" do
    field :cover_letter, :string
    field :email, :string
    field :name, :string
    field :website, :string
    has_many :skills, Skill
    belongs_to :job, Job

    timestamps()
  end

  @doc false
  def changeset(applicant, attrs) do
    applicant
    |> cast(attrs, [:name, :email, :website, :cover_letter, :job_id])
    |> validate_required([:name, :email, :website, :cover_letter])
  end
end
