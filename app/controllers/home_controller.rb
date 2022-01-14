class HomeController < ApplicationController
  def index
    @stores = Store.all.limit(9)
  end
end
