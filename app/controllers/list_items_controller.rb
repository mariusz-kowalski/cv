class ListItemsController < BasicInformationsController
  
  def model
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
    id_key, id = params.find{ |key, value| key =~ /.+_id/ }
    information_class = id_key[0...-3].classify.constantize
    @the_list ||= information_class.find(id)
  end
end
