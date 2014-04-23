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

		@resipi = Resipi.new(resipi_params) do |t|
			uploaded_io = params[:resipi][:image]

			if params[:resipi][:image]
				File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
		    		file.write(uploaded_io.read)
		    		t.filename = uploaded_io.original_filename
		    		t.mime_type = uploaded_io.content_type
		    	end
		    end
		end

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

	def destroy
		@resipi = Resipi.find(params[:id])
		@resipi.destroy

		redirect_to resipi_index_path
	end

	private
	def resipi_params
		params.require(:resipi).permit(:title, :text)
	end
end
