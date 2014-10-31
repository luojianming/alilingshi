class ApplicationController < ActionController::Base
  before_filter :set_i18n_locale_from_params
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  protected
    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
            I18n.locale = params[:locale]
        else
          flash.now[:notice] = "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

    def default_url_options
      { :locale => I18n.locale }
    end

  private

  def current_cart
    if (session[:cart_id] != nil)
      cart = Cart.find_by_cart_id(session[:cart_id])
    else
      cart = Cart.create(:cart_id => SecureRandom.hex(8))
      session[:cart_id] = cart.cart_id
    end
    cart
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.fullpath
  end
end
