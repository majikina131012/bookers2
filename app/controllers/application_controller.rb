class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def search
    @q = params[:q]
    @books = Book.ransack(title_or_body_cont: @q).result
    @users = User.ransack(name_cont: @q).result
  end

  # def search
  #   @q = Book.ransack(params[:q])
  #   @books = @q.result(distinct: true)
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
