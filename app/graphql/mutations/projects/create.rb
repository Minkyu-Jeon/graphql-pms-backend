module Mutations
  module Projects
    class Create < Mutations::BaseMutation
      graphql_name 'CreateProject'

      argument :name, GraphQL::STRING_TYPE, required: true
      argument :description, GraphQL::STRING_TYPE, required: false
      argument :board, Types::InputType::BoardInputType, required: false

      field :project, Types::ProjectType, null: true
      field :errors, [GraphQL::STRING_TYPE], null: false

      def resolve(name:, description:, board:)
        project = Project.new(name: name, description: description)

        board = Board.find_by(board_type: board.board_type)

        project.boards << board
        project.users << context[:current_user]
        context[:current_user].projects << project

        if project.save && context[:current_user].save
          {
            project: project,
            errors: []
          }
        else
          {
            project: nil,
            errors: project.errors.full_messages
          }
        end
      end
    end
  end
end