module Types
  class ProjectType < BaseObject
    description "프로젝트 모델"

    field :name, GraphQL::STRING_TYPE, null: false
    field :description, GraphQL::STRING_TYPE, null: false
    field :users, [Types::UserType], resolve: -> (project, _args, _ctx) { project.users }, null: true
    field :boards, [Types::BoardType], resolve: -> (project, _args, _ctx) { project.boards }, null: true
    field :tasks, [Types::TaskType], resolve: -> (tasks, _args, _ctx) { project.tasks }, null: true
  end
end