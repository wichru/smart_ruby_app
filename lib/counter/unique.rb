# frozen_string_literal: true

module Counter
  class Unique < Base
    protected

    def count(ip_array)
      ip_array.uniq.size
    end
  end
end
