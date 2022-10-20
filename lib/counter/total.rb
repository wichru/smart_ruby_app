# frozen_string_literal: true

module Counter
  class Total
    def initialize(page_visits)
      @page_visits = page_visits
    end

    def call
      page_visits.transform_values(&:size)
    end

    attr_reader :page_visits
  end
end
