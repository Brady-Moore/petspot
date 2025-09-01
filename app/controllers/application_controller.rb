class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_amenities
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # For sign up
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    # For account update (Devise edit profile)
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  private

  def set_amenities
    @amenities = Amenity.all
    @groups = @amenities.in_groups(4, false)
  end
end
