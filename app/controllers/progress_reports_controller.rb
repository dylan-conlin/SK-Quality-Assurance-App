class ProgressReportsController < ApplicationController
  # GET /progress_reports
  # GET /progress_reports.json
  def index
    @progress_reports = ProgressReport.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @progress_reports }
    end
  end

  # GET /progress_reports/1
  # GET /progress_reports/1.json
  def show
    @progress_report = ProgressReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @progress_report }
    end
  end

  # GET /progress_reports/new
  # GET /progress_reports/new.json
  def new
    @progress_report = ProgressReport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @progress_report }
    end
  end

  # GET /progress_reports/1/edit
  def edit
    @progress_report = ProgressReport.find(params[:id])
  end

  # POST /progress_reports
  # POST /progress_reports.json
  def create
    @progress_report = ProgressReport.new(params[:progress_report])

    respond_to do |format|
      if @progress_report.save
        format.html { redirect_to @progress_report, notice: 'Progress report was successfully created.' }
        format.json { render json: @progress_report, status: :created, location: @progress_report }
      else
        format.html { render action: "new" }
        format.json { render json: @progress_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /progress_reports/1
  # PUT /progress_reports/1.json
  def update
    @progress_report = ProgressReport.find(params[:id])

    respond_to do |format|
      if @progress_report.update_attributes(params[:progress_report])
        format.html { redirect_to @progress_report, notice: 'Progress report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @progress_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /progress_reports/1
  # DELETE /progress_reports/1.json
  def destroy
    @progress_report = ProgressReport.find(params[:id])
    @progress_report.destroy

    respond_to do |format|
      format.html { redirect_to progress_reports_url }
      format.json { head :no_content }
    end
  end
end
