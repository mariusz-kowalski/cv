class ListItemsController < BasicInformationsController
  # helper_method :list_items_path
  
  def model
    # ListItem
    the_list.list_items
  end

  private

  def form_object
    [the_list, @information]
  end

  def resources_path
    # polymorphic_path [ the_list, model ]
    polymorphic_path [ the_list, ListItem ]
  end

  def resource_path object
    polymorphic_path [ the_list, object ]
  end

  def edit_resource_path object
    edit_polymorphic_path [ the_list, object ]
  end

  def the_list
    @the_list ||= ListInformation.find(params["list_information_id"])
  end
end
