module CvHelper
  def pos label, &block
    render layout: 'pos', locals: {label: label}, &block
  end

  def small_pos label, &block
    render layout: 'small_pos', locals: {label: label}, &block
  end

  def li label, &block
    render layout: 'li', locals: {label: label}, &block
  end

  def range time_range
    beginning = time_range.begin.to_s(:month_year)
    ending = time_range.end ? time_range.end.to_s(:month_year) : 'continues'
    "#{beginning} - #{ending}"
  end
end
