class FileReader
  def initialize(file_path)
    @file_path = file_path
    @lines = []
  end

  def call
    raise_error unless File.exist? file_path

    read_lines
  end

  attr_reader :file_path, :lines

  private

  def raise_error
    raise Errors::MissingFileError
  end

  def read_lines
    File.foreach file_path do |line|
      lines << line.strip
    end
    lines
  end
end
