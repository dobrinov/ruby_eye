class IndexesController < ApplicationController
  def show
    @measurements = Index.measurements
  end
end
