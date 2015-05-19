class CommentsController < ApplicationController
	before_action :authenticate_user!

  # Create a comment
	def create
		@comment = current_user.comments.new(comment_params)

    if @comment.save
      render :json => { :message => "Successful", :saved => true }
    else
      render :json => { :message => "Unsuccessful", :saved => false }
    end
	end

	private

	def comment_params
		params.require(:comment).permit(:content, :dish_id)
	end
end
