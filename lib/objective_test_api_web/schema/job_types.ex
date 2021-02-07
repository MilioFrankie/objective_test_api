defmodule ObjectiveTestApiWeb.Schema.JobTypes do
    use Absinthe.Schema.Notation
    import_types ObjectiveTestApiWeb.Schema.ApplicantTypes

    object :job do
        field :id, non_null(:id)
        field :name, non_null(:string)
        field :applicants, list_of(:applicant)
    end
end