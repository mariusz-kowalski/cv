class ListsController < ApplicationController
  def update
    list = List.find params['id']
    if list.update_ordinal params['list']['ordinal']
      redirect_to polymorphic_path([list.superinformation, ListItem]), 
        notice: 'List order changed'
    else
      redirect_to polymorphic_path([list.superinformation, ListItem]), 
        alert: "Error: #{list.error.message}"
    end
  end
end
