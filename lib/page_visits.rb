class PageVisits
  def initialize(file_lines)
    @file_lines = file_lines
    @hash_array = Hash.new { [] }
  end

  def call
    page_visits_hash(file_lines)
  end

  attr_reader :file_lines, :hash_array

  private

  def page_visits_hash(file_lines)
    file_lines.each_with_object(hash_array) do |line, hash|
      path, ip = line.split
      hash[path] <<= ip
    end
  end
end
