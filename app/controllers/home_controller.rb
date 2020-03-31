class HomeController < ApplicationController
  def index
    customers = Customer.all
    @customers = customers.map { |customer| UserViewObject.new(customer) }
  end
end
