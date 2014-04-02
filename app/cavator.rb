require 'rubygems'
require 'pathname'

ENV['BUNDLE_GEMFILE'] ||= File.expand_path("../../Gemfile",
                                           Pathname.new(__FILE__).realpath)
$LOAD_PATH << File.expand_path("../../lib",
                               Pathname.new(__FILE__).realpath)
require 'bundler'
require 'bundler/setup'

module Cavator
  class App
    def initialize(*args)
      options = args.shift
      if options.length == 1 && options.first.kind_of?(Hash)
        options.first.each { |k, v| ENV[k] = v }
      end
    end
  end
end
