class SiteController < ApplicationController
  def index
    respond_to do |format|
      format.html { redirect_to action: "index", controller: "production_items" }
    end
  end
end
