defmodule ObjectiveTestApiWeb.Schema do
    use Absinthe.Schema
    import_types ObjectiveTestApiWeb.Schema.JobTypes
    alias ObjectiveTestApiWeb.JobsResolver

    query do
        @desc "Get all jobs"
        field :all_jobs, list_of(:job) do
          resolve(&JobsResolver.all_jobs/3)
        end
    end
  end
  