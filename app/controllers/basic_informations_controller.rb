class BasicInformationsController < ApplicationController
  before_action :set_information, only: [:show, :edit, :update, :destroy]
  
  helper_method :resource_name
  helper_method :form_object
  helper_method :resource_path
  helper_method :edit_resource_path

  def new
    @information = model.new
  end

  def create
    @information = model.create(information_params)
    if @information.save
      redirect_to resources_path, notice: "Information created"
    else
      render :new
    end
  end

  def index
    @informations = model.all
  end

  def show
  end

  def edit
  end

  def update
    if @information.update information_params
      redirect_to resources_path, notice: "Information created"
    else
      render :edit
    end
  end

  def destroy
    if @information.delete
      redirect_to resources_path, notice: "Information deleted"
    else
      redirect_to resources_path, alert: "Can't delete information"
    end
  end

  private

  def set_information
    @information = model.find params['id']
  end
  
  def information_params
    params.require(resource_name).permit(:name, :information_type, :value, :description)
  end

  def resource_name
    model.name.underscore
  end

  #override this method if this controller controls nested resources
  def resources_path
    polymorphic_path model
  end

  def resource_path object
    polymorphic_path object
  end

  def edit_resource_path object
    edit_polymorphic_path object
  end

  # override this method in child class

  def model
    BasicInformation
  end

  def form_object
    @information
  end
end
