module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: false, resolve: -> (obj, _args, _ctx) { User.all }, description: 'User model'
  end
end
