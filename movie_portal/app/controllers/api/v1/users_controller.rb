class Api::V1::UsersController < ApplicationController 

	def create
		@user=User.new(user_params)
		if @user.save
			render json: {message: 'Successfully created', data: @user, status_code: 201}
		else
			render json: {message: 'Failure', data: @user.errors, status_code: 422}
		end
	end

	def index
		if @users=User.all
			render json: {message: 'List of users', data: @users, status_code: 201}
		else
			render json: {message: 'Failure', data: @users.errors, status_code: 422}
		end
	end

	def show
		@user=User.find_by_name(params[:name])
		render json: {message: 'Users', data: @user, status_code: 201}
	end

	def update
		@user=User.find_by_id(params[:id])

		if @user.update_attributes(user_params)
			render json: {message: 'Successfully Updated', data: @user, status_code: 201}
		else
			render json: {message: 'Failure', data: @user.errors, status_code: 422}
		end
	end

	def destroy
		@user=User.find_by_id(params[:id])
		if @user.destroy
			render json: {message: 'Successfully Deleted', data: @user, status_code: 201}
		else
			render json: {message: 'Failure', data: @user.errors, status_code: 422}
		end

	end

	private
		def user_params
			params.require(:user).permit(:name,:age,:role,:gender)
		end
end