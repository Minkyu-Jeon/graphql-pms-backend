module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::Users::Create
    field :create_project, mutation: Mutations::Projects::Create
    field :signin, mutation: Mutations::Sessions::Create
  end
end
