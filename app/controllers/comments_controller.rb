class CommentsController < ApplicationController
  before_filter :signed_in_user, 
                only: [:index, :edit, :update, :destroy]
  before_filter :admin_user,     only: :destroy
  before_filter :load_commentable
  def index
    @commentable = Issue.find(params[:issue_id])
    @comments = @commentable.comments

  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.build(params[:comment].merge(:user_id => current_user.id))
   if @comment.save
      @commentable = Issue.find(params[:issue_id])
      @comments = @commentable.comments
      if params[:user_ids].nil?
        picked_users = User.find(current_user.id)
        bcc = picked_users.email
      else 
        all_users = params[:user_ids].pop(current_user.id)
        picked_users = User.find(all_users).uniq
        bcc = picked_users.map(&:email).compact * ', '
      end
      content = @comment.content
      comment = @comment
      issue = @commentable
     comments = @comments
    UserMailer.notify_on_new_comment(bcc,content,comment,issue,comments).deliver
     redirect_to @commentable, notice: "Comment created."
   else
     render :new
   end
  end

private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end


end
