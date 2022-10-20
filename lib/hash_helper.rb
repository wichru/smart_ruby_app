module HashHelper
  module_function

  def sort(obj)
    obj.sort_by { |_k, v| -v }.to_h
  end
end
