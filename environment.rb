# frozen_string_literal: true

# Load ruby dependencies
require 'pry'

# Load app modules and classes
require_relative 'lib/log_parser'
require_relative 'lib/file_reader'
require_relative 'lib/errors/missing_file_error'
require_relative 'lib/page_visits_builder'
require_relative 'lib/counter/base'
require_relative 'lib/counter/total'
require_relative 'lib/counter/unique'
require_relative 'lib/hash_helper'
require_relative 'lib/printer/base'
require_relative 'lib/printer/total'
require_relative 'lib/printer/unique'
