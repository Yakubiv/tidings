module Admin
  class DashboardsController < Admin::BaseController
    def show
      @posts = Post.all
      @contacts = Contact.all
    end
  end
end