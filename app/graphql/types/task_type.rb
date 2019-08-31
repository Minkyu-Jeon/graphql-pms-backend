module Types
  class TaskType < BaseObject
    description "태스크 타입"

    field :title, GraphQL::STRING_TYPE, null: false
    field :description, GraphQL::STRING_TYPE, null: true
    field :priority, GraphQL::INT_TYPE, null: false
    field :task_type, GraphQL::INT_TYPE, null: false
    field :project, Types::ProjectType, null: false
    field :board, Types::BoardType, null: false
    field :assignee, Types::UserType, null: true
    field :registrant, Types::UserType, null: false
    field :workflow, Types::WorkflowType, null: false
    field :comments, [Types::CommentType], null: true
  end
end