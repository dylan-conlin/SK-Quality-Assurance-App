class WorkordersController < ApplicationController
  before_filter :signed_in_user, 
                only: [:index, :edit, :show, :update, :destroy]


  def index
    @workorders = Workorder.order("position")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workorders }
    end
  end


  
  def sort
    params[:workorder].each_with_index do |id, index|
      Workorder.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end


  # GET /workorders/1
  # GET /workorders/1.json
  def show
    @workorder = Workorder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workorder }
    end
  end

  # GET /workorders/new
  # GET /workorders/new.json
  def new
    @workorder = Workorder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workorder }
    end
  end

  # GET /workorders/1/edit
  def edit
    @workorder = Workorder.find(params[:id])
  end

  # POST /workorders
  # POST /workorders.json
  def create
    @workorder = Workorder.new(params[:workorder])

    respond_to do |format|
      if @workorder.save
        format.html { redirect_to @workorder, notice: 'Workorder was successfully created.' }
        format.json { render json: @workorder, status: :created, location: @workorder }
      else
        format.html { render action: "new" }
        format.json { render json: @workorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workorders/1
  # PUT /workorders/1.json
  def update
    @workorder = Workorder.find(params[:id])

    respond_to do |format|
      if @workorder.update_attributes(params[:workorder])
        format.html { redirect_to @workorder, notice: 'Workorder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workorders/1
  # DELETE /workorders/1.json
  def destroy
    @workorder = Workorder.find(params[:id])
    @workorder.destroy

    respond_to do |format|
      format.html { redirect_to workorders_url }
      format.json { head :no_content }
    end
  end
end
