class GmpsController < ApplicationController
  before_filter :signed_in_user, 
                only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy


  # GET /gmps
  # GET /gmps.json
  def index
    @gmps = Gmp.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gmps }
    end
  end

  # GET /gmps/1
  # GET /gmps/1.json
  def show
    @gmp = Gmp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gmp }
    end
  end

  # GET /gmps/new
  # GET /gmps/new.json
  def new
    @gmp = Gmp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gmp }
    end
  end

  # GET /gmps/1/edit
  def edit
    @gmp = Gmp.find(params[:id])
  end

  # POST /gmps
  # POST /gmps.json
  def create
    @gmp = Gmp.new(params[:gmp])

    respond_to do |format|
      if @gmp.save
        format.html { redirect_to @gmp, notice: 'Gmp was successfully created.' }
        format.json { render json: @gmp, status: :created, location: @gmp }
      else
        format.html { render action: "new" }
        format.json { render json: @gmp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gmps/1
  # PUT /gmps/1.json
  def update
    @gmp = Gmp.find(params[:id])

    respond_to do |format|
      if @gmp.update_attributes(params[:gmp])
        format.html { redirect_to @gmp, notice: 'Gmp was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gmp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gmps/1
  # DELETE /gmps/1.json
  def destroy
    @gmp = Gmp.find(params[:id])
    @gmp.destroy

    respond_to do |format|
      format.html { redirect_to gmps_url }
      format.json { head :no_content }
    end
  end
end
