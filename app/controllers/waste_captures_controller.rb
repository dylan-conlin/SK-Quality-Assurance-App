class WasteCapturesController < ApplicationController
  # GET /waste_captures
  # GET /waste_captures.json
  def index
    @waste_captures = WasteCapture.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @waste_captures }
    end
  end

  # GET /waste_captures/1
  # GET /waste_captures/1.json
  def show
    @waste_capture = WasteCapture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @waste_capture }
    end
  end

  # GET /waste_captures/new
  # GET /waste_captures/new.json
  def new
    @waste_capture = WasteCapture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @waste_capture }
    end
  end

  # GET /waste_captures/1/edit
  def edit
    @waste_capture = WasteCapture.find(params[:id])
  end

  # POST /waste_captures
  # POST /waste_captures.json
  def create
    @waste_capture = current_user.waste_captures.build(params[:waste_capture])

    respond_to do |format|
      if @waste_capture.save
        format.html { redirect_to @waste_capture, notice: 'Waste capture was successfully created.' }
        format.json { render json: @waste_capture, status: :created, location: @waste_capture }
      else
        format.html { render action: "new" }
        format.json { render json: @waste_capture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /waste_captures/1
  # PUT /waste_captures/1.json
  def update
    @waste_capture = WasteCapture.find(params[:id])

    respond_to do |format|
      if @waste_capture.update_attributes(params[:waste_capture])
        format.html { redirect_to @waste_capture, notice: 'Waste capture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @waste_capture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /waste_captures/1
  # DELETE /waste_captures/1.json
  def destroy
    @waste_capture = WasteCapture.find(params[:id])
    @waste_capture.destroy

    respond_to do |format|
      format.html { redirect_to waste_captures_url }
      format.json { head :no_content }
    end
  end
end
