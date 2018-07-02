class HomesController < ApplicationController
  layout 'home'

  def index
    @home_facade = HomeFacade.new
  end
end
