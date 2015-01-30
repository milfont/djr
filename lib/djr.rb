require "djr/version"

module Djr
  require 'engine' if defined?(Rails) && Rails::VERSION::MAJOR == 4
end
