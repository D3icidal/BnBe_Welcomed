class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  # GET /sections
  # GET /sections.json
  #TODO limit to current house with restful urls
  def index
    @sections = Section.all
    render json: @sections
  end


  # Section.create!(home_id: 187, name: "Welcome", image_url: "",content: "testttt")
  # Section.create!(home_id: 187, name: "WiFi", image_url: "",content: "testttt")
  # Section.create!(home_id: 187, name: "Parking", image_url: "",content: "testttt")
  # Section.create!(home_id: 187, name: "Nearby Attractions", image_url: "",content: "testttt")
  # Section.create!(home_id: 187, name: "Contact Me", image_url: "",content: "testttt")
  # Section.create!(home_id: 187, name: "Emergencies", image_url: "",content: "testttt")
  # Section.create!(home_id: 187, name: "Checkout", image_url: "",content: "testttt")

  # GET /sections/1
  # GET /sections/1.json
  def show
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(section_params)   
    if @section.save
      render json: @section, status: :created
    else
      render json: {errors: @section.errors}, status: :unprocessable_entity
    end    
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update    
    if @section.update(section_params)
      render json: @section, status: :ok
    else
      render json: {errors: @section.errors}, status: :unprocessable_entity
    end    
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    if @section.destroy    
      render json: "Destroyed", status: :ok
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:name, :image_url, :home_id, :content)
    end
end
