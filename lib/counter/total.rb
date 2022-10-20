# frozen_string_literal: true

module Counter
  class Total < Base
    protected

    def count(ip_array)
      ip_array.size
    end
  end
end
