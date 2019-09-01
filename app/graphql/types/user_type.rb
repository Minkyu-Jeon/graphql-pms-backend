module Types
  class UserType < BaseObject
    description "사용자 모델"
    field :email, GraphQL::STRING_TYPE, null: false
    field :projects, [Types::ProjectType], resolve: -> (user, _args, _ctx) { user.projects }, null: true
    field :assigned_tasks, [Types::TaskType], resolve: -> (user, _args, _ctx) { user.assigned_tasks }, null: true
    field :registered_tasks, [Types::TaskType], resolve: -> (user, _args, _ctx) { user.registered_tasks }, null: true
    field :comments, [Types::CommentType], resolve: -> (user, _args, _ctx) { user.comments }, null: true
  end
end
