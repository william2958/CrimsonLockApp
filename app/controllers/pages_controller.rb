class PagesController < ApplicationController

	before_action :authenticate_user!
	before_action :user_signed_in?

	def index
	end
end
