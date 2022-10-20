module Printer
  class Total
    def initialize(visits_array)
      @visits_array = visits_array
    end

    def call
      puts '> list of webpages with most page views ordered from most pages views to less page views'
      puts '------------------------'
      visits_array.each do |element|
        puts "#{element[0]} #{element[1]} visits"
      end
      puts '------------------------'
    end

    attr_reader :visits_array
  end
end
