defmodule ObjectiveTestApi.Skills.Skill do
  use Ecto.Schema
  import Ecto.Changeset
  alias ObjectiveTestApi.Applicants.Applicant

  schema "skills" do
    field :name, :string
    # field :applicant_id, :id
    belongs_to :applicant, Applicant, foreign_key: :applicant_id


    timestamps()
  end

  @doc false
  def changeset(skill, attrs) do
    skill
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
