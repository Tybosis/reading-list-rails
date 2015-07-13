module API
  module V1
    class BaseController < ApplicationController
      acts_as_token_authentication_handler_for User

      private

      rescue_from ActionController::RoutingError, with: :render_404
      rescue_from ActiveRecord::RecordNotFound, with: :render_404

      def render_404
        render object_not_found_error
      end

      def object_not_found_error
        { json: { "message": "Object does not exist" }, status: 404 }
      end

    end
  end
end
