class InfractionsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :supervisor, only: [:index, :edit, :update] 
  before_filter :admin_user,     only: :destroy

  def index
    @infractions = Infraction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @infractions }
    end
  end

  # GET /infractions/1
  # GET /infractions/1.json
  def show
    @infraction = Infraction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @infraction }
    end
  end

  # GET /infractions/new
  # GET /infractions/new.json
  def new
    @infraction = Infraction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @infraction }
    end
  end

  # GET /infractions/1/edit
  def edit
    @infraction = Infraction.find(params[:id])
  end

  # POST /infractions
  # POST /infractions.json
  def create
    @infraction = Infraction.new(params[:infraction])

    respond_to do |format|
      if @infraction.save
        format.html { redirect_to infractions_url, notice: 'Infraction was successfully created.' }
        format.json { render json: @infraction, status: :created, location: @infraction }
      else
        format.html { render action: "new" }
        format.json { render json: @infraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /infractions/1
  # PUT /infractions/1.json
  def update
    @infraction = Infraction.find(params[:id])

    respond_to do |format|
      if @infraction.update_attributes(params[:infraction])
        format.html { redirect_to users_url, notice: 'Infraction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @infraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /infractions/1
  # DELETE /infractions/1.json
  def destroy
    @infraction = Infraction.find(params[:id])
    @infraction.destroy

    respond_to do |format|
      format.html { redirect_to infractions_url }
      format.json { head :no_content }
    end
  end

private
    def supervisor
      redirect_to(root_path) unless current_user.supervisor?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
