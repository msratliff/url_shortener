class LinksController < ApplicationController

	def new
		@link = Link.new
	end

	def create
		@link = Link.new(user_params)
		if @link.save
			redirect_to show_path
		else
			@link.generate_short_url
			@link.save
		end

	end


	private

		def set_user
    	@user = User.find(params[:id])
		end

		def user_params
			params.require(:link).permit(:long_url)
		end

end
