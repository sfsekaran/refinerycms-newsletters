class NewslettersController < ApplicationController

  def thank_you
  end

  def index
    @newsletter = Newsletter.new
  end

  def create
    
    @newsletter = Newsletter.new(params[:newsletter])
    if @newsletter.save
      redirect_to thank_you_newsletters_url
    else
      render :action => 'index'
    end
  end

end
