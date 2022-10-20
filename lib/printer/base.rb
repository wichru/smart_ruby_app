# frozen_string_literal: true

module Printer
  class Base
    def initialize(visits_array)
      @visits_array = visits_array
    end

    def call
      visits_array.each do |visit|
        print(visit)
      end
    end

    attr_reader :visits_array

    protected

    def print(_visit)
      raise NoMethodError, 'Printer failed'
    end
  end
end
