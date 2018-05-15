class SimplePagesController < ApplicationController
  def index
  end

  def landing_page
    @featured_product = Product.first
  end

  def landing_page
    @products = Product.limit(3)
  end
end

ActionMailer::Base.mail(from: 'from@domain.com', to: 'to@domain.com', subject: "Welcome to My Awesome Site", body: 'I am the email body.').deliver_now
  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(from: @email, to: 'pakman1126@yahoo.com', subject: "A new contact form message from #{@name}", body: @message).deliver_now
  end
