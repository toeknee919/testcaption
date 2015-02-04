class EditorController < ApplicationController
	def index
		@sample_text = Text.first
		work = Work.find_by_id(params['work'])
		@text = Text.all.where(work: params[:work])
		# render json: @text
	end

	def select

		if request.post?
			# set position to the value stored in the operator record
			redirect_to :controller => 'editor', :action => 'index',
				:work => params['work']
		end
	end

	def edit
		@sample_text = Text.first
		respond_to do |edit|
			edit.html
			edit.js
		end
	end
end
