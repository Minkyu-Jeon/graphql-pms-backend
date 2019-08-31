module Types
  class UserType < BaseObject
    description "사용자 모델"
    field :email, GraphQL::STRING_TYPE, null: false
    field :projects, [Types::ProjectType], null: true
    field :assigned_tasks, [Types::TaskType], null: true
    field :registered_tasks, [Types::TaskType], null: true
    field :comments, [Types::CommentType], null: true
  end
end
