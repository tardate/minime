class UserSessionsController < ApplicationController
	def new
		@user_session = UserSession.new
	end

	def create
		@user_session = UserSession.new(params[:user_session])
		@user_session.save do |result|
			if result
				flash[:notice] = "Successfully signed in."
				redirect_to articles_path
			else
				render :action => 'new'
			end
		end
	end

	def destroy
		@user_session = UserSession.find(params[:id])
		@user_session.destroy
		flash[:notice] = "Successfully signed out."
		redirect_to articles_path
	end
end
