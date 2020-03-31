class HomeController < ApplicationController
  def index
    @diets = Diet.order(created_at: :desc)
  end
end
