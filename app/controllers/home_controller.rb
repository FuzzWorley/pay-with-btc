class HomeController < ApplicationController
  def index
    # update at some point to live stores and then featured store
    @stores = Store.all.limit(9)
  end
end
