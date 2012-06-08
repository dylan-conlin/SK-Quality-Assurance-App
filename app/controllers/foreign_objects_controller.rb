class ForeignObjectsController < ApplicationController
  before_filter :signed_in_user, 
                only: [:index, :edit, :update, :destroy]
  before_filter :admin_user,     only: :destroy

  # GET /foreign_objects
  # GET /foreign_objects.json
  def index
    @foreign_objects = ForeignObject.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @foreign_objects }
    end
  end

  # GET /foreign_objects/1
  # GET /foreign_objects/1.json
  def show
    @foreign_object = ForeignObject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @foreign_object }
    end
  end

  # GET /foreign_objects/new
  # GET /foreign_objects/new.json
  def new
    @foreign_object = ForeignObject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @foreign_object }
    end
  end

  # GET /foreign_objects/1/edit
  def edit
    @foreign_object = ForeignObject.find(params[:id])
  end

  # POST /foreign_objects
  # POST /foreign_objects.json
  def create
    @foreign_object = ForeignObject.new(params[:foreign_object])

    respond_to do |format|
      if @foreign_object.save
        format.html { redirect_to @foreign_object, notice: 'Foreign object was successfully created.' }
        format.json { render json: @foreign_object, status: :created, location: @foreign_object }
      else
        format.html { render action: "new" }
        format.json { render json: @foreign_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /foreign_objects/1
  # PUT /foreign_objects/1.json
  def update
    @foreign_object = ForeignObject.find(params[:id])

    respond_to do |format|
      if @foreign_object.update_attributes(params[:foreign_object])
        format.html { redirect_to @foreign_object, notice: 'Foreign object was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @foreign_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foreign_objects/1
  # DELETE /foreign_objects/1.json
  def destroy
    @foreign_object = ForeignObject.find(params[:id])
    @foreign_object.destroy

    respond_to do |format|
      format.html { redirect_to foreign_objects_url }
      format.json { head :no_content }
    end
  end
end
