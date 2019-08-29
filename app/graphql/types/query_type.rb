module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: false, description: 'User model'
    def users
      User.all
    end
  end
end
