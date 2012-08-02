
class NonconformancesController < ApplicationController
  before_filter :signed_in_user, 
                only: [:index, :edit, :show, :update, :destroy]

  helper_method :sort_column, :sort_direction


  def index

    if ["Quality Assurance", "Production"].include?(current_user.department.name)
          @nonconformances = Nonconformance.open.order(sort_column + " " + sort_direction).paginate(:per_page => 25, :page => params[:page])
    elsif ["Logistics"].include?(current_user.department.name)
          @nonconformances = Nonconformance.in_process.order(sort_column + " " + sort_direction).paginate(:per_page => 25, :page => params[:page])
    else   
          @nonconformances = Nonconformance.open.order(sort_column + " " + sort_direction).paginate(:per_page => 25, :page => params[:page])

    end

    if params[:status] == "Open"
      @nonconformances = Nonconformance.open.order(sort_column + " " + sort_direction).paginate(:per_page => 25, :page => params[:page])
    elsif params[:status] == "In Process"
      @nonconformances = Nonconformance.in_process.order(sort_column + " " + sort_direction).paginate(:per_page => 25, :page => params[:page])
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nonconformances }
    end
  end

  # GET /nonconformances/1
  # GET /nonconformances/1.json
  def show
    @nonconformance = Nonconformance.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nonconformance }
    end
  end

  # GET /nonconformances/new
  # GET /nonconformances/new.json
  def new
    @nonconformance = Nonconformance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nonconformance }
    end
  end

  # GET /nonconformances/1/edit
  def edit
    @nonconformance = Nonconformance.find(params[:id])
  end

  # POST /nonconformances
  # POST /nonconformances.json
  def create

    @nonconformance = current_user.nonconformances.build(params[:nonconformance])
    respond_to do |format|
      if @nonconformance.save
        format.html { redirect_to nonconformances_path, notice: 'Nonconformance was successfully created.' }
        format.json { render json: @nonconformance, status: :created, location: @nonconformance }
      else
        format.html { render action: "new" }
        format.json { render json: @nonconformance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /nonconformances/1
  # PUT /nonconformances/1.json
  def update
    @nonconformance = Nonconformance.find(params[:id])

    respond_to do |format|
      if @nonconformance.update_attributes(params[:nonconformance])
        format.html { redirect_to nonconformances_path, notice: 'Nonconformance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @nonconformance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nonconformances/1
  # DELETE /nonconformances/1.json
  def destroy
    @nonconformance = Nonconformance.find(params[:id])
    @nonconformance.destroy

    respond_to do |format|
      format.html { redirect_to nonconformances_url }
      format.json { head :no_content }
    end
  end
private
  def sort_column
    Nonconformance.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
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
