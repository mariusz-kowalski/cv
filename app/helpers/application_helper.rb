module ApplicationHelper
  def flash_class type
    case type
      when 'notice'  then "alert alert-info"
      when 'info'    then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error'   then "alert alert-danger"
      when 'warning' then "alert alert-warning"
      when 'alert'   then "alert alert-danger"
      when 'danger'  then "alert alert-danger"
      else "alert alert-info"
    end
  end

  def flash_icon type
    case type
      when 'success' then "glyphicon glyphicon-ok"
      when 'notice'  then "glyphicon glyphicon-info-sign"
      when 'info'    then "glyphicon glyphicon-info-sign"
      when 'warning' then "glyphicon glyphicon-bell"
      when 'error'   then "glyphicon glyphicon-warning-sign"
      when 'alert'   then "glyphicon glyphicon-warning-sign"
      when 'danger'  then "glyphicon glyphicon-warning-sign"
      else "glyphicon glyphicon-info-sign"
    end
  end

  def resource_path object
    controller = "#{object.class.name}sController".constantize
    polymorphic_path controller.object_for_polymorphic_path(object)
  end

  def edit_resource_path object
    controller = "#{object.class.name}sController".constantize
    edit_polymorphic_path controller.object_for_polymorphic_path(object)
  end

  # def resource_name
  # 	# controller = "#{object.class.name}sController".constantize
  # end
end
