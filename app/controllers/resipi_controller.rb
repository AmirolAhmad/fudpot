class ResipiController < ApplicationController
	def index
		@resipi = Resipi.all
	end

	def new
		@resipi = Resipi.new
	end

	def create
		#to inspect the output
		#render plain: params[:resipi].inspect

		@resipi = Resipi.new(resipi_params)

		if @resipi.save
			redirect_to @resipi
		else
			render 'new'
		end
	end

	def edit
		@resipi = Resipi.find(params[:id])
	end

	def update
		@resipi = Resipi.find(params[:id])

		if @resipi.update(resipi_params)
			redirect_to @resipi
		else
			render 'edit'
		end
	end

	def show
		@resipi = Resipi.find(params[:id])
	end

	private
	def resipi_params
		params.require(:resipi).permit(:title, :text)
	end
end
