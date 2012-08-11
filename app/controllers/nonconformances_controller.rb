
class NonconformancesController < ApplicationController
  before_filter :signed_in_user, 
                only: [:index, :edit, :show, :update, :destroy]

  helper_method :sort_column, :sort_direction

  def index

    # if ["Quality Assurance", "Production"].include?(current_user.department.name)
    #   @nonconformances = Nonconformance.open.order(sort_column + " " + sort_direction).paginate(:per_page => 25, :page => params[:page])
    # elsif ["Logistics"].include?(current_user.department.name)
    #   @nonconformances = Nonconformance.in_process.order(sort_column + " " + sort_direction).paginate(:per_page => 25, :page => params[:page])
    # else   
    #   @nonconformances = Nonconformance.open.order(sort_column + " " + sort_direction).paginate(:per_page => 25, :page => params[:page])
      
    # end



    

    if params.has_key?(:status) == false
    @nonconformances = Nonconformance.open.order(sort_column + " " + sort_direction).paginate(:per_page => 25, :page => params[:page])
    end

    if params[:status]
    @nonconformances = Nonconformance.where(:status => (params[:status])).order(sort_column + " " + sort_direction).paginate(:per_page => 25, :page => params[:page])
    end


    if params[:limit]
    @nonconformances = Nonconformance.where(:status => (params[:status])).overdue.order(sort_column + " " + sort_direction).paginate(:per_page => 25, :page => params[:page])
    end




#     if params[:status] == 'Waiting on Supplier' 
#       @nonconformances = Nonconformance.where(:status => (params[:status]))
      
#       if params[:limit] == 'overdue' 
#         @nonconformances = Nonconformance.waiting_on_supplier.overdue
#       end
#     end

#     if params[:status] == 'Closed'
#       @nonconformances = Nonconformance.closed
#     end

  end

  # GET /nonconformances/1
  # GET /nonconformances/1.json
  def show
    @nonconformance = Nonconformance.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nonconformance }
      format.pdf do
        pdf = NonconformancePdf.new(@nonconformance, view_context)
        send_data pdf.render, filename: "SK Food Group Nonconformance Report: #{@nonconformance.component.supplier_description}  #{@nonconformance.created_at.strftime("%D")}.pdf", type: "application/pdf"
      end
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
        format.html { redirect_to @nonconformance, notice: 'Nonconformance was successfully created.' }
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
    my_status = @nonconformance.status

    respond_to do |format|
      if @nonconformance.update_attributes(params[:nonconformance])

        if @nonconformance.status == "Waiting on Supplier"
          @nonconformance.notification_date = Time.now
          @nonconformance.close_date = nil
          @nonconformance.save
        elsif @nonconformance.status == "Open"
          @nonconformance.notification_date = nil
          @nonconformance.close_date = nil
          @nonconformance.save
        elsif @nonconformance.status == "Closed"
          @nonconformance.notification_date = Time.now
          @nonconformance.close_date = Time.now
          @nonconformance.save
        else 
          @nonconformance.close_date = nil
          @nonconformance.save
        end


          format.html {
          redirect_to(nonconformances_path(:status => my_status)) }


      
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
