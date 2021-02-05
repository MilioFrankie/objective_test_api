defmodule ObjectiveTestApiWeb.JobsResolver do
    alias ObjectiveTestApi.Jobs
  
    def all_jobs(_root, _args, _info) do
      {:ok, Jobs.list_jobs()}
    end
  end