class HomeController < ApplicationController
  def index

    @products = Product.where(featured: true, live: true).limit(9).order(position: :asc)
  end
end
