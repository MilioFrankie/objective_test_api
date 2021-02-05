defmodule ObjectiveTestApiWeb.Router do
  use ObjectiveTestApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward("/graphiql", Absinthe.Plug.GraphiQL,
      schema: ObjectiveTestApiWeb.Schema,
      interface: :simple,
      context: %{pubsub: ObjectiveTestApiWeb.Endpoint})
      
    forward("/graphql", Absinthe.Plug, schema: ObjectiveTestApiWeb.Schema)
  end

end