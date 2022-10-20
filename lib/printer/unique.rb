# frozen_string_literal: true

module Printer
  class Unique < Base
    protected

    def print(visit)
      puts "#{visit[0]} #{visit[1]} unique visits"
    end

    attr_reader :visits_array
  end
end
