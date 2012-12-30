class OverviewGeneratorsController < ApplicationController
  def create
    @command  = "rake generate:maps"
    @c_output = `#{@command}`
  end
end