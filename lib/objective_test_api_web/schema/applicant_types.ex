defmodule ObjectiveTestApiWeb.Schema.ApplicantTypes do
    use Absinthe.Schema.Notation
    import_types ObjectiveTestApiWeb.Schema.SkillTypes
    
    object :applicant do 
        field :id, non_null(:id)
        field :name, non_null(:string)
        field :website, non_null(:string)
        field :cover_letter, non_null(:string)
        field :job_id, non_null(:id)
        field :skills, list_of(:skill)
    end
end