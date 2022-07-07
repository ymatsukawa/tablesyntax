# frozen_string_literal: true

require_relative "tablesyntax/version"
require_relative "tablesyntax/main"

module Tablesyntax
  def self.run(*options)
    Tablesyntax::Main.new(options).run
  rescue StandardError
    puts "USAGE: TODO"
  end
end
