class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :all_pages

  def routing_error
    p "routing error path: #{params[:path]}"
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end

  def all_pages
    @all = Page.all.order(:priority)
    @published_pages = @all.where('published_at <= ?', Time.now)
    @unpublished_pages = @all.where('published_at > ?', Time.now)
  end
end
