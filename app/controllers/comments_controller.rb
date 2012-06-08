class CommentsController < ApplicationController
  before_filter :signed_in_user, 
                only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
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
      users_to_notify = @comments.map(&:user).uniq + [@commentable.user]
      bcc = users_to_notify.map(&:email).compact * ', '
      content = @comment.content
      commenter = @comment.user.name
      issue = @commentable
    UserMailer.notify_on_new_comment(bcc,content,commenter,issue).deliver
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
