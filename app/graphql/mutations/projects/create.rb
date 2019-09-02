module Mutations
  module Projects
    class Create < Mutations::BaseMutation
      argument :name, String, required: false
      argument :description, String, required: true

      field :project, Types::ProjectType, null: true
      field :errors, [String], null: false

      def resolve(name:, description:, board_type:)
        project = Project.new(name: name, description: description)

        project.boards.build(board_type: board_type)

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