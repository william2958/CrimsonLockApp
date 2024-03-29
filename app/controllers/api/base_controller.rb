module Api
	class BaseController < ApplicationController
		include DeviseTokenAuth::Concerns::SetUserByToken
		before_action :authenticate_user!
		before_action :user_signed_in?
		protect_from_forgery with: :null_session
		respond_to :json
	end
end 