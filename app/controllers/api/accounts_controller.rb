module Api
	class AccountsController < Api::BaseController
		before_action :set_account, only: [:show, :edit, :update, :destroy]

		def index
			respond_with current_user.accounts.all
		end

		def show 
			respond_with @account
		end

		def create
			respond_with current_user.create(account_params)
		end

		def update
			respond_with @account.update(account_params)
		end

		def destroy
			respond_with @account.destroy
		end

		private 
			def set_account
				@account = current_user.accounts.find(params[:id])
				rescue Mongoid::Errors::DocumentNotFound => e
					respond_to do |format|
						format.json {render json: {msg: "account[#{params[:id]}] not found"}, status: :not_found}
				end
			end
			def account_params
				params.require(:account).permit(:id, :website, :email, :user_name, :password)
			end
		
	end
end
