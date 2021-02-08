defmodule ObjectiveTestApiWeb.AbsintheHelpers do
    @moduledoc """
    Absinthe Helpers to be used in tests.
    """  
  
    @spec query_skeleton(String.t(), String.t()) :: map
    def query_skeleton(query, query_name) do
      %{
        "operationName" => "#{query_name}",
        "query" => "query #{query_name} #{query}",
        "variables" => "{}"
      }
    end
  end