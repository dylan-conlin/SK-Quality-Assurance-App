class InstancesController < ApplicationController
  before_filter :signed_in_user, 
                only: [:index, :edit, :show, :update, :destroy]


  # GET /instances
  # GET /instances.json
  def index

    @instances = Instance.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @instances }
    end
  end

  # GET /instances/1
  # GET /instances/1.json
  def show

    @instance = Instance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @instance }
    end
  end

  # GET /instances/new
  # GET /instances/new.json
  def new
    @nonconformance = Nonconformance.find(params[:nonconformance_id])
    @instance = @nonconformance.instances.build
    
 end

 
  def edit
    @nonconformance = Nonconformance.find(params[:nonconformance_id])
    @instance = Instance.find(params[:id])

  end

  # POST /instances
  # POST /instances.json
  def create
    @nonconformance = Nonconformance.find(params[:nonconformance_id])    
    @instance = @nonconformance.instances.build(params[:instance].merge(:user_id => current_user.id))


    respond_to do |format|
      if @instance.save
        format.html { redirect_to nonconformance_path(@nonconformance), notice: 'Instance was successfully created.' }
        format.json { render json: @instance, status: :created, location: @instance }
      else
        format.html { render action: "new" }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /instances/1
  # PUT /instances/1.json
  def update

    @instance = Instance.find(params[:id])
    @nonconformance = Nonconformance.find(@instance.nonconformance_id)


    respond_to do |format|
      if @instance.update_attributes(params[:instance])
        
        format.html { redirect_to nonconformance_path(@nonconformance), notice: 'Your instance was successfully updated!' }

        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instances/1
  # DELETE /instances/1.json
  def destroy
    @nonconformance = current_user.nonconformances.find(params[:nonconformance_id])    
    @instance = Instance.find(params[:id])
    @instance.destroy

    respond_to do |format|
      format.html { redirect_to @nonconformance }
      format.json { head :no_content }
    end
  end
end
