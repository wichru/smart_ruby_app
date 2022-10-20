# frozen_string_literal: true

class LogParser
  include Dry::Monads

  def initialize(file_path)
    @file_path = file_path
  end

  def call
    Success(file_path)
      .bind(method(:read_file))
      .bind(method(:build_page_visits))
      .bind(method(:count_page_visits))
      .bind(method(:sort_visits))
      .bind(method(:print_result))
  end

  attr_reader :file_path

  private

  def read_file(file_path)
    file_lines = FileReader.new(file_path).call

    Success(file_lines)
  end

  def build_page_visits(file_lines)
    page_visits_hash = PageVisitsBuilder.new(file_lines).call

    Success(page_visits_hash)
  end

  def count_page_visits(page_visits_hash)
    total_visits = Counter::Total.new(page_visits_hash).call
    unique_visits = Counter::Unique.new(page_visits_hash).call

    Success(total_visits:, unique_visits:)
  end

  def sort_visits(visits)
    total_sorted = HashHelper.sort(visits[:total_visits])
    unique_sorted = HashHelper.sort(visits[:unique_visits])

    Success(total_sorted:, unique_sorted:)
  end

  def print_result(result)
    puts '------------------------'
    puts '> list of webpages with most page views ordered from most pages views to less page views'
    puts '------------------------'
    Printer::Total.new(result[:total_sorted]).call
    puts '------------------------'
    puts '> list of webpages with most unique page views also ordered'
    puts '------------------------'
    Printer::Unique.new(result[:unique_sorted]).call
    puts '------------------------'
  end
end
