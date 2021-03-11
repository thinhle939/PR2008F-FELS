class Admin::ApplicationController < ApplicationController
  before_action :admin?
  layout "admin/application"

  def admin?
    unless current_user.present?
      redirect_to root_path
    end
  end

end
