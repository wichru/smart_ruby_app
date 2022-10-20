# frozen_string_literal: true

module Printer
  class Total < Base
    protected

    def print(visit)
      puts "#{visit[0]} #{visit[1]} visits"
    end

    attr_reader :visits_array
  end
end
