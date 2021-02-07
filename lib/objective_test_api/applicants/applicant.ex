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
    # field :job_id, :id
    has_many :skills, Skill, foreign_key: :applicant_id
    belongs_to :job, Job, foreign_key: :job_id

    timestamps()
  end

  @doc false
  def changeset(applicant, attrs) do
    applicant
    |> cast(attrs, [:name, :email, :website, :cover_letter])
    |> validate_required([:name, :email, :website, :cover_letter])
  end
end
