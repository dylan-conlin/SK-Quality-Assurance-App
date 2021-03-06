class ProductionChecksController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :show, :update, :destroy]
  helper_method :sort_column, :sort_direction
  # GET /production_checks
  # GET /production_checks.json
  def index

    @production_checks = ProductionCheck.order(sort_column + " " + sort_direction).text_search(params[:query]).paginate(:per_page => 5, :page => params[:page])

  end

  # GET /production_checks/1
  # GET /production_checks/1.json
  def show
    @production_check = ProductionCheck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @production_check }
    end
  end

  # GET /production_checks/new
  # GET /production_checks/new.json
  def new
    @production_check = ProductionCheck.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @production_check }
    end
  end

  # GET /production_checks/1/edit
  def edit
    @production_check = ProductionCheck.find(params[:id])
  end

  # POST /production_checks
  # POST /production_checks.json
  def create
    @production_check = current_user.production_checks.build(params[:production_check])

    respond_to do |format|
      if @production_check.save
        if [@production_check.label_readability, 
            @production_check.label_accuracy,
            @production_check.seal_integrity,
            @production_check.build_accuracy].include? true
          UserMailer.production_check_alert(User.where(:receives_production_check_alert => true),@production_check).deliver
        end
        format.html { redirect_to production_checks_path, notice: 'Production check was successfully created.' }
        format.json { render json: @production_check, status: :created, location: @production_check }
      else
        format.html { render action: "new" }
        format.json { render json: @production_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /production_checks/1
  # PUT /production_checks/1.json
  def update
    @production_check = ProductionCheck.find(params[:id])

    respond_to do |format|
      if @production_check.update_attributes(params[:production_check])
        format.html { redirect_to @production_check, notice: 'Production check was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @production_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /production_checks/1
  # DELETE /production_checks/1.json
  def destroy
    @production_check = ProductionCheck.find(params[:id])
    @production_check.destroy

    respond_to do |format|
      format.html { redirect_to production_checks_url }
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
