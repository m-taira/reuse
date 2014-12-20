class HomeController < ApplicationController
  def index
    @taken_items = Item.all_taken
    @given_items = Item.all_given
  end
end
