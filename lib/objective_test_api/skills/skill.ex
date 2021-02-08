defmodule ObjectiveTestApi.Skills.Skill do
  use Ecto.Schema
  import Ecto.Changeset
  alias ObjectiveTestApi.Applicants.Applicant

  schema "skills" do
    field :name, :string
    belongs_to :applicant, Applicant

    timestamps()
  end

  @doc false
  def changeset(skill, attrs) do
    skill
    |> cast(attrs, [:name, :applicant_id])
    |> validate_required([:name])
  end
end
