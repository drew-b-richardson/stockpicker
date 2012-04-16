module ApplicationHelper
  def page_title title
    if title == nil
      "StockPicker"
    else
      "StockPicker | #{title}"
    end
  end
end
