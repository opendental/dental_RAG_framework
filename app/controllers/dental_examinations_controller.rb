class DentalExaminationsController < ApplicationController
  before_filter :get_patient
  before_action :set_dental_examination, only: [:show, :edit, :update, :destroy]

  # GET /dental_examinations
  def index
    @dental_examinations = DentalExamination.all
  end

  # GET /dental_examinations/1
  def show
  end

  # GET /dental_examinations/new
  def new
    @dental_examination = DentalExamination.new(patient: @patient)
    @dental_examination.caries_findings_clinical = {:teeth_with_no_carious_lesions => true}
    @dental_examination.caries_findings_patient = {
      :caries_symptoms => false,
      :excess_dietary_sugar => false,
      :poor_plaque_control => true,
      :dry_mouth => false
    }
  end

  # GET /dental_examinations/1/edit
  def edit
  end

  # POST /dental_examinations
  def create
    @dental_examination = DentalExamination.new(dental_examination_params)
    if @dental_examination.save
      redirect_to @dental_examination, notice: 'Dental examination was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dental_examinations/1
  def update
    if @dental_examination.update(dental_examination_params)
      redirect_to @dental_examination, notice: 'Dental examination was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dental_examinations/1
  def destroy
    @dental_examination.destroy
    redirect_to dental_examinations_url, notice: 'Dental examination was successfully destroyed.'
  end

  protected
    def get_patient
      @patient = Patient.find(params[:patient_id])
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dental_examination
      @dental_examination = DentalExamination.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dental_examination_params
      params.require(:dental_examination).permit(:date, :caries_findings_clinical, :caries_findings_patient, :tsl_findings, :perio_findings, :soft_tiss_findings, :patient  )
    end
end
