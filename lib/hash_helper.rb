# frozen_string_literal: true

module HashHelper
  module_function

  def sort(obj)
    obj.sort_by { |_k, v| -v }
  end
end
