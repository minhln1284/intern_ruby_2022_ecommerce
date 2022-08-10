module CategoryHelper
  def parent_category categories
    output = []
    categories.each do |cate|
      input = [cate.name, cate.id.to_s]
      output.append input
    end
    return output
  end
end
