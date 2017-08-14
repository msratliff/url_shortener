class LinksController < ApplicationController

	before_action :set_link, only: [:show]

	def index
		@links = Link.all
	end

	def new
		@link = Link.new
	end

	def create
		@link = Link.new(user_params)
		@link.generate_short_url
		@link.long_url_format

		if @link.save
			redirect_to '/links/new', notice: "Shortened URL: http://localhost:3000/#{@link.short_url}"
		else
			render 'new'
		end

	end

	def show
		if params.include? :id
			render 'links/show'
		else
			redirect_to @link.long_url
		end
		
	end



	private

		def set_link
    		if params.include? :id
    			@link = Link.find(params[:id])
    		end

    		if params.include? :short_url
	    		@link = Link.find_by(short_url: params[:short_url])
	    	end
		end

		def user_params
			params.require(:link).permit(:id, :long_url, :short_url)
		end

end
