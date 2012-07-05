class IssuesController < ApplicationController
  before_filter :signed_in_user, 
                only: [:index, :edit, :show, :update, :destroy]

  helper_method :sort_column, :sort_direction

  def index
    @issues = Issue.order(sort_column + " " + sort_direction).text_search(params[:query]).paginate(:per_page => 5, :page => params[:page])
  end

  def show
    @issue = Issue.find(params[:id])
    @commentable = @issue
    @comments = @commentable.comments
    @comment = Comment.new
  end



  # GET /issues/new
  # GET /issues/new.json
  def new
    @issue = Issue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @issue }
    end
  end

  # GET /issues/1/edit
  def edit
    @issue = Issue.find(params[:id])
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = current_user.issues.build(params[:issue])
    if @issue.save
      if params[:user_ids].nil?
      
      else
        @selected_users = User.find(params[:user_ids])
        bcc = @selected_users.map(&:email).compact * ', '

        description = @issue.description
        user = @issue.user
        issue = @issue

        UserMailer.notify_on_new_issue(bcc,description,user,issue).deliver
      end
        flash[:success] = "Issue created!"
        redirect_to issues_url
    else
       render action: "new"
    end
  end



  # PUT /issues/1
  # PUT /issues/1.json
  def update
    @issue = Issue.find(params[:id])

    respond_to do |format|
      if @issue.update_attributes(params[:issue])
      
          if params[:user_ids].nil?

          else
            @selected_users = User.find(params[:user_ids])
            bcc = @selected_users.map(&:email).compact * ', '

            description = @issue.description
            user = @issue.user
            issue = @issue

            UserMailer.notify_on_new_issue(bcc,description,user,issue).deliver
          end
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy

    respond_to do |format|
      format.html { redirect_to issues_url }
      format.json { head :no_content }
    end
  end

private
  def sort_column
    Issue.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end


end
