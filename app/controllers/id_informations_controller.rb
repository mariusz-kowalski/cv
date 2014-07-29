class IdInformationsController < ApplicationController
  before_action :set_id_informations
  def show
    respond_to do |format|
      format.html
      format.fragment { render 'show.html.haml', format: :html, layout: nil }
    end
  end

  def edit
  end

  def update
    
    if @id_informations.update id_informations_params
      redirect_to id_informations_show_path, notice: 'Informations updated'
    else
      render :edit
    end
  end
  private
  def id_informations_params
    params.require(:id_informations).permit(:first_name, :last_name, :photo)
  end
  def set_id_informations
    @id_informations = IdInformations.find_by(id: 1) || IdInformations.new(id: 1)
  end
end
