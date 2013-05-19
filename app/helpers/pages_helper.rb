#encoding: utf-8
module PagesHelper
  def row_start?(index)
    index == 0 || (index % 3) == 0
  end

  def row_end?(index)
    index != 0 && (index % 3) == 0
  end

end #PagesHelper
