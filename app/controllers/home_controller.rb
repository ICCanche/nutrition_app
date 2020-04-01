class HomeController < ApplicationController
  helper TimeZoneConverter
  
  def index
    if (!params.has_key?(:status) or params[:status].eql?"all")
      @diets = Diet.order(created_at: :desc).page params[:page]
    else
      @diets = Diet.where(status: params[:status]).order(created_at: :desc).page params[:page]
    end
  end
end
