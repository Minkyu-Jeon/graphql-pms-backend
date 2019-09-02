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

        project.boards.build(board)

        project.users << context[:current_user]
        
        if project.save
          {
            project: project,
            errors: []
          }
        else
          {
            project: null,
            errors: project.errors.full_messages
          }
        end
      end
    end
  end
end