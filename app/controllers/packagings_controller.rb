class PackagingsController < ApplicationController
  before_filter :signed_in_user, only: :index
  before_filter :admin_user,     only: :destroy
  helper_method :sort_column, :sort_direction

  def index
    @packagings = Packaging.order(sort_column + " " + sort_direction).text_search(params[:query]).paginate(:per_page => 5, :page => params[:page])
  end

  # GET /packagings/1
  # GET /packagings/1.json
  def show
    @packaging = Packaging.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @packaging }
    end
  end

  # GET /packagings/new
  # GET /packagings/new.json
  def new
    @packaging = Packaging.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @packaging }
    end
  end

  # GET /packagings/1/edit
  def edit
    @packaging = Packaging.find(params[:id])
  end


  def create
    @packaging = current_user.packagings.build(params[:packaging])
    if @packaging.save
      flash[:success] = "Packaging created!"
      redirect_to packagings_url
    else

       render action: "new"
    end
  end



  def update
    @packaging = Packaging.find(params[:id])

    respond_to do |format|
      if @packaging.update_attributes(params[:packaging])
        format.html { redirect_to @packaging, notice: 'Packaging was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @packaging.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packagings/1
  # DELETE /packagings/1.json
  def destroy
    @packaging = Packaging.find(params[:id])
    @packaging.destroy

    respond_to do |format|
      format.html { redirect_to packagings_url }
      format.json { head :no_content }
    end
  end

private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

  def sort_column
    Issue.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
  end

end
