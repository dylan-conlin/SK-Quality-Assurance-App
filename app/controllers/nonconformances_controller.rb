class NonconformancesController < ApplicationController
  # GET /nonconformances
  # GET /nonconformances.json
  def index
    @nonconformances = Nonconformance.all

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
    @nonconformance = Nonconformance.new(params[:nonconformance])

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

    respond_to do |format|
      if @nonconformance.update_attributes(params[:nonconformance])
        format.html { redirect_to @nonconformance, notice: 'Nonconformance was successfully updated.' }
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
end
