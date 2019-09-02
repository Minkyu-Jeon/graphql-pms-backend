module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::Users::Create
    field :create_project, mutation: Mutations::Projects::Create
  end
end
