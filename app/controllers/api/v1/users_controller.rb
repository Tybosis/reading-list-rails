module API
  module V1
    class UsersController < API::V1::BaseController
      acts_as_token_authenticatable
    end
  end
end
