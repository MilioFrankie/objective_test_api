defmodule ObjectiveTestApiWeb.Schema.SkillTypes do
    use Absinthe.Schema.Notation
    
    object :skill do
        field :id, non_null(:id)
        field :name, non_null(:string)
        field :applicant_id, non_null(:id)
    end
end