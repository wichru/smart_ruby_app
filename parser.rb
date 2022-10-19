# frozen_string_literal: true

class Parser
  class MissingFileError < StandardError; end

  def initialize(file_path)
    @file_path = file_path
    @lines = []
    @hash_array = Hash.new { [] }
  end

  def call
    raise_error unless File.exist? file_path

    prepare_hash read_lines
  end

  attr_reader :file_path, :lines, :hash_array

  private

  def raise_error
    raise MissingFileError, 'No such file or directory'
  end

  def read_lines
    File.foreach file_path do |line|
      lines << line.strip
    end
    lines
  end

  def prepare_hash(lines)
    lines.each_with_object(hash_array) do |line, hash|
      path, ip = line.split
      hash[path] <<= ip
    end
  end
end
