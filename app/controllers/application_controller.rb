class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Getting category  name

  protected

  private
  helper_method :category_name
  def category_name
      Category.all
  end

   include ApplicationHelper  
end
