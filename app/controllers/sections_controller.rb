class SectionsController < ApplicationController
  # before_action :set_section, only: [:show, :edit, :update, :destroy]

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
    @sections = Section.where(home_id: params[:id])
    puts "\n\n\tSECTIONS!!!!! : #{@sections}\n"
    @sections
    # render json: @sections
    render "show.json.jbuilder"
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

  def createAll
    Section.create(home_id: params[:id], name: "Welcome", image_url: "",
      content: "Example: Welcome to my home! I am very glad that you have chosen to stay here. The front door code is '64894' and there is a spare phsyical keys hanging by the backyard patio door. Feel free to use the garage to park (there is a button to open the garage next to the front door. I hope that you enjoy your stay, and don't hesitate to text, email, or call if you have any questions. Help yourself to the fridge :)")
    Section.create(home_id: params[:id], name: "WiFi", image_url: "",
      content: "Example: The wifi password is HonoredGuests15. There is also datajacks and network cables around the house. ")
    Section.create(home_id: params[:id], name: "Parking", image_url: "",
      content: "Example: Feel free to use the garage! You will have to come inside and press the button near the front door in order to open the garage door. There should also be ample street parking. Street cleaning is tuesday mornings from 11am-4pm on our block, so please park in the garage to avoid a ticket.")
    Section.create(home_id: params[:id], name: "Attractions", image_url: "",
      content: "Example: Brian's Coffee and Tea is just down the block, they have the worlds best bagels (aside from NY)")
    Section.create(home_id: params[:id], name: "Contact Me", image_url: "",
      content: "Example: If you have any questions, please don't hesitate to get in touch with me at 646.646.6464 or at BestBnB@BnBeWelcomed.com")
    Section.create(home_id: params[:id], name: "Emergencies", image_url: "",
      content: "Example: Dial 911! There is a fire extinguisher in the backyard shed, under the kitchen sink, in the garage next to the washing machine, and in every bathroom under the sink.")
    Section.create(home_id: params[:id], name: "Checkout", image_url: "",
      content: "Example: Thank you so much for staying with us! I hope that you enjoyed yourself. I am open to feedback, so please let me know if you have any suggestions! When you are ready to leave, just close all the windows and hang up the spare keys by the back door or leave them on the table. You can leave your linens wherever and I will take care of them for you. ")
    render json: Home.find_by(id: params[:id]).sections
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

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_section
  #     @section = Section.find(params[:id])
  #   end

  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def section_params
  #     params.require(:section).permit(:name, :image_url, :home_id, :content)
  #   end
end
