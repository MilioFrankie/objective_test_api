defmodule ObjectiveTestApiWeb.Schema do
    use Absinthe.Schema
  
    alias ObjectiveTestApiWeb.JobsResolver

    object :job do
      field :id, non_null(:id)
      field :name, non_null(:string)
    end

    query do
        @desc "Get all jobs"
        field :all_jobs, non_null(list_of(non_null(:job))) do
          resolve(&JobsResolver.all_jobs/3)
        end
    end
  end
  