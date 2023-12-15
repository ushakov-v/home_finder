class ApplicationController < ActionController::Base

    rescue_from CanCan:: AccessDenied do |exception|
        redirect_to errors_no_rights_path, :alert => exception.message
        end

    before_action :set_render_cart
    before_action :initialize_cart

    def set_render_cart
      @render_cart = true
    end
  
    def initialize_cart
      @cart ||= Cart.find_by(id: session[:cart_id])
  
      if @cart.nil?
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
    end
  end