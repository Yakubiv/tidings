class HomesController < ApplicationController
  include Pagy::Backend

  layout 'home'

  def index
    @home_facade = HomeFacade.new
    @pagy, @posts = pagy(@home_facade.posts, anchor: '#posts')
  end
end
