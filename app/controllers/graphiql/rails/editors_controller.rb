module GraphiQL
  module Rails
    class EditorsController < ActionController::Base
      def show
        authenticate_or_request_with_http_basic do |email, password|
          user = User.find_by(email: email)
          if user.authenticate(password)
            token = Authentication::JsonWebToken.encode({user_id: user.id})
            cookies.signed[:jwt] = { value: token, httponly: true }
          end
        end
      end

      helper_method :graphql_endpoint_path
      def graphql_endpoint_path
        params[:graphql_path] || raise(%|You must include `graphql_path: "/my/endpoint"` when mounting GraphiQL::Rails::Engine|)
      end
    end
  end
end