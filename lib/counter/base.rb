# frozen_string_literal: true

module Counter
  class Base
    def initialize(page_visits)
      @page_visits = page_visits
    end

    def call
      page_visits.transform_values do |ip_array|
        count(ip_array)
      end
    end

    attr_reader :page_visits

    protected

    def count(_ip_array)
      raise NoMethodError, 'Counter failed'
    end
  end
end
