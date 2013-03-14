class PatientsController < ApplicationController
  # GET /patients
  # GET /patients.json

  def index
    @patients = Patient.find(:all, :conditions =>{ :is_deleted => false })

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patients }
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @patient = Patient.find(params[:id])
    if @patient.is_deleted?
      @patient = nil
    else
      Patient.update(@patient.id, :viewed_count => @patient.viewed_count +=1)
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/new
  # GET /patients/new.json
  def new
    @patient = Patient.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
  end

  # POST /patients
  # POST /patients.json
  def create
    @location = Location.find(params[:patient][:location_id] )
    @patient = @location.patients.create(params[:patient]);
    @patient.is_deleted = false
    @patient.viewed_count = 0

    #@patient = Patient.new(params[:patient])
    #@patient =Patient.new(params[:patient]);
    # patient.location_id = params[:location_id]


    respond_to do |format|
      if @location.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render json: @patient, status: :created, location: @patient }
      else
        format.html { render action: "new" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /patients/1
  # PUT /patients/1.json
  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient = Patient.find(params[:id])
    #@patient.destroy
    Patient.update(@patient.id, :is_deleted => true)
    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end
end
