module Types
  class TaskType < BaseObject
    description "태스크 타입"

    field :title, GraphQL::STRING_TYPE, null: false
    field :description, GraphQL::STRING_TYPE, null: true
    field :priority, GraphQL::INT_TYPE, null: false
    field :task_type, GraphQL::INT_TYPE, null: false
    field :project, Types::ProjectType, resolve: -> (task, _args, _ctx) { task.project }, null: false
    field :board, Types::BoardType, resolve: -> (task, _args, _ctx) { task.board }, null: false
    field :assignee, Types::UserType, resolve: -> (task, _args, _ctx) { task.assignee }, null: true
    field :registrant, Types::UserType, resolve: -> (task, _args, _ctx) { task.registrant }, null: false
    field :workflow, Types::WorkflowType, resolve: -> (task, _args, _ctx) { task.workflow }, null: false
    field :comments, [Types::CommentType], resolve: -> (task, _args, _ctx) { task.comments }, null: true
  end
end