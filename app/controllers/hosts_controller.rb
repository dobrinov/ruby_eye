class HostsController < ApplicationController

  def index
    @hosts = Host.all
  end

  def show
    @host = Host.new(params[:hostname])
  end
end
