class SubscriptionsController < ApplicationController
  def create
    Subscription.create(subscription_params)
    flash[:notice] = 'subscribed_modal'
    redirect_to request.referer
  end

  private

  def subscription_params
    params.require(:subscription)
          .permit(:email)
  end
end
