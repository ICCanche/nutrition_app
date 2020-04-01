class HomeController < ApplicationController
  helper TimeZoneConverter
  
  def index
    @diets = Diet.order(created_at: :desc)
  end
end
