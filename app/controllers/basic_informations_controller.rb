class BasicInformationsController < ApplicationController
  before_action :set_basic_information, only: [:show, :edit, :update, :destroy]
  
  def new
    @basic_information = BasicInformation.new
  end

  def create
    if @basic_information = BasicInformation.create(basic_information_params)
      redirect_to basic_informations_path, notice: "Information created"
    else
      render :new
    end
  end

  def index
    @basic_informations = BasicInformation.all
  end

  def show
  end

  def edit
  end

  def update
    if @basic_information.update basic_information_params
      redirect_to basic_informations_path, notice: "Information created"
    else
      render :edit
    end
  end

  def destroy
    if @basic_information.delete
      redirect_to basic_informations_path, notice: "Information deleted"
    else
      redirect_to basic_informations_path, alert: "Can't delete information"
    end
  end

  private

  def basic_information_params
    params.require(:basic_information).permit(:name, :information_type, :value, :description)
  end

  def set_basic_information
    @basic_information = BasicInformation.find params['id']
  end
end
