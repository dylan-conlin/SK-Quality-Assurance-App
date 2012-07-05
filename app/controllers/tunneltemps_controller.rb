class TunneltempsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :show, :update, :destroy]
  before_filter :admin_user,     only: :destroy

  # GET /tunneltemps
  # GET /tunneltemps.json
  def index
    @tunneltemps = Tunneltemp.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tunneltemps }
    end
  end

  # GET /tunneltemps/1
  # GET /tunneltemps/1.json
  def show
    @tunneltemp = Tunneltemp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tunneltemp }
    end
  end

  # GET /tunneltemps/new
  # GET /tunneltemps/new.json
  def new
    @tunneltemp = Tunneltemp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tunneltemp }
    end
  end

  # GET /tunneltemps/1/edit
  def edit
    @tunneltemp = Tunneltemp.find(params[:id])
  end

  # POST /tunneltemps
  # POST /tunneltemps.json




  def create
    @tunneltemp = current_user.tunneltemps.build(params[:tunneltemp])


    if @tunneltemp.save
      if @tunneltemp.temperature > 28
        UserMailer.above_temp(User.find_by_email("dylan.conlin@skfoodgroup.com")).deliver
      end
      flash[:success] = "Tunneltemp created!"
      redirect_to tunneltemps_url
    else

       render action: "new"
    end
  end




  # PUT /tunneltemps/1
  # PUT /tunneltemps/1.json
  def update
    @tunneltemp = Tunneltemp.find(params[:id])

    respond_to do |format|
      if @tunneltemp.update_attributes(params[:tunneltemp])
        format.html { redirect_to @tunneltemp, notice: 'Tunneltemp was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tunneltemp.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @tunneltemp = Tunneltemp.find(params[:id])
    @tunneltemp.destroy

    respond_to do |format|
      format.html { redirect_to tunneltemps_url }
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


end
