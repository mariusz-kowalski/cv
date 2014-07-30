class BasicInformationsController < ApplicationController
  before_action :set_information, only: [:show, :edit, :update, :destroy]

  helper_method :form_object
  helper_method :resource_name

  def new
    @information = model.new
  end

  def create
    @information = model.create(information_params)
    if @information.save
      redirect_to resources_path, notice: 'Information created'
    else
      render :new
    end
  end

  def index
    if model == BasicInformation
      @informations = model.where(select_params.merge(type: nil)).default_order
    else
      if select_params.any?
        @informations = model.where(select_params).default_order
      else
        @informations = model.all.default_order
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @information.update information_params
      redirect_to resources_path, notice: 'Information created'
    else
      render :edit
    end
  end

  def destroy
    if @information.destroy
      redirect_to resources_path, notice: 'Information deleted'
    else
      redirect_to resources_path, alert: "Can't delete information"
    end
  end

  private

  def set_information
    @information = model.find params['id']
  end

  def information_params
    params.require(resource_name).permit(
      :name,
      :information_type,
      :value,
      :description)
  end

  def select_params
    params.permit(
      :name,
      :information_type,
      :value,
      :description)
  end

  def resource_name
    model.name.underscore
  end

  # override this method if this controller controls nested resources
  def resources_path
    polymorphic_path model
  end

  def self.object_for_polymorphic_path object
    object
  end

  def self.class_for_polymorphic_path
    Kernel.const_get self.class.name[0...-11]
  end

  def model
    Kernel.const_get self.class.name[0...-11]
  end

  def form_object
    @information
  end
end
