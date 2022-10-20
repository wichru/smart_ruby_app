# frozen_string_literal: true

module Errors
  class MissingFileError < StandardError
    def initialize(msg = 'No such file or directory')
      super
    end
  end
end
