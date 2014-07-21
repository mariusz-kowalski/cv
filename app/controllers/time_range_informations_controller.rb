class TimeRangeInformationsController < BasicInformationsController
  include TimeRangeControllerConcern
  # def form_object
  # 	@information.build_time_range unless @information.time_range
  # 	@information
  # end

  # def information_params
  # 	params.require(resource_name).permit(:name, :information_type, :value, :description, time_range_attributes: [:begin, :end])
  # end
end
